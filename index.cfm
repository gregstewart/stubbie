<cfset configFilePath = ExpandPath('./config.xml')/>

<cfset stubbie = CreateObject("component","Stubbie").init(configFilePath)>
<cfset stubbie.build()/>
