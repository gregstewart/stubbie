<cfcomponent name="StubbieTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.Stubbie" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.Stubbie =  CreateObject("component","stubbie.Stubbie").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testCompareMethods" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateStubObject" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.Stubbie, "createStubObject") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testBuild" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testWriteMethods" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testParseConfigFile" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.Stubbie, "parseConfigFile") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateTearDown" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testParseMethods" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.Stubbie, "parseMethods") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateSetup" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateBuildFile" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.Stubbie, "createBuildFile") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
