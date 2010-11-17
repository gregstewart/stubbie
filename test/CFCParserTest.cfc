<cfcomponent name="CFCParserTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.CFCParser" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.CFCParser =  CreateObject("component","stubbie.CFCParser").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testParse" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetMethods" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "getMethods") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testRemoveComments" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "removeComments") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testFindTags" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "findTags") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetArguments" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "getArguments") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetProperties" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "getProperties") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetTagAttributes" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.CFCParser, "getTagAttributes") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
