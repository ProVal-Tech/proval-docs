---
id: '72784e6a-7954-4965-871a-ab9a0a13d298'
title: 'Soji Disk Cleaner'
title_meta: 'Soji Disk Cleaner'
keywords: ['disk', 'cleanup', 'utility', 'soji', 'endpoint']
description: 'This document outlines the Stack-Standard Disk Cleanup utility that utilizes agnostic content Soji to perform a cleanup of all drives on the target endpoint. It includes a sample run log, process description, and expected output from the cleanup operation.'
tags: ['cleanup', 'disk']
draft: false
unlisted: false
---

## Summary

**Stack-Standard Disk Cleanup Utility**  
This utility uses agnostic content [Soji](https://proval.itglue.com/DOC-5078775-10338558) to perform a cleanup of all drives on the target endpoint.

## Sample Run

| Time                     | Process                | Status                                                                                                    | Link                      |
|--------------------------|------------------------|-----------------------------------------------------------------------------------------------------------|---------------------------|
| 11:55:40 am 13-Jul-22    | Soji - Disk Cleaner    | Success THEN                                                                                              | provaltech.com/dan.hicks  |
| 11:55:40 am 13-Jul-22    | Soji - Disk Cleaner    | Name,VolumeCacheCount,DirectoryCount,RemainingDirectoryCount,CleanedDirectoryCount,FileCount,RemainingFileCount,CleanedFileCount,EstimatedSpaceToFree,FreedSpace,MissedSpace C:/,8,0,0,0,0,0,0,44347950,44347950,0 | provaltech.com/dan.hicks  |
| 11:55:40 am 13-Jul-22    | Soji - Disk Cleaner    | Comment at THEN step 13                                                                                    | provaltech.com/dan.hicks  |
| 11:55:40 am 13-Jul-22    | Soji - Disk Cleaner    | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/204148124820810/GetFiles/SojiLogs/Soji-summary.csv with the new contents from %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs/soji-summary.csv in THEN step 12. | provaltech.com/dan.hicks  |
| 11:55:39 am 13-Jul-22    | Soji - Disk Cleaner    | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/204148124820810/GetFiles/SojiLogs/Soji-volumecaches.csv with the new contents from %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs/soji-volumecaches.csv in THEN step 11. | provaltech.com/dan.hicks  |
| 11:55:39 am 13-Jul-22    | Soji - Disk Cleaner    | Raw exe Data: [11:55:33 INF] Starting up Soji! [11:55:33 INF] No drive letters passed in. Starting drive detection. [11:55:33 INF] 1 valid drive letter detected. [11:55:33 INF] Getting volume caches for drive C:/ [11:55:33 INF] Skipping return of Active Setup Temp Folders as it is currently using no space. [11:55:33 WRN] Failed to initialize the VolumeCache object at 'SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/VolumeCaches/BranchCache'. Deactivating! [11:55:33 WRN] Releasing the VolumeCache object at 'SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/VolumeCaches/BranchCache'. [11:55:33 WRN] Failed to initialize the VolumeCache object at 'SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/VolumeCaches/Content Indexer Cleaner'. Deactivating! [11:55:33 WRN] Releasing the VolumeCache object at 'SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/VolumeCaches/Content Indexer Cleaner'. [11:55:33 INF] Skipping return of Diagnostic Data Viewer database files as it is currently... | provaltech.com/dan.hicks  |
| 11:55:39 am 13-Jul-22    | Execute Shell command - Get Results to Variable | Success THEN                                                                                              | provaltech.com/dan.hicks  |
| 11:55:36 am 13-Jul-22    | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: cd %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner && %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/soji.exe --csv >"c:/provaltech/commandresults-1375566225.txt" 2>&1 | provaltech.com/dan.hicks  |
| 11:55:33 am 13-Jul-22    | Soji - Disk Cleaner    | .NET 6.0 Update Results: .NET 6 Desktop Runtime already installed.                                        | provaltech.com/dan.hicks  |
| 11:55:33 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                              | provaltech.com/dan.hicks  |
| 11:55:33 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks  |
| 11:55:31 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "%ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/update-net6.ps1" >"c:/provaltech/psoutputtmp.txt" | provaltech.com/dan.hicks  |
| 11:55:31 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                        | provaltech.com/dan.hicks  |
| 11:55:31 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/update-net6.ps1                                                  | provaltech.com/dan.hicks  |
| 11:55:31 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                                                     | provaltech.com/dan.hicks  |
| 11:55:30 am 13-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                    | provaltech.com/dan.hicks  |
| 11:55:25 am 13-Jul-22    | Execute Powershell Command | Success THEN                                                                                              | provaltech.com/dan.hicks  |
| 11:55:24 am 13-Jul-22    | Execute Powershell Command-0011 | Powershell command completed!                                                                             | provaltech.com/dan.hicks  |
| 11:55:24 am 13-Jul-22    | Execute Powershell Command-0011 | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name SojiDiskCleaner" "" | provaltech.com/dan.hicks  |
| 11:55:24 am 13-Jul-22    | Execute Powershell Command-0010 | Not sending output to variable.                                                                           | provaltech.com/dan.hicks  |
| 11:55:24 am 13-Jul-22    | Execute Powershell Command-0008 | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name SojiDiskCleaner" | provaltech.com/dan.hicks  |
| 11:55:24 am 13-Jul-22    | Execute Powershell Command-0008 | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name SojiDiskCleaner | provaltech.com/dan.hicks  |
| 11:55:23 am 13-Jul-22    | Execute Powershell Command-0002 | Powershell is present.                                                                                    | provaltech.com/dan.hicks  |
| 11:55:22 am 13-Jul-22    | Execute Powershell Command | Success THEN                                                                                              | provaltech.com/dan.hicks  |
| 11:55:22 am 13-Jul-22    | Execute Powershell Command-0011 | Powershell command completed!                                                                             | provaltech.com/dan.hicks  |
| 11:55:21 am 13-Jul-22    | Execute Powershell Command-0011 | Executing powershell "" -Command "Remove-Item %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs/* -Recurse -Force" "" | provaltech.com/dan.hicks  |
| 11:55:21 am 13-Jul-22    | Execute Powershell Command-0010 | Not sending output to variable.                                                                           | provaltech.com/dan.hicks  |
| 11:55:21 am 13-Jul-22    | Execute Powershell Command-0008 | New command variable is: -Command "Remove-Item %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs/* -Recurse -Force" | provaltech.com/dan.hicks  |
| 11:55:21 am 13-Jul-22    | Execute Powershell Command-0008 | Custom commands detected as Remove-Item %ProgramData%/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs/* -Recurse -Force | provaltech.com/dan.hicks  |
| 11:55:20 am 13-Jul-22    | Execute Powershell Command-0002 | Powershell is present.                                                                                    | provaltech.com/dan.hicks  |
| 11:55:12 am 13-Jul-22    | Run Now - Soji - Disk Cleaner | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Soji - Disk Cleaner to run at Jul 13 2022 11:55AM | provaltech.com/dan.hicks  |

## Process

Describe the steps the script performs to accomplish the desired task. Note that if this script is just a front-end for a piece of agnostic content, then you can insert a link to the documentation for that content here instead.

## Output

- Agent Procedure Log
- $env:ProgramData/_automation/AgentProcedure/SojiDiskCleaner/SojiLogs
- View / Custom Fields
- etc.

Attach the content XML VSA Export to this document.



