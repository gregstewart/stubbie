<cfcomponent name="FrameworkFactoryTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.FrameworkFactory" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.FrameworkFactory =  CreateObject("component","stubbie.FrameworkFactory").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetFrameworkWrapper" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
