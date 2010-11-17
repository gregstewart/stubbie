<cfcomponent name="StubbiePluginTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.StubbiePlugin" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.StubbiePlugin =  CreateObject("component","stubbie.machii.StubbiePlugin").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testPostEvent" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testPostView" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testPreView" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testPreProcess" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testConfigure" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testHandleException" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testPostProcess" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testPreEvent" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
