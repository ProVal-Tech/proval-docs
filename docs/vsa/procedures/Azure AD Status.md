---
id: 'ee5b1d9e-eabf-4be4-ad8c-6192b5223cbb'
title: 'Azure AD Status Check Procedure'
title_meta: 'Azure AD Status Check Procedure'
keywords: ['azure', 'ad', 'status', 'check', 'procedure', 'machine']
description: 'This document outlines a procedure to check if a machine is Azure AD joined or registered. It details the logging of actions taken during the process and how to update custom fields based on the machine Azure AD status. The procedure is essential for filtering machines in views based on their Azure AD status.'
tags: ['azure', 'logging']
draft: false
unlisted: false
---

## Summary

This procedure queries the machine to determine if it is Azure AD joined or registered and updates the custom fields as necessary. These machines can then be filtered based on the views.

## Example Agent Procedure Log

| Time                 | Action                                                   | Status                                                 | Contact                               |
|----------------------|----------------------------------------------------------|--------------------------------------------------------|---------------------------------------|
| 2:44:13 pm 3-Apr-23  | Azure AD Status                                          | Success THEN                                           | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:13 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)     | Success THEN                                           | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:12 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:12 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file D:/Kaseya/UserProfiles/483503347503094/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:05 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "if ((& "C:/Windows/System32/dsregcmd.exe" /status | Select-String "WorkplaceJoined" | Select-String "YES") -ne $null) { return $true } else { return $false }" >"c:/kworking/psoutputtmp.txt" | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:05 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                     | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:04 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as if ((& "C:/Windows/System32/dsregcmd.exe" /status | Select-String "WorkplaceJoined" | Select-String "YES") -ne $null) { return $true } else { return $false } | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:04 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                  | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:02 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                 | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:00 pm 3-Apr-23  | Azure AD Status                                          | Checking to see if machine is Azure AD Registered      | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:44:00 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)     | Success THEN                                           | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:59 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:59 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file D:/Kaseya/UserProfiles/483503347503094/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:53 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "if ((& "C:/Windows/System32/dsregcmd.exe" /status | Select-String "AzureAdJoined" | Select-String "YES") -ne $null) { return $true } else { return $false }" >"c:/kworking/psoutputtmp.txt" | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:53 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                     | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:53 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as if ((& "C:/Windows/System32/dsregcmd.exe" /status | Select-String "AzureAdJoined" | Select-String "YES") -ne $null) { return $true } else { return $false } | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:52 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                  | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:50 pm 3-Apr-23  | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                 | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:48 pm 3-Apr-23  | Azure AD Status                                          | Checking to see if machine is Azure AD Joined          | [proaccess@altourage.com](mailto:proaccess@altourage.com) |
| 2:43:18 pm 3-Apr-23  | Run Now - Azure AD Status                               | Admin [proaccess@altourage.com](mailto:proaccess@altourage.com) scheduled procedure Run Now - Azure AD Status to run at Apr 3 2023 7:43 PM | [proaccess@altourage.com](mailto:proaccess@altourage.com) |

## Dependencies

The Agent Procedure relies upon views and custom fields in order to update properly.  
Solution: [https://proval.itglue.com/DOC-5078775-12540674](<../../solutions/EPM - Data Collection - Solution- Azure AD Status.md>)

## Output

Procedure log files and custom fields.
