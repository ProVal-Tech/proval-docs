---
id: '57e946ce-9686-4212-879c-3a3cfbdd76df'
title: 'Google Chrome Bookmark Export Procedure'
title_meta: 'Google Chrome Bookmark Export Procedure'
keywords: ['chrome', 'bookmark', 'export', 'onedrive', 'documents']
description: 'This procedure retrieves the currently logged-in user’s Google Chrome bookmark file from their APPDATA folder and exports it to OneDrive if available, or to the local documents folder if OneDrive is not accessible. Detailed logs of the execution process are provided for tracking purposes.'
tags: ['backup', 'chrome', 'onedrive']
draft: false
unlisted: false
---
## Summary

Procedure grabs the currently logged in users Bookmark file from their user APPDATA folder for Google Chrome. It then exports it to OneDrive if available, or the local documents folder if not.

## Example Agent Procedure Log

| Time                     | Action                                                 | Status                                 | User          |
|--------------------------|--------------------------------------------------------|----------------------------------------|---------------|
| 2:46:43 pm 19-Sep-23     | Google Chrome Bookmark - Export                        | Success THEN                           | derek.joniak  |
| 2:46:43 pm 19-Sep-23     | Google Chrome Bookmark - Export-0001                  | Success THEN                           | derek.joniak  |
| 2:46:43 pm 19-Sep-23     | Google Chrome Bookmark - Export-0001                  | Log: 2023-09-19 15:19:14 - Chrome bookmarks exported as JSON to C:/Users/Test/OneDrive - ProVal Technologies Inc/Documents successfully. | derek.joniak  |
| 2:46:43 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)     | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0001 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0002 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0011 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0014 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0015 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0016 | Success THEN                           | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab. | derek.joniak  |
| 2:46:42 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/570617411282368/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0011 | Executing 64-bit Powershell command as User: "" -command "& $env:ProgramData/_automation/AgentProcedure/FeatureUpdate/ChromeBookmarkExport.ps1" >"c:/kworking/psoutputtmp.txt" | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0012 | Success THEN                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0013 | Success THEN                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0013 | Sending output to global variable.     | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0003 | Success ELSE                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0008 | Success THEN                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0009 | Success ELSE                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0010 | Success ELSE                           | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0008 | Custom commands detected as "& $env:ProgramData/_automation/AgentProcedure/FeatureUpdate/ChromeBookmarkExport.ps1" | derek.joniak  |
| 2:46:40 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0003 | No powershell file variable detected.  | derek.joniak  |
| 2:46:37 pm 19-Sep-23     | Execute Powershell Command (64-bit, Run As User)-0002 | Powershell is present.                 | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command                             | Success THEN                           | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command-0001                        | Success THEN                           | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command-0002                        | Success THEN                           | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command-0011                        | Success THEN                           | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command-0012                        | Success ELSE                           | derek.joniak  |
| 2:46:36 pm 19-Sep-23     | Execute Powershell Command-0011                        | Powershell command completed!          | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0011                        | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromeBookmarkExport" "" | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0009                        | Success THEN                           | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0010                        | Success ELSE                           | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0010                        | Not sending output to variable.        | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0007                        | Success THEN                           | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0008                        | Success THEN                           | derek.joniak  |
| 2:46:34 pm 19-Sep-23     | Execute Powershell Command-0008                        | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromeBookmarkExport" | derek.joniak  |
| 2:46:33 pm 19-Sep-23     | Execute Powershell Command-0008                        | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromeBookmarkExport | derek.joniak  |
| 2:46:33 pm 19-Sep-23     | Execute Powershell Command-0003                        | Success THEN                           | derek.joniak  |
| 2:46:33 pm 19-Sep-23     | Execute Powershell Command-0004                        | Success ELSE                           | derek.joniak  |
| 2:46:31 pm 19-Sep-23     | Execute Powershell Command-0002                        | Powershell is present.                 | derek.joniak  |
| 2:46:23 pm 19-Sep-23     | Run Now - Google Chrome Bookmark - Export              | Admin derek.joniak scheduled procedure Run Now - Google Chrome Bookmark - Export to run at Sep 19 2023 3:46PM |               |

## Dependencies

If the desired save location is OneDrive, ensure the documents folder is there. OneDrive/Documents  
Otherwise the script will fallback to the local documents folder.

## Output

Procedure Logfiles and other outputs











