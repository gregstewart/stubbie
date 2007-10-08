<cfcomponent hint="The FileSystemObject component provides methods to access and interact with the filesystem.">

	<cfset variables.rootpath = "">
	<cfset variables.directorySeparator = "">

	<cffunction name="init" access="public" output="false" returnType="FileSystemObject" hint="This method initializes the component setting the root path and directory separator that are used by the other methods.">
		<cfargument name="rootPath" type="string" required="false" default="" />
		<cfargument name="directorySeparator" required="true" type="string" />

		<cfset variables.directorySeparator = arguments.directorySeparator>
		<cfif directoryExists(arguments.rootPath) and directoryExists(arguments.rootpath)>
			<cfset variables.rootpath = arguments.rootpath>
		</cfif>

		<cfreturn this />

	</cffunction>



	<cffunction name="list" access="public" returntype="query" output="false" hint="The list method returns a list of all files in the directory path that match the given filter. It adds fullpath and package columns to the standard query returned by the cfdirectory tag. If the recurse argument is set to true, the method will also return the contents of all sub-directories of the rootpath.">
		<cfargument name="recursive" default="false" type="boolean" />
		<cfargument name="filter" default="" type="string" />
    	<cfargument name="prefix" required="yes">
		<cfargument name="path" required="false" default="#variables.rootpath#" />

		<cfset var qFiles = "">
		<cfset var qSubDirectoryFiles = "">
		<cfset var aPath = arrayNew(1)>
		<cfset var aPackage = arrayNew(1)>
		<cfset var aQueries = arrayNew(1)>
		<cfset var i = 0>
		<cfset var packageStart = "">
		<cfset var subPath = "">
		<cfset var package = "">

		<cfset filter = lcase(replace(arguments.filter,'*','%','all'))>

		<cfdirectory action="list" directory="#arguments.path#" name="qFiles">

		<cfif qFiles.recordcount>

			<cfset subPath = prefix & directorySeparator & replaceNoCase(arguments.path,variables.rootpath,'')>
			<cfset package = listChangeDelims(subPath,'.','/\')>

			<cfset arraySet(aPath,1,qFiles.recordcount,arguments.path)>
			<cfset arraySet(aPackage,1,qFiles.recordcount,package)>

		</cfif>

		<cfset queryAddColumn(qFiles,'fullpath',aPath)>
		<cfset queryAddColumn(qFiles,'package',aPackage)>


		<cfif arguments.recursive>
			<cfloop query="qFiles">
				<cfif qFiles.type is 'dir'>
					<cfset arrayAppend(aQueries,this.list(true,arguments.filter,arguments.prefix,arguments.path & variables.directorySeparator & qFiles.name))>
				</cfif>
			</cfloop>


			<cfloop from="1" to="#arrayLen(aQueries)#" index="i">
				<cfset q = aQueries[i]>
				<cfif q.recordCount>
					<cfquery dbtype="query" name="qFiles">
						SELECT *
						FROM qFiles
						<cfif len(arguments.filter)>
						WHERE LOWER(qFiles.name) LIKE('#filter#')
						</cfif>

						UNION

						SELECT *
						FROM q
						<cfif len(arguments.filter)>
						WHERE LOWER(q.name) LIKE('#filter#')
						</cfif>

						ORDER BY fullpath
					</cfquery>
				</cfif>
			</cfloop>

		</cfif>

		<cfquery dbtype="query" name="qFiles">
			SELECT *
			FROM qFiles
			<cfif len(arguments.filter)>
				WHERE LOWER(qFiles.name) LIKE('#filter#')
			</cfif>
		</cfquery>

		<cfreturn qFiles>

	</cffunction>

	<!---
	 Mimics the cfdirectory, action=&quot;list&quot; command.
	 Updated with final CFMX var code.
	 Fixed a bug where the filter wouldn't show dirs.

	 @param directory 	 The directory to list. (Required)
	 @param filter 	 Optional filter to apply. (Optional)
	 @param sort 	 Sort to apply. (Optional)
	 @param recurse 	 Recursive directory list. Defaults to false. (Optional)
	 @return Returns a query.
	 @author Raymond Camden (ray@camdenfamily.com)
	 @version 2, April 8, 2004
	--->
	<cffunction name="directoryList" output="false" returnType="query">
		<cfargument name="directory" type="string" required="true">
		<cfargument name="filter" type="string" required="false" default="">
		<cfargument name="sort" type="string" required="false" default="">
		<cfargument name="recurse" type="boolean" required="false" default="false">
		<!--- temp vars --->
		<cfargument name="dirInfo" type="query" required="false">
		<cfargument name="thisDir" type="query" required="false">
		<cfset var path="">
	    <cfset var temp="">

		<cfif not recurse>
			<cfdirectory name="temp" directory="#directory#" filter="#filter#" sort="#sort#">
			<cfreturn temp>
		<cfelse>
			<!--- We loop through until done recursing drive --->
			<cfif not isDefined("dirInfo")>
				<cfset dirInfo = queryNew("attributes,datelastmodified,mode,name,size,type,directory")>
			</cfif>
			<cfset thisDir = directoryList(directory,filter,sort,false)>
			<cfif server.os.name contains "Windows">
				<cfset path = "\">
			<cfelse>
				<cfset path = "/">
			</cfif>
			<cfloop query="thisDir">
				<cfset queryAddRow(dirInfo)>
				<cfset querySetCell(dirInfo,"attributes",attributes)>
				<cfset querySetCell(dirInfo,"datelastmodified",datelastmodified)>
				<cfset querySetCell(dirInfo,"mode",mode)>
				<cfset querySetCell(dirInfo,"name",name)>
				<cfset querySetCell(dirInfo,"size",size)>
				<cfset querySetCell(dirInfo,"type",type)>
				<cfset querySetCell(dirInfo,"directory",directory)>
				<cfif type is "dir">
					<!--- go deep! --->
					<cfset directoryList(directory & path & name,filter,sort,true,dirInfo)>
				</cfif>
			</cfloop>
			<cfreturn dirInfo>
		</cfif>
	</cffunction>

</cfcomponent>