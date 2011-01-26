<cfcomponent name="FrameworkWrapperTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.FrameworkWrapper" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.FrameworkWrapper =  CreateObject("component","stubbie.cfunit.FrameworkWrapper").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testGetTestSuite" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetObject" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.FrameworkWrapper, "setObject") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetTest" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.FrameworkWrapper, "setTest") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetTestCase" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateCheckScopes" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetTestSuite" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.FrameworkWrapper, "setTestSuite") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetTestCase" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.FrameworkWrapper, "setTestCase") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetTestRunner" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetObject" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetTest" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetTestRunner" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCreateTestSuite" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetDummyTestMethod" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
