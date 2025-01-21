---
id: 'd68f1d82-f773-47f2-8c80-994614244646'
title: 'Get VSA Audit Reports'
title_meta: 'Get VSA Audit Reports - Kaseya VSA Documentation'
keywords: ['vsa', 'audit', 'reports', 'kaseya', 'automation']
description: 'This document outlines the process for running the Get-VSAAuditReports script in Kaseya VSA, detailing the procedure log, dependencies, and output generated during execution. Users will learn how to gather information, provide parameters, and access the generated audit reports.'
tags: ['kaseya', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

Runs [VSA - Kaseya - Agnostic - Get-VSAAuditReports](https://proval.itglue.com/DOC-5078775-9733460) and places the reports into getFiles.

## Example Agent Procedure Log

| Time                     | Procedure                                      | Status                                                                                      | User                        |
|--------------------------|------------------------------------------------|---------------------------------------------------------------------------------------------|-----------------------------|
| 11:17:59 am 2-Nov-22    | Onboarding Audit                               | Success THEN                                                                               | provaltech.com/dan.hicks   |
| 11:17:59 am 2-Nov-22    | Onboarding Audit-0001                         | Audit Completed. Audit Summary can be found in GetFiles. Individual CSV data can be found on the VSA Server in %ProgramData%/_automation/StackContent/ProvalTechnologies/audit/CSVs. | provaltech.com/dan.hicks   |
| 11:17:58 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User) | Success THEN                                                                               | provaltech.com/dan.hicks   |
| 11:17:58 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab. | provaltech.com/dan.hicks   |
| 11:17:58 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/702535277139695/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks   |
| 11:17:09 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0011 | Executing 64-bit Powershell command as User: \"\" -command \"%ProgramData%/_automation/StackContent/ProvalTechnologies/audit/Get-VsaAuditReports.ps1 -BaseURL [https://vsa.provaltech.com](https://vsa.provaltech.com) -ClientName ProvalTechnologies -VsaUserName dantestapi -RestApiToken 09f24c36-4091-46a3-9f53-7bfc87303b6d -DataWareHouseApiToken 159cf24f-918b-4149-b9d7-62d8e0fffe72\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks   |
| 11:17:09 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0013 | Sending output to global variable.                                                         | provaltech.com/dan.hicks   |
| 11:17:09 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0008 | Custom commands detected as %ProgramData%/_automation/StackContent/ProvalTechnologies/audit/Get-VsaAuditReports.ps1 -BaseURL [https://vsa.provaltech.com](https://vsa.provaltech.com) -ClientName ProvalTechnologies -VsaUserName dantestapi -RestApiToken 09f24c36-4091-46a3-9f53-7bfc87303b6d -DataWareHouseApiToken 159cf24f-918b-4149-b9d7-62d8e0fffe72 | provaltech.com/dan.hicks   |
| 11:17:08 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0003 | No powershell file variable detected.                                                      | provaltech.com/dan.hicks   |
| 11:17:08 am 2-Nov-22    | Execute Powershell Command (64-bit, Run As User)-0002 | Powershell is present.                                                                     | provaltech.com/dan.hicks   |
| 11:17:07 am 2-Nov-22    | Execute Powershell Command                      | Success THEN                                                                               | provaltech.com/dan.hicks   |
| 11:17:07 am 2-Nov-22    | Execute Powershell Command-0011                | Powershell command completed!                                                              | provaltech.com/dan.hicks   |
| 11:17:06 am 2-Nov-22    | Execute Powershell Command-0011                | Executing powershell \"\" -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/StackContent/ProvalTechnologies -Name audit -ErrorAction SilentlyContinue\" \"\" | provaltech.com/dan.hicks   |
| 11:17:06 am 2-Nov-22    | Execute Powershell Command-0010                | Not sending output to variable.                                                            | provaltech.com/dan.hicks   |
| 11:17:06 am 2-Nov-22    | Execute Powershell Command-0008                | New command variable is: -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/StackContent/ProvalTechnologies -Name audit -ErrorAction SilentlyContinue\" | provaltech.com/dan.hicks   |
| 11:17:06 am 2-Nov-22    | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/StackContent/ProvalTechnologies -Name audit -ErrorAction SilentlyContinue | provaltech.com/dan.hicks   |
| 11:17:05 am 2-Nov-22    | Execute Powershell Command-0002                | Powershell is present.                                                                      | provaltech.com/dan.hicks   |
| 11:16:58 am 2-Nov-22    | Run Now - Onboarding Audit                      | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Onboarding Audit to run at Nov 2 2022 11:16 AM |                             |

## Dependencies

[VSA - Kaseya - Agnostic - Get-VSAAuditReports](https://proval.itglue.com/DOC-5078775-9733460) and all associated requirements. See linked documentation for more details.

## Process

- Gathers information from the user at run time
- Provides information to the ps1 as parameters
- Places generated report into getFiles

## Output

- AP Log
- getFiles: StackContent/Audits/#ClientName#/AuditReport.xlsx

