---
id: 'vsa-chromium-extensions-audit'
title: 'Chromium Extensions Audit'
title_meta: 'Chromium Extensions Audit'
keywords: ['chromium', 'extensions', 'audit', 'endpoint', 'inventory']
description: 'This document details the process of auditing Chromium extensions installed on an endpoint, including example logs and dependencies. It provides insights into the execution of the audit script and its output, helping administrators maintain control over browser extensions.'
tags: ['configuration', 'security', 'windows', 'software', 'report']
draft: false
unlisted: false
---
## Summary

Gets Chromium extensions installed on an endpoint

## Example Agent Procedure Log

8:44:35 am 23-Jan-23   Chromium Extensions Audit   Success THEN   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:34 am 23-Jan-23   Chrome Extensions Audit-0001   Log: 2023-01-23 08:44:36 INIT ----------------------------------------------- 2023-01-23 08:44:36 INIT Get-ChromiumExtensions 2023-01-23 08:44:36 INIT System: DEV 2023-01-23 08:44:36 INIT User: DEV$ 2023-01-23 08:44:36 INIT OS Bitness: AMD64 2023-01-23 08:44:36 INIT PowerShell Bitness: 64 2023-01-23 08:44:36 INIT PowerShell Version: 5 2023-01-23 08:44:36 INIT ----------------------------------------------- 2023-01-23 08:44:36 LOG Starting browser inventory on DEV. 2023-01-23 08:44:37 LOG 'Edge' Extension path not detected for 'C:/Users/User'. 2023-01-23 08:44:37 LOG 'Brave' Extension path not detected for 'C:/Users/User'.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:34 am 23-Jan-23   Chromium Extensions Audit   Firefox Extensions: Honey: Automatic Coupons & Rewards Google Docs Offline Chrome Web Store Payments   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:34 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:33 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:33 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:29 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "/" -command "(%ProgramData%/_automation/AgentProcedure/ChromiumExtensionAudit/Get-ChromiumExtensions.ps1).ExtensionName" >"c:/provaltech/psoutputtmp.txt"   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:29 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:29 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as (%ProgramData%/_automation/AgentProcedure/ChromiumExtensionAudit/Get-ChromiumExtensions.ps1).ExtensionName   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:29 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:25 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:21 am 23-Jan-23   Execute Powershell Command   Success THEN   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:20 am 23-Jan-23   Execute Powershell Command-0011   Powershell command completed!   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:02 am 23-Jan-23   Execute Powershell Command-0011   Executing powershell "/" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumExtensionAudit" "/"   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:02 am 23-Jan-23   Execute Powershell Command-0010   Not sending output to variable.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:02 am 23-Jan-23   Execute Powershell Command-0008   New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumExtensionAudit"   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:44:02 am 23-Jan-23   Execute Powershell Command-0008   Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumExtensionAudit   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:43:50 am 23-Jan-23   Execute Powershell Command-0002   Powershell is present.   [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks)  
8:43:41 am 23-Jan-23   Run Now - Chromium Extensions Audit   Admin [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) scheduled procedure Run Now - Chromium Extensions Audit to run at Jan 23 2023 8:43AM  

## Dependencies

[EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](https://proval.itglue.com/DOC-5078775-11791153)

## Process

Runs the agnostic script to collect chromium extensions installed on an endpoint

## Output

Agent Procedure Log  
Custom Field: xPVAL Chromium Extensions Installed




