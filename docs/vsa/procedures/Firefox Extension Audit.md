---
id: '6b79ea40-3f5f-451f-8b03-b6d93c4b099d'
title: 'Firefox Extension Audit'
title_meta: 'Firefox Extension Audit'
keywords: ['firefox', 'extensions', 'audit', 'endpoint', 'inventory']
description: 'This document provides a detailed overview of the Firefox Extensions Audit procedure, which collects and logs the extensions installed on an endpoint. The process includes example logs and dependencies for running the audit effectively.'
tags: ['extensions', 'firefox', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to collect Firefox extensions installed on an endpoint.

## Example Agent Procedure Log

```
8:33:10 am 23-Jan-23   Firefox Extensions Audit   Success THEN   provaltech.com/dan.hicks
8:33:09 am 23-Jan-23   Firefox Extensions Audit-0001   Log: 2023-01-23 08:30:07 INIT -----------------------------------------------
2023-01-23 08:30:07 INIT Get-FirefoxExtensions 
2023-01-23 08:30:07 INIT System: DEV 
2023-01-23 08:30:07 INIT User: DEV$ 
2023-01-23 08:30:07 INIT OS Bitness: AMD64 
2023-01-23 08:30:07 INIT PowerShell Bitness: 64 
2023-01-23 08:30:07 INIT PowerShell Version: 5 
2023-01-23 08:30:07 INIT -----------------------------------------------
2023-01-23 08:30:07 LOG Starting browser inventory on DEV. 
2023-01-23 08:33:10 INIT -----------------------------------------------
2023-01-23 08:33:10 INIT Get-FirefoxExtensions 
2023-01-23 08:33:10 INIT System: DEV 
2023-01-23 08:33:10 INIT User: DEV$ 
2023-01-23 08:33:10 INIT OS Bitness: AMD64 
2023-01-23 08:33:10 INIT PowerShell Bitness: 64 
2023-01-23 08:33:10 INIT PowerShell Version: 5 
2023-01-23 08:33:10 INIT -----------------------------------------------
2023-01-23 08:33:10 L...   provaltech.com/dan.hicks
8:33:08 am 23-Jan-23   Firefox Extensions Audit   Firefox Extensions: OneTab   provaltech.com/dan.hicks
8:33:08 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)   Success THEN   provaltech.com/dan.hicks
8:33:08 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks
8:33:07 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C:\\Kaseya\\UserProfiles\\229175768944442\\GetFiles\\..\\docs\\psoutput.txt with the new contents from c:\\provaltech\\psoutput.txt in THEN step 3.   provaltech.com/dan.hicks
8:33:03 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0011   Executing 64-bit Powershell command as System: "" -command "(%ProgramData%\\_automation\\AgentProcedure\\FirefoxExtensionAudit\\Get-FirefoxExtensions.ps1).ExtensionName" >"c:\\provaltech\\psoutputtmp.txt"   provaltech.com/dan.hicks
8:33:03 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks
8:33:03 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0008   Custom commands detected as (%ProgramData%\\_automation\\AgentProcedure\\FirefoxExtensionAudit\\Get-FirefoxExtensions.ps1).ExtensionName   provaltech.com/dan.hicks
8:33:03 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks
8:33:01 am 23-Jan-23   Execute Powershell Command (64-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks
8:32:58 am 23-Jan-23   Execute Powershell Command   Success THEN   provaltech.com/dan.hicks
8:32:58 am 23-Jan-23   Execute Powershell Command-0011   Powershell command completed!   provaltech.com/dan.hicks
8:32:56 am 23-Jan-23   Execute Powershell Command-0011   Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData\\_automation\\AgentProcedure -name FirefoxExtensionAudit" ""   provaltech.com/dan.hicks
8:32:56 am 23-Jan-23   Execute Powershell Command-0010   Not sending output to variable.   provaltech.com/dan.hicks
8:32:56 am 23-Jan-23   Execute Powershell Command-0008   New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData\\_automation\\AgentProcedure -name FirefoxExtensionAudit"   provaltech.com/dan.hicks
8:32:56 am 23-Jan-23   Execute Powershell Command-0008   Custom commands detected as New-Item -Type Directory -Path $env:ProgramData\\_automation\\AgentProcedure -name FirefoxExtensionAudit   provaltech.com/dan.hicks
8:32:54 am 23-Jan-23   Execute Powershell Command-0002   Powershell is present.   provaltech.com/dan.hicks
8:32:46 am 23-Jan-23   Run Now - Firefox Extensions Audit   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Firefox Extensions Audit to run at Jan 23 2023 8:32 AM
```

## Dependencies

[Get-FireFoxExtension.ps1](https://proval.itglue.com/5078775/docs/11791154)

## Process

Runs the agnostic script to collect Firefox extensions installed on an endpoint.

## Output

- Agent Procedure Log
- Custom Field: xPVAL Firefox Extensions Installed


