<cfcomponent displayname="Abstract FrameworkFactory">
 
	<cffunction name="init" access="public" returntype="FrameworkFactory">		
		<cfargument name="app" type="string" required="true" />
        <cfargument name="path" type="string" required="true" />
        <cfargument name="packageRoot" type="string" required="true" />
        <cfargument name="rootPath" type="string" required="true" />
        
        <cfset variables.app = arguments.app/>
        <cfset variables.packageRoot = arguments.packageRoot/>
        <cfset variables.rootPath = arguments.rootPath/>
        <cfset variables.path = arguments.path/>
        
		<cfreturn this />
	</cffunction>
 
	<cffunction name="getFrameworkWrapper" access="public" returntype="WEB-INF.cftags.component" output="false">
		<cfargument name="factoryType" type="string" required="Yes" />  
		
        <cfset var returnFrameworkWrapper = ""/>
        	  
		<cfswitch expression="#arguments.factoryType#">
            <cfcase value="cfcunit">
                <cfset returnFrameworkWrapper = createObject("component","stubbie.cfcunit.FrameworkWrapper").init(variables.app,variables.path,variables.packageRoot,variables.rootPath)/>
            </cfcase>
            <cfcase value="cfunit">
                <cfset returnFrameworkWrapper = createObject("component","stubbie.cfunit.FrameworkWrapper").init(variables.app,variables.path,variables.packageRoot,variables.rootPath)/>
            </cfcase>
            <cfcase value="mxunit">
                <cfset returnFrameworkWrapper = createObject("component","stubbie.mxunit.FrameworkWrapper").init(variables.app,variables.path,variables.packageRoot,variables.rootPath)/>
            </cfcase>
            <cfdefaultcase>
                <cfthrow message="#arguments.factoryType# is not a recognised/supported Unit test framework" errorcode="INCORRECT_UNIT_TEST_FRAMEWORK"/>
            </cfdefaultcase>
        </cfswitch>
        
        <cfreturn returnFrameworkWrapper/>
	</cffunction>
	
</cfcomponent>
