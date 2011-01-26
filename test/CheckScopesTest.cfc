<cfcomponent name="CheckScopesTest" hint="I check all scopes" extends="mxunit.framework.TestCase">

	<cffunction name="testCheckScopes" returntype="void" access="public" output="false">
		<cfset var varScopeChecker = CreateObject("component","stubbie.VarScopeChecker.VarScopeChecker")>
		<cfset var aErrors = varScopeChecker.check( "/Users/gregstewart/Sites/coldfusion/stubbie" ) />
		<cfset var isEmpty = evaluate("ArrayLen(aErrors) eq 0") />
		<cfset var message = arrayLen( aErrors ) & " local variable(s) were not var scoped. DETAILS: " & aErrors.toString() />

		<cfset assertTrue(true, isEmpty, message) />
	</cffunction>

</cfcomponent>
