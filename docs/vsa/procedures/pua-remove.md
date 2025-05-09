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

This is a VSA implementation of the agnostic script [Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443). It manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.

**PUA List:** [PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)

<span style={{color:'red'}}>**EXERCISE EXTREME CAUTION - Removing system components may cause system instability.**</span>

## Sample Run

| Time                     | Action                                          | Result                                                                                                                | User                          |
|--------------------------|-------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|-------------------------------|
| 11:53:35 am 27-Mar-25   | PUA Remove                                     | Success THEN                                                                                                         | provaltech.com/ram.kishor      |
| 11:53:34 am 27-Mar-25   | PUA Remove-0009                               | Log: 2025-03-27 11:52:27 INIT ... Microsoft.3DBuilder ... Checking the lists ...                                   | provaltech.com/ram.kishor      |
| 11:53:34 am 27-Mar-25   | PUA Remove-0001                               | 2025-03-27 11:53:30 INIT ... Microsoft.BingNews ... found Microsoft.BingNews in Microsoft bloat apps list ...      | provaltech.com/ram.kishor      |
| 11:53:34 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                         | provaltech.com/ram.kishor      |
| 11:53:34 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in the Agent's Documents tab of the server. | provaltech.com/ram.kishor      |
| 11:53:34 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/204148124820810/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/ram.kishor      |
| 11:53:29 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%/_automation/AgentProcedure/PUARemove/Remove-PUA.ps1 -Remove Microsoft.BingNews\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/ram.kishor      |
| 11:53:29 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                   | provaltech.com/ram.kishor      |
| 11:53:29 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/PUARemove/Remove-PUA.ps1 -Remove Microsoft.BingNews | provaltech.com/ram.kishor      |
| 11:53:29 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                                                                 | provaltech.com/ram.kishor      |
| 11:53:29 am 27-Mar-25   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                               | provaltech.com/ram.kishor      |
| 11:53:26 am 27-Mar-25   | Execute Powershell Command                     | Success THEN                                                                                                         | provaltech.com/ram.kishor      |
| 11:53:25 am 27-Mar-25   | Execute Powershell Command-0011                | Powershell command completed!                                                                                        | provaltech.com/ram.kishor      |
| 11:53:25 am 27-Mar-25   | Execute Powershell Command-0011                | Executing Powershell \"\" -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove\" \"\" | provaltech.com/ram.kishor      |
| 11:53:25 am 27-Mar-25   | Execute Powershell Command-0010                | Not sending output to variable.                                                                                     | provaltech.com/ram.kishor      |
| 11:53:25 am 27-Mar-25   | Execute Powershell Command-0008                | New command variable is: -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove\" | provaltech.com/ram.kishor      |
| 11:53:25 am 27-Mar-25   | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -name PUARemove | provaltech.com/ram.kishor      |
| 11:53:24 am 27-Mar-25   | Execute Powershell Command-0002                | Powershell is present.                                                                                               | provaltech.com/ram.kishor      |
| 11:53:16 am 27-Mar-25   | Run Now - PUA Remove                           | Admin provaltech.com/ram.kishor scheduled procedure Run Now - PUA Remove to run at Mar 27 2025 11:53 AM               |                               |

## Variables

| Variable Name     | Description                                                                                  | Syntax                              |
|-------------------|----------------------------------------------------------------------------------------------|-------------------------------------|
| RemoveAll         | Remove all bloatware from the machine. Can be used with #exceptions#                       | 'app1','app2','app3'                |
| RemoveSpecific    | Remove specific apps per client request. It allows bypassing the PUA List to remove any installed AppxPackage.                                                | 'app1','app2','app3'                |
| category          | Remove all apps from a specific category. Multiple categories can be selected. Valid Categories: MsftBloatApps, ThirdPartyBloatApps | 'MsftBloatApps','ThirdPartyBloatApps'   |
| exceptions        | Set app exceptions for #RemoveAll# and #category# (Apps you want to keep)                 | 'app1','app2','app3'                |

## Process

Runs the agnostic script [Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443) with the defined parameters.

## Output

AP Log
