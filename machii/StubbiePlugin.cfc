<!---
 
  Copyright (c) 2007, Greg Stewart
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
		
--->

<!---    
    
    Example usage/parameter description:
    
    <plugin name="stubbiePlugin" type="stubbie.machii.StubbiePlugin">
		<parameters>
		
			<!-- mach-ii property name that holds the path to the coldspring config file 
				 default: 'StubbieComponentsLocation' -->
			<parameter name="configFilePropertyName" value="StubbieComponentRelativePath"/>
			
			<!-- flag to indicate whether supplied config path is relative or absolute 
				 default: false (absolute path) -->
			<parameter name="configFilePathIsRelative" value="true"/>
			
		</parameters>
	</plugin>
    
--->
<cfcomponent displayname="StubbieMachiiPlugin" extends="MachII.framework.Plugin" hint="I do initialization tasks.">

	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfset var pm = getAppManager().getPropertyManager() />

		<!--- determine the location of the config file --->
		<cfset var configFilePath = getParameter('stubbieConfigFilePath') />
		<cfset variables.stubbie = CreateObject("component","stubbie.Stubbie").init(ExpandPath(configFilePath)) />
		
    </cffunction>

	<!--- PUBLIC FUNCTIONS --->
	<cffunction name="preProcess" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		
        <cfset variables.stubbie.build()/>
    </cffunction>

	<cffunction name="preEvent" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
        <!--- <cfoutput>&nbsp;SimplePlugin.preEvent()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postEvent" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postEvent()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="preView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postProcess" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postProcess()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="handleException" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfargument name="exception" type="MachII.util.Exception" required="true" />
		<cfoutput>&nbsp;InitializationPlugin.handleException()<br /></cfoutput>
		<cfoutput>#arguments.exception.getMessage()#</cfoutput>
	</cffunction>

</cfcomponent>
