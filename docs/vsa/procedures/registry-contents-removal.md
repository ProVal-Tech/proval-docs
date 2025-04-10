---
id: 'a6e179d1-ac12-482b-b315-f0fae1b83353'
slug: /a6e179d1-ac12-482b-b315-f0fae1b83353
title: 'Registry contents Removal'
title_meta: 'Registry contents Removal'
keywords: ['registry', 'delete', 'pending', 'operations', 'cleanup']
description: 'This document outlines a script developed to delete all contents of the PendingFileRenameOperations registry. It provides a detailed summary of the script’s functionality, sample run logs, dependencies, process flow, and output information, ensuring users understand how to effectively clear registry entries related to pending file rename operations.'
tags: ['cleanup', 'performance', 'registry', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script is developed to delete all contents of the **PendingFileRenameOperations** registry.

## Sample Run

| Time                     | Action                                               | Status                                           | User                             |
|--------------------------|------------------------------------------------------|-------------------------------------------------|----------------------------------|
| 3:28:32 am 23-Aug-22    | Remove PendingFileRenameOperations                   | Success THEN                                   | provaltech.com/surender.kumar   |
| 3:28:32 am 23-Aug-22    | Remove PendingFileRenameOperations-0002              | All registry content has been cleared.         | provaltech.com/surender.kumar   |
| 3:28:32 am 23-Aug-22    | Remove PendingFileRenameOperations-0001              | PendingFileRenameOperations REG_MULTI_SZ       | provaltech.com/surender.kumar   |
| 3:28:32 am 23-Aug-22    | Execute Shell command - Get Results to Variable      | Success THEN                                   | provaltech.com/surender.kumar   |
| 3:28:30 am 23-Aug-22    | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: Reg Query "HKLM/SYSTEM/CurrentControlSet/Control/Session Manager" | findstr "PendingFileRenameOperations" >"c:/provaltech/commandresults-1828873436.txt" 2>&1 | provaltech.com/surender.kumar   |
| 3:28:29 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)  | Success THEN                                   | provaltech.com/surender.kumar   |
| 3:28:28 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/surender.kumar   |
| 3:28:28 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/746610212782388/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/surender.kumar   |
| 3:28:26 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: -file "%ProgramData%/_automation/AgentProcedure/ren_ops.ps1" "" >"c:/provaltech/psoutputtmp.txt" | provaltech.com/surender.kumar   |
| 3:28:26 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.             | provaltech.com/surender.kumar   |
| 3:28:25 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0007 | No command variable detected.                   | provaltech.com/surender.kumar   |
| 3:28:25 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0006 | Powershell command specified as %ProgramData%/_automation/AgentProcedure/ren_ops.ps1 | provaltech.com/surender.kumar   |
| 3:28:24 am 23-Aug-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                          | provaltech.com/surender.kumar   |
| 3:28:23 am 23-Aug-22    | Write text to file                                   | Success THEN                                   | provaltech.com/surender.kumar   |
| 3:28:22 am 23-Aug-22    | Write text to file-0002                              | Overwrite enabled and file exists - deleting before write process. | provaltech.com/surender.kumar   |
| 3:28:22 am 23-Aug-22    | Remove PendingFileRenameOperations-0001              | Initiated command to clear registry contents    | provaltech.com/surender.kumar   |
| 3:28:22 am 23-Aug-22    | Remove PendingFileRenameOperations-0001              | Registry is Present                             | provaltech.com/surender.kumar   |
| 3:28:22 am 23-Aug-22    | Remove PendingFileRenameOperations                   | HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Session Manager PendingFileRenameOperations REG_MULTI_SZ ... | provaltech.com/surender.kumar   |
| 3:28:21 am 23-Aug-22    | Execute Shell command - Get Results to Variable      | Success THEN                                   | provaltech.com/surender.kumar   |
| 3:28:19 am 23-Aug-22    | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: Reg Query "HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Session Manager" /v PendingFileRenameOperations >"c:/provaltech/commandresults-166058979.txt" 2>&1 | provaltech.com/surender.kumar   |
| 3:28:11 am 23-Aug-22    | Run Now - Remove PendingFileRenameOperations          | Admin provaltech.com/surender.kumar scheduled procedure Run Now - Remove PendingFileRenameOperations to run at Aug 23 2022 3:28 AM | provaltech.com/surender.kumar   |

## Dependencies

No

## Process

- The agent checks the registry for the command "PendingFileRenameOperations" to see if the registry exists.
- If the registry exists, it deletes all content from the registry and re-checks whether all content has been removed.

## Output

- Agent Procedure Log

Procedure_PendingFileRenameOperations_-_Registry_contents_Removal.xml
## Attachments
[Procedure_Remove_PendingFileRenameOperations.xml](<../../../static/attachments/itg/10533914/Procedure_Remove_PendingFileRenameOperations.xml>)
