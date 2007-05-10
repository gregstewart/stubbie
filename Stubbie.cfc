<cfcomponent output="false">
	<!--- Author: gregstewart - Date: 4/13/2007 --->
	<cffunction name="init" output="false" access="public" returntype="Stubbie" hint="I initialise the component">
		<cfargument name="configFilePath" type="string" required="true" hint="config file"/>
		
        <cfset var tmpyStruct = StructNew()/>
        <cfset parseConfigFile(arguments.configFilePath)/>
               
        <cfset variables.paths = ArrayNew(1)/>
        <cfset tmpyStruct["prefix"] = variables.app>
        <cfset tmpyStruct["path"] = variables.path>
        <cfset ArrayAppend(variables.paths,tmpyStruct) />
        
        <cfset variables.fso = createObject("component","FileSystemObject").init(variables.path,"/")/>
        <cfset variables.util = createObject("component","Util").init(variables.path,variables.packageRoot,"/",variables.paths)/>
		
        <cfswitch expression="#variables.unitTestFramework#">
            <cfcase value="cfcunit">
                <cfset variables.allTestsPath = variables.path&"/test/AllTests.cfc"/>
                <cfset variables.frameworkObj = createObject("component","stubbie.cfcunit.FrameworkWrapper").init(variables.app,variables.path,variables.packageRoot,variables.rootPath)/>
            </cfcase>
            <cfcase value="cfunit">
                <cfset variables.allTestsPath = variables.path&"/test/cfUnitTestRunner.cfm"/>
                <cfset variables.frameworkObj = createObject("component","stubbie.cfunit.FrameworkWrapper").init(variables.app,variables.path,variables.packageRoot,variables.rootPath)/>
            </cfcase>
            <cfdefaultcase>
                <cfthrow message="#variables.unitTestFramework# is not a recognised/supported Unit test framework"/>
            </cfdefaultcase>
        </cfswitch>
        
		<cfreturn this/>
	</cffunction>
	
    <!--- Author: gregstewart - Date: 4/13/2007 --->
	<cffunction name="build" output="false" access="public" returntype="void" hint="I build the stub test objects">
		
		<cfset var qryFileList = variables.fso.list(true,'*.cfc',app)/>
		<cfset var tmpyPath = ""/>
		<cfset var testForDir = ""/>
		<cfset var stubFile = ""/>
        <cfset var testCFCs = ArrayNew(1)/>
        
		
        <!--- Strip out everything that is not our model folder from our query --->
        <cfquery name="qryFileList" dbtype="query">
	        SELECT * 
            FROM qryFileList
            WHERE package NOT LIKE '%.test%' 
            <!--- AND package NOT LIKE '%.controller%' 
            AND package NOT LIKE '%.filters%' 
            AND package NOT LIKE '%.plugins%' 
            AND Name NOT LIKE '%Listener%' --->
        </cfquery>
        
		<cfif qryFileList.recordCount>
			
			<cfif NOT DirectoryExists(variables.path & "/test")>
				<cfdirectory action="create" directory="#variables.path#/test">
			<cfelse>
				<cfdirectory directory="#variables.path#/test" action="list" name="testForDir" recurse="true"/>
			</cfif>
			
			<cfloop query="qryFileList">
				
				<cfset tmpyPath = Replace(qryFileList.fullpath,variables.app,variables.app&"/test")/>
				<cfset tmpyFile = Replace(Replace(qryFileList.fullpath&"/"&qryFileList.Name,variables.app,variables.app&"/test"),".cfc","Test.cfc")/>
				
				<cfif NOT DirectoryExists(tmpyPath)>
					<cflog text="Created #tmpyPath#"/>
					<cfdirectory action="create" directory="#tmpyPath#">
				</cfif>
				
				<cfset createStubObject(tmpyFile,FileExists(tmpyFile))/>
				
			</cfloop>
            
            <cfif NOT FileExists(variables.path&"/test/CheckScopes.cfc")>
	            <!--- Create the check scopes --->
				<cfset createCheckScopes()/>
            </cfif>
            
            <!--- Create the test suite --->
			<cfset variables.frameworkObj.createTestSuite(testCFCs)/>
        </cfif>
		
	</cffunction>
	
    <!--- Author: gregstewart - Date: 4/18/2007 --->
	<cffunction name="parseConfigFile" output="false" access="private" returntype="void" hint="I parse the xml config file">
	    <cfargument name="config" type="string" required="true" />
	    
	    <cfset var fileContents = ""/>
	    <cfset var xmlDoc = ""/>
	    
	    <cffile action="read" file="#arguments.config#" variable="fileContents">
	    
	    <cfset xmlDoc = XmlParse(fileContents)/>
	    
	    <!--- TODO: Consider the need to convert \ to / --->
	    <cfset variables.app = xmlDoc.stubbie.config.appName.XmlAttributes["value"]/>
	    <cfset variables.rootPath = Replace(xmlDoc.stubbie.config.appPath.XmlAttributes["value"],"\","/","ALL")/>
		<cfset variables.path = variables.rootPath & variables.app/>
	    <cfset variables.packageRoot = xmlDoc.stubbie.config.packageRoot.XmlAttributes["value"]/>
        <cfset variables.unitTestFramework = xmlDoc.stubbie.config.unitTestFramework.XmlAttributes["value"]/>
	</cffunction>
    
	<!--- Author: gregstewart - Date: 4/13/2007 --->
	<cffunction name="createStubObject" output="false" access="private" returntype="string" hint="I create the stub test Object">
		<cfargument name="FilePath" type="string" required="true" />
		<cfargument name="FileExists" type="boolean" required="true" />
        
        <cfset var tmpyStubName = ListLast(arguments.FilePath,"/")/>
		<cfset var tmpyTestCFC = ""/>
        <cfset var testMethods = ""/>
        <cfset var existingMethods = ""/>
        <cfset var cfcMethods = ""/>
		
        <cfset testMethods = parseMethods(Replace(Replace(arguments.FilePath,"Test.cfc",".cfc"),"/test",""))/>
        <!--- TODO: add update capibility here, if the tets object already exists we just want to append a new method --->
        <cfif arguments.FileExists>
            <cfset existingMethods = parseMethods(arguments.FilePath)/>
            
            <cfset testMethods = compareMethods(existingMethods,testMethods)/>
        </cfif>
        
        <cfset testMethods = writeMethods(testMethods)/>
        
        <cfsavecontent variable="tmpyTestCFC">
&lt;cfcomponent name="<cfoutput>#Replace(tmpyStubName,".cfc","")#</cfoutput>" extends="<cfoutput>#variables.frameworkObj.getTestCase()#</cfoutput>"&gt;
	
	&lt;cfproperty name="variables.<cfoutput>#Replace(tmpyStubName,"Test.cfc","")#</cfoutput>" type="WEB-INF.cftags.component" hint=""/&gt;
	&lt;!--- Test properties go here ---&gt;
	
    <cfif NOT arguments.FileExists><cfoutput>#createSetup()#</cfoutput></cfif>
	
	&lt;!--- Tests go here ---&gt;
    <cfoutput>#testMethods#</cfoutput>
    
    <cfif NOT arguments.FileExists><cfoutput>#createTearDown()#</cfoutput></cfif>
	
&lt;/cfcomponent&gt;
		</cfsavecontent>
        
        <cfset tmpyTestCFC = Replace(Replace(tmpyTestCFC,"&lt;","<","ALL"),"&gt;",">","ALL")/>
        
        <cffile action="write" file="#arguments.FilePath#" output="#trim(tmpyTestCFC)#"/>
        <cflog text="Created #arguments.FilePath#">
		<cfreturn arguments.FilePath/>
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/16/2007 --->
	<cffunction name="parseMethods" output="false" access="private" returntype="struct" hint="I'll parse the current component and return a struct of cfc information">
	    <cfargument name="cfcPath" type="string" required="true" />
	    
	    <cfset var componentDetails = variables.util.getCFCInformation(arguments.cfcPath)/>
	    
        <cfreturn componentDetails/>
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/23/2007 --->
	<cffunction name="compareMethods" output="false" access="public" returntype="struct" hint="I compare the test cfc to it's equivalent and look for new methods. If found I add them to the test struct">
	    <cfargument name="existing" type="struct" required="true" />
	    <cfargument name="cfcMethods" type="struct" required="true" />
	    
        <cfset var i = ""/>
                    
        <cfloop collection="#arguments.cfcMethods.methods#" item="i">
            <cfif NOT StructKeyExists(arguments.existing.methods,"test"&i)>
                <cfset StructInsert(arguments.existing.methods,i,arguments.cfcMethods.methods[i])/>
            </cfif>
        </cfloop>
        
	    <cfreturn arguments.existing />
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/23/2007 --->
	<cffunction name="writeMethods" output="false" access="public" returntype="string" hint="I take the result of the parse method and write it out as a string of test methods">
	    <cfargument name="componentDetails" type="struct" required="true" />
	    
	    <cfset var i = ""/>
	    <cfset var output = ""/>
	    <cfset var methodList = StructKeyList(arguments.componentDetails['methods'])/>
        <cfset var listPos = ListFind(methodList,"setUp")/>
        
        <cfif listPos gt 0>
	        <!--- Let's sort this list of methods a little --->
	        <cfset methodList = ListDeleteAt(methodList,listPos)/>
	        <cfset listPos = ListFind(methodList,"tearDown")/>
	        <cfset methodList = ListDeleteAt(methodList,listPos)/>
	        <cfset methodList = ListPrepend(methodList,"setUp")/>
	        <cfset methodList = ListAppend(methodList,"tearDown")/>
        </cfif>
        
        <cfsavecontent variable="output">
            <cfloop list="#methodList#" index="i">
                <cfif REFind("^(test)",arguments.componentDetails['methods'][i]['name']) OR REFind("tearDown|setUp",arguments.componentDetails['methods'][i]['name'])><!--- TODO: The regex for tearDown and setUp could be better --->
    <cfoutput>#trim(arguments.componentDetails['methods'][i]['fulltag'])#</cfoutput>
                <cfelse>
	<cfoutput>#trim(variables.frameworkObj.getDummyTestMethod(arguments.componentDetails['methods'][i]['name']))#</cfoutput>        
                </cfif>	        
            </cfloop>
	    </cfsavecontent>
	    
	    <cfreturn trim(output)/>
	
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/24/2007 --->
	<cffunction name="createSetup" output="false" access="public" returntype="string" hint="I create the setup method">
	    
	    <cfset var output = ""/>
	    
	    <cfsavecontent variable="output">
	&lt;cffunction name="setUp" returntype="void" access="private" output="false" hint="I set up any test data or test requirements"&gt;  
	    &lt;!--- Test set up goes here ---&gt;
	&lt;/cffunction&gt;
	    </cfsavecontent>
	    
	    <cfreturn trim(output)/>
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/24/2007 --->
	<cffunction name="createTearDown" output="false" access="public" returntype="string" hint="I create the setup method">
	    
	    <cfset var output = ""/>
	    
	    <cfsavecontent variable="output">
	&lt;cffunction name="tearDown" output="false" access="private" returntype="void" hint="I tear down any test data"&gt;
		&lt;!--- Test tear down goes here ---&gt;
	&lt;/cffunction&gt;
	    </cfsavecontent>
	    
	    <cfreturn trim(output)/>
	</cffunction>
    
    <!--- Author: gregstewart - Date: 4/17/2007 --->
	<cffunction name="createCheckScopes" output="false" access="private" returntype="void" hint="I create the test object for checking scopes">
	    <cfset var output = ""/>
	    
        <cfsavecontent variable="output">
&lt;cfcomponent name="CheckScopes" hint="I check all scopes" extends="<cfoutput>#variables.frameworkObj.getTestCase()#</cfoutput>"&gt;

	&lt;cffunction name="testCheckScopes" returntype="void" access="public" output="false"&gt;  
		&lt;cfset var varScopeChecker = CreateObject("component","stubbie.VarScopeChecker.VarScopeChecker")&gt;
		&lt;cfset var aErrors = varScopeChecker.check( "<cfoutput>#variables.path#</cfoutput>" ) /&gt;		
		&lt;cfset var isEmpty = evaluate("ArrayLen(aErrors) eq 0") /&gt;
		&lt;cfset var message = "#arrayLen( aErrors )# local variable(s) were not var scoped. DETAILS: #aErrors.toString()#" /&gt;
		
		&lt;cfset assertEqualsBoolean(true, isEmpty, message) /&gt;
	&lt;/cffunction&gt;

&lt;/cfcomponent&gt;
	    </cfsavecontent>
	    
	    <cfset output = Replace(Replace(output,"&lt;","<","ALL"),"&gt;",">","ALL")/>
	    
	    <cffile action="write" file="#variables.path#/test/CheckScopes.cfc" output="#trim(output)#"/>
	    <cflog text="Create Test Suite: #variables.path#/test/CheckScopes.cfc"/>
	
	</cffunction>

    <!--- Author: gregstewart - Date: 4/17/2007 --->
	<cffunction name="createBuildFile" output="false" access="private" returntype="void" hint="CFC Unit Ant">
	    <cfset var output = ""/>
	
	    <cfsavecontent variable="output">
	&lt;project default="test" name="MyTest"&gt;
	   &lt;property name="cfcUnitLib" value c:/workspace/cfcunit/lib /&gt;
	   &lt;property name="hostname" value="localhost " /&gt;
	 
	   &lt;taskdef name="cfcUnit" classname="org.cfcunit.ant.CFCUnitTask" classpath="${cfcUnitLib}/ant- cfcunit.jar" /&gt;
	
	   &lt;target name="test"&gt;
	      &lt;cfcUnit hostname="${hostname}" testcase="org.cfcunit.tests.iapa06-alltests" verbose="true" haltonfailure="true" haltonerror="true" showstacktrace="true" /&gt;
	   &lt;/target&gt;
	&lt;/project&gt;
	    </cfsavecontent>
	</cffunction>
</cfcomponent>