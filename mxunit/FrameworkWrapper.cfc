<cfcomponent hint="I am the mxunit specific test wrapper" output="false">
    <!--- Author: gregstewart - Date: 4/19/2007 --->
	<cffunction name="init" output="false" access="public" returntype="FrameworkWrapper" hint="I initialise the component">
        <cfargument name="app" type="string" required="true" />
        <cfargument name="path" type="string" required="true" />
        <cfargument name="packageRoot" type="string" required="true" />
        <cfargument name="rootPath" type="string" required="true" />

        <cfscript>
	        variables.app = arguments.app;
	        variables.path = arguments.path;
	        variables.packageRoot = arguments.packageRoot;
	        variables.rootPath = arguments.rootPath;
        </cfscript>

        <cfset setTestCase("mxunit.framework.TestCase")/>
        <cfset setObject("mxunit.framework.TestCase")/>
        <cfset setTest("any")/>
        <cfset setTestSuite("mxunit.framework.TestSuite")/>
        <cfset setTestRunner("")/>

	    <cfreturn this/>
	</cffunction>

    <!--- Author: gregstewart - Date: 4/16/2007 --->
	<cffunction name="createTestSuite" output="false" access="public" returntype="void" hint="I create a test suite CFC for all of the components that were created">
	    <cfargument name="testCFCs" type="array" required="true" />

        <cfset var output = ""/>
	    <cfset var i = 0/>
	    <cfset var packagePath = ""/>

        <cfif variables.packageRoot neq "">
            <cfset packagePath = variables.packageRoot&"."/>
        </cfif>
		
		<cfsavecontent variable="output">
&lt;cfcomponent name="AllTests" extends="<cfoutput>#getObject()#</cfoutput>" output="false" hint="Runs all unit tests in package."&gt;

    &lt;cffunction name="suite" returntype="<cfoutput>#getTest()#</cfoutput>" access="public" output="false" hint=""&gt;
        &lt;cfset var testSuite = createObject("component","<cfoutput>#getTestSuite()#</cfoutput>").TestSuite() /&gt;

            <cfloop from="1" to="#ArrayLen(testCFCs)#" index="i">
        &lt;cfset testSuite.addAll("<cfoutput>#REReplace(Replace(Replace(testCFCs[i],variables.rootPath,packagePath&variables.app),"/",".","ALL"),"(.cfc)$","")#</cfoutput>") /&gt;
            </cfloop>
        &lt;cfreturn testSuite.run()/&gt;
	&lt;/cffunction&gt;

&lt;/cfcomponent&gt;

	    </cfsavecontent>

	    <cfset output = Replace(Replace(output,"&lt;","<","ALL"),"&gt;",">","ALL")/>

	    <cffile action="write" file="#variables.path#/test/AllTests.cfc" output="#trim(output)#" mode="777"/>
	    
	</cffunction>

    <!--- Author: gregstewart - Date: 4/19/2007 - getter and setter for TestCase --->
	<cffunction name="getTestCase" access="public" output="false" returntype="string">
		<cfreturn variables.my.TestCase/>
	</cffunction>
	<cffunction name="setTestCase" access="private" output="false" returntype="void">
		<cfargument name="TestCase" type="string" required="true" />
		<cfset variables.my.TestCase = arguments.TestCase />
	</cffunction>

	<!--- Author: gregstewart - Date: 4/19/2007 - getter and setter for Object --->
	<cffunction name="getObject" access="public" output="false" returntype="string">
		<cfreturn variables.my.Object/>
	</cffunction>
	<cffunction name="setObject" access="private" output="false" returntype="void">
		<cfargument name="Object" type="string" required="true" />
		<cfset variables.my.Object = arguments.Object />
	</cffunction>

	<!--- Author: gregstewart - Date: 4/19/2007 - getter and setter for Test --->
	<cffunction name="getTest" access="public" output="false" returntype="string">
		<cfreturn variables.my.Test/>
	</cffunction>
	<cffunction name="setTest" access="private" output="false" returntype="void">
		<cfargument name="Test" type="string" required="true" />
		<cfset variables.my.Test = arguments.Test />
	</cffunction>

	<!--- Author: gregstewart - Date: 4/19/2007 - getter and setter for TestSuite --->
	<cffunction name="getTestSuite" access="public" output="false" returntype="string">
		<cfreturn variables.my.TestSuite/>
	</cffunction>
	<cffunction name="setTestSuite" access="private" output="false" returntype="void">
		<cfargument name="TestSuite" type="string" required="true" />
		<cfset variables.my.TestSuite = arguments.TestSuite />
	</cffunction>

    <!--- Author: gregstewart - Date: 4/19/2007 - getter and setter for TestRunner --->
	<cffunction name="getTestRunner" access="public" output="false" returntype="string">
		<cfreturn variables.my.TestRunner/>
	</cffunction>
	<cffunction name="setTestRunner" access="public" output="false" returntype="void">
		<cfargument name="TestRunner" type="string" required="true" />
		<cfset variables.my.TestRunner = arguments.TestRunner />
	</cffunction>

    <!--- Author: gregstewart - Date: 5/1/2007 --->
	<cffunction name="getDummyTestMethod" output="false" access="public" returntype="string" hint="I return the framwork specific test method">
	    <cfargument name="methodName" type="string" required="true" />

	    <cfset var output = ""/>

	    <cfsavecontent variable="output">
	<cfoutput>#chr(10)#</cfoutput>
	&lt;cffunction name="test<cfoutput>#UCase(left(arguments.methodName,1))&right(arguments.methodName,len(arguments.methodName)-1)#</cfoutput>" returntype="void" access="public" output="false"&gt;
	    &lt;cfset assertFalse(true, "Stub test method - put your own test here") /&gt;
	&lt;/cffunction&gt;
	<cfoutput>#chr(10)#</cfoutput>
	    </cfsavecontent>

	    <cfreturn output/>
	</cffunction>

    <!--- Author: gregstewart - Date: 5/10/2007 --->
	<cffunction name="createCheckScopes" output="false" access="public" returntype="void" hint="I create the test object for checking scopes">
	    <cfargument name="path" type="string" required="true" />

        <cfset var output = ""/>

        <cfsavecontent variable="output">
&lt;cfcomponent name="CheckScopesTest" hint="I check all scopes" extends="<cfoutput>#getTestCase()#</cfoutput>"&gt;

	&lt;cffunction name="testCheckScopes" returntype="void" access="public" output="false"&gt;
		&lt;cfset var varScopeChecker = CreateObject("component","stubbie.VarScopeChecker.VarScopeChecker")&gt;
		&lt;cfset var aErrors = varScopeChecker.check( "<cfoutput>#arguments.path#</cfoutput>" ) /&gt;
		&lt;cfset var isEmpty = evaluate("ArrayLen(aErrors) eq 0") /&gt;
		&lt;cfset var message = "#arrayLen( aErrors )# local variable(s) were not var scoped. DETAILS: #aErrors.toString()#" /&gt;

		&lt;cfset assertTrue(true, isEmpty, message) /&gt;
	&lt;/cffunction&gt;

&lt;/cfcomponent&gt;
	    </cfsavecontent>

	    <cfset output = Replace(Replace(output,"&lt;","<","ALL"),"&gt;",">","ALL")/>

	    <cffile action="write" file="#variables.path#/test/CheckScopesTest.cfc" output="#trim(output)#"/>
	    <cflog text="Created: #variables.path#/test/CheckScopesTest.cfc"/>

	</cffunction>

</cfcomponent>