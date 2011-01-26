<cfcomponent name="VarScopeCheckerTest" extends="mxunit.framework.TestCase">

	<!--- Test properties go here --->
	<cfproperty name="variables.VarScopeChecker" type="WEB-INF.cftags.component" hint=""/>
	
    <cffunction name="setUp" returntype="void" access="public" output="false" hint="I set up any test data or test requirements">
	    <!--- Test set up goes here --->
	    
	    <cfset variables.VarScopeChecker =  CreateObject("component","stubbie.VarScopeChecker.VarScopeChecker").init() />
	    
	</cffunction>

	<!--- Tests go here --->
    <cffunction name="testArrayAppendArray" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "arrayAppendArray") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testInit" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testReplaceInStringLiterals" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "replaceInStringLiterals") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetFunctionBody" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getFunctionBody") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testIsAbsoluteDirectory" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "isAbsoluteDirectory") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetParentVariable" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getParentVariable") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetNonVarScopedLocalVariables" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getNonVarScopedLocalVariables") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetVarScopedVariables" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getVarScopedVariables") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetVarSection" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getVarSection") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetFunctionArray" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getFunctionArray") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetFunctionName" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getFunctionName") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testGetVariablesSetInBody" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "getVariablesSetInBody") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testArrayFind" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "arrayFind") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testCheck" returntype="void" access="public" output="false">
	    
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testRecursiveFileList" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "recursiveFileList") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction>
	
	


	<cffunction name="testIsRelativeDirectory" returntype="void" access="public" output="false">
	    <cfset makePublic(variables.VarScopeChecker, "isRelativeDirectory") />
	    
	    <cfset fail("test not yet implemented") />
	</cffunction> 
<cffunction name="tearDown" output="false" access="public" returntype="void" hint="I tear down any test data">
		<!--- Test tear down goes here --->
	</cffunction>
	
</cfcomponent>
