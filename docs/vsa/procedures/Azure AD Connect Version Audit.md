---
id: 'ee5f96bd-884f-4b2e-af03-9aece0e37d67'
title: 'Azure AD Connect Version Audit'
title_meta: 'Azure AD Connect Version Audit'
keywords: ['azure', 'ad', 'connect', 'version', 'audit', 'custom', 'field']
description: 'This document outlines the procedure for running a script that gathers the Azure AD Connect version number and populates it into a custom field, along with sample runs, dependencies, variables, and process steps involved in the execution.'
tags: ['azure']
draft: false
unlisted: false
---

## Summary

This document describes the process of running a PowerShell script to gather the Azure AD Connect version number and populates it into the custom field `xPVAL Azure AD Version`.

## Sample Run

| Time                     | Action                                                       | Status                                               | User                          |
|--------------------------|--------------------------------------------------------------|-----------------------------------------------------|-------------------------------|
| 2:43:34 pm 6-May-22     | Azure AD Connect Version Audit                               | Success THEN                                        | provaltech.com/dan.hicks      |
| 2:43:34 pm 6-May-22     | Azure AD Connect Version Audit-0001                          | `xPVAL Azure AD Connect Version` custom field has been filled. Version: 1.6.16.0 | provaltech.com/dan.hicks      |
| 2:43:34 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)         | Success THEN                                        | provaltech.com/dan.hicks      |
| 2:43:34 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0016     | PowerShell command complete. Results returned to global variable `#global:psresult#` and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 2:43:34 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0016     | Informational: GetFile command overwrote the server file `C:/Kaseya/UserProfiles/883108838840010/GetFiles/../docs/psoutput.txt` with the new contents from `c:/provaltech/psoutput.txt` in THEN step 3. | provaltech.com/dan.hicks      |
| 2:43:31 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0011     | Executing 64-bit PowerShell command as System: `-file "C:/ProgramData/_automation/AgentProcedure/AzureADConnectVersionAudit/Get-AzureADConnectVersion.ps1" "" >"c:/provaltech/psoutputtmp.txt"` | provaltech.com/dan.hicks      |
| 2:43:31 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0013     | Sending output to global variable.                  | provaltech.com/dan.hicks      |
| 2:43:31 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0007     | No command variable detected.                        | provaltech.com/dan.hicks      |
| 2:43:31 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0006     | PowerShell command specified as `C:/ProgramData/_automation/AgentProcedure/AzureADConnectVersionAudit/Get-AzureADConnectVersion.ps1` | provaltech.com/dan.hicks      |
| 2:43:30 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0002     | PowerShell is present.                              | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)         | Success THEN                                        | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0014     | PowerShell command completed!                       | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0011     | Executing 64-bit PowerShell command as System: `"" -command "New-Item -type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name AzureADConnectVersionAudit"` "" | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0013     | Not sending output to variable.                     | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0008     | Custom commands detected as `New-Item -type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name AzureADConnectVersionAudit` | provaltech.com/dan.hicks      |
| 2:43:29 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0003     | No PowerShell file variable detected.               | provaltech.com/dan.hicks      |
| 2:43:28 pm 6-May-22     | Execute PowerShell Command (64-bit, Run As System)-0002     | PowerShell is present.                              | provaltech.com/dan.hicks      |
| 2:43:22 pm 6-May-22     | Run Now - Azure AD Connect Version Audit                     | Admin provaltech.com/dan.hicks scheduled procedure `Run Now - Azure AD Connect Version Audit` to run at May 6 2022 2:43 PM |                               |

Copy and paste the Agent Procedure Log showing all steps below.

## Dependencies

- [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853853)
- [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853854)
- [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853845)
- [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853852)
- [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853848)
- [SWM - Software Configuration - Report - Azure AD Connect Version Audit](https://proval.itglue.com/5078775/docs/9853843)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name          | Description                                                                                     |
|---------------|-------------------------------------------------------------------------------------------------|
| `#version#`   | Contains the Azure AD Connect Version Number, or "Not Installed" if the software wasn't found. |

## Process

- Downloads PS1 from [Get-AzureADConnectVersion.ps1](https://file.proval.com/repo/kaseya/clients/pcc/Get-AzureADConnectVersion.ps1)
- Creates the working directory
- Runs the PS Script
- Gathers output from Data log and saves to the `#version#` variable
- Populates CF with Version.

## Output

- `$PSScriptRoot/Get-AzureADConnectVersion-DATA.txt`
- Agent Procedure Log

## Export Attachment

Attach the content XML VSA Export to this document.

