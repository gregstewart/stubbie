<cfcomponent name="facade">

   <cffunction name="init" access="public" returntype="facade" output="false">
      <cfargument name="scope" type="string" required="true" />
      <cfset var oScopes = getPageContext().getBuiltinScopes()>
      <cfset setScope(oScopes[arguments.scope])>
      <cfreturn this />
   </cffunction>

   <cffunction name="add" access="public" returntype="void" output="false">
      <cfargument name="name" type="string" required="true" />
      <cfargument name="value" type="any" required="true" />
      <cfset variables.scope[arguments["name"]] = arguments["value"]>
   </cffunction>

   <cffunction name="remove" access="public" returntype="void" output="false">
      <cfargument name="name" type="string" required="true" />
      <cfset structDelete(getScope(),arguments["name"],false)>
   </cffunction>

   <cffunction name="get" access="public" returntype="any" output="false">
      <cfargument name="name" type="string" required="true" />
      <cfset var oScope = getScope()>
      <cfreturn oScope[arguments["name"]] />
   </cffunction>

   <cffunction name="exists" access="public" returntype="boolean" output="false">
      <cfargument name="name" type="string" required="true" />
      <cfreturn structKeyExists(getScope(),arguments["name"])>
   </cffunction>

   <cffunction name="setScope" access="private" returntype="void" output="false">
      <cfargument name="scope" type="struct" required="true" />
      <cfset variables["scope"] = arguments["scope"]>
   </cffunction>

   <cffunction name="getScope" access="public" returntype="struct" output="false">
      <cfreturn variables.scope />
   </cffunction>

</cfcomponent>