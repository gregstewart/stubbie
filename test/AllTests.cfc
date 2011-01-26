<cfcomponent name="AllTests" extends="mxunit.framework.TestCase" output="false" hint="Runs all unit tests in package.">

    <cffunction name="suite" returntype="any" access="public" output="false" hint="">
        <cfset var testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite() />

            
        <cfset testSuite.addAll("stubbie.test.CFCParserTest") />
            
        <cfset testSuite.addAll("stubbie.test.FacadeTest") />
            
        <cfset testSuite.addAll("stubbie.test.FileSystemObjectTest") />
            
        <cfset testSuite.addAll("stubbie.test.FrameworkFactoryTest") />
            
        <cfset testSuite.addAll("stubbie.test.StubbieTest") />
            
        <cfset testSuite.addAll("stubbie.test.UtilTest") />
            
        <cfset testSuite.addAll("stubbie.test.VarScopeChecker.VarScopeCheckerTest") />
            
        <cfset testSuite.addAll("stubbie.test.cfcunit.FrameworkWrapperTest") />
            
        <cfset testSuite.addAll("stubbie.test.cfunit.FrameworkWrapperTest") />
            
        <cfset testSuite.addAll("stubbie.test.machii.StubbiePluginTest") />
            
        <cfset testSuite.addAll("stubbie.test.mxunit.FrameworkWrapperTest") />
            
        <cfset testSuite.addAll("stubbie.test.CheckScopesTest") />
            
        <cfreturn testSuite.run()/>
	</cffunction>

</cfcomponent>
