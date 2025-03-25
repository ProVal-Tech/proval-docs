---
id: '7532eff4-e724-471e-96fc-ddfd944bf710'
slug: /7532eff4-e724-471e-96fc-ddfd944bf710
title: 'PUA Remove'
title_meta: 'PUA Remove'
keywords: ['removal', 'pua', 'software', 'uninstall', 'bloatware']
description: 'This document provides a detailed overview of the configurable removal of potentially unwanted applications (PUAs) using an agnostic script. It includes sample run logs, variable descriptions, and the overall process for executing the script effectively.'
tags: ['security', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

Configurable Removal of Potentially Unwanted Applications  
Implementation of Agnostic Content [SWM - Software Uninstall - Agnostic - Remove-PUA](<../../powershell/Remove-PUA.md>)

## Sample Run

| Time                     | Action                                          | Result                                                                                                                | User                          |
|--------------------------|-------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|-------------------------------|
| 11:53:35 am 22-Jul-22   | PUA Remove                                     | Success THEN                                                                                                         | provaltech.com/dan.hicks      |
| 11:53:34 am 22-Jul-22   | PUA Remove-0009                               | Log: 2022-07-22 11:52:27 INIT ... Microsoft.3DBuilder ... Checking the lists ...                                   | provaltech.com/dan.hicks      |
| 11:53:34 am 22-Jul-22   | PUA Remove-0001                               | 2022-07-22 11:53:30 INIT ... Microsoft.BingNews ... found Microsoft.BingNews in Microsoft bloat apps list ...      | provaltech.com/dan.hicks      |
| 11:53:34 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                         | provaltech.com/dan.hicks      |
| 11:53:34 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in the Agent's Documents tab of the server. | provaltech.com/dan.hicks      |
| 11:53:34 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/204148124820810/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks      |
| 11:53:29 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%/_automation/AgentProcedure/PUARemove/Remove-PUA.ps1 -Remove Microsoft.BingNews\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks      |
| 11:53:29 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                   | provaltech.com/dan.hicks      |
| 11:53:29 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/PUARemove/Remove-PUA.ps1 -Remove Microsoft.BingNews | provaltech.com/dan.hicks      |
| 11:53:29 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                                                                 | provaltech.com/dan.hicks      |
| 11:53:29 am 22-Jul-22   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                               | provaltech.com/dan.hicks      |
| 11:53:26 am 22-Jul-22   | Execute Powershell Command                     | Success THEN                                                                                                         | provaltech.com/dan.hicks      |
| 11:53:25 am 22-Jul-22   | Execute Powershell Command-0011                | Powershell command completed!                                                                                        | provaltech.com/dan.hicks      |
| 11:53:25 am 22-Jul-22   | Execute Powershell Command-0011                | Executing Powershell \"\" -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove\" \"\" | provaltech.com/dan.hicks      |
| 11:53:25 am 22-Jul-22   | Execute Powershell Command-0010                | Not sending output to variable.                                                                                     | provaltech.com/dan.hicks      |
| 11:53:25 am 22-Jul-22   | Execute Powershell Command-0008                | New command variable is: -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove\" | provaltech.com/dan.hicks      |
| 11:53:25 am 22-Jul-22   | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove | provaltech.com/dan.hicks      |
| 11:53:24 am 22-Jul-22   | Execute Powershell Command-0002                | Powershell is present.                                                                                               | provaltech.com/dan.hicks      |
| 11:53:16 am 22-Jul-22   | Run Now - PUA Remove                           | Admin provaltech.com/dan.hicks scheduled procedure Run Now - PUA Remove to run at Jul 22 2022 11:53 AM               |                               |

## Variables

| Variable Name     | Description                                                                                  | Syntax                              |
|-------------------|----------------------------------------------------------------------------------------------|-------------------------------------|
| RemoveAll         | Remove all bloatware from the machine. Can be used with #exceptions#                       | 'app1','app2','app3'                |
| RemoveSpecific    | Remove specific apps per client request.                                                    | 'app1','app2','app3'                |
| category          | Remove all apps from a specific category. Multiple categories can be selected. Valid Categories: MsftBloatApps, ThirdPartyBloatApps, WindowsStoreApps, XboxFeaturesApps, NonAppxApps | 'MsftBloatApps','XboxFeatureApps'   |
| exceptions        | Set app exceptions for #RemoveAll# and #category# (Apps you want to keep)                 | 'app1','app2','app3'                |

## Process

Runs the agnostic script [SWM - Software Uninstall - Agnostic - Remove-PUA](<../../powershell/Remove-PUA.md>) with the defined parameters.

## Output

AP Log

## Export Attachment

Attach the content XML VSA Export to this document.


