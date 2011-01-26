<cfcomponent name="UtilTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.Util" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.Util =  CreateObject("component","stubbie.Util").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testUnescapeCreatedCode" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetCFCInformation" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetPackagePathFromRoot" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.Util, "getPackagePathFromRoot") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetFilePath" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetPackageFromPath" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetMachIIAppPath" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testIsFrameworkFile" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetPackageDisplayPrefix" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testSetRootPath" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetDetailURL" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetPackageDisplayName" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
