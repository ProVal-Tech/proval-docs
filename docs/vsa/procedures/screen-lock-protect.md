---
id: '7321634c-9259-454e-b7f4-c0ce205a3d8a'
slug: /7321634c-9259-454e-b7f4-c0ce205a3d8a
title: 'Screen Lock Protect'
title_meta: 'Screen Lock Protect'
keywords: ['screen', 'lock', 'timeout', 'endpoint', 'configuration']
description: 'This document details the procedure for setting the screen lock timeout on an endpoint using the ProVal Agnostic Protect-ScreenLock script. It includes example logs, dependencies, and the process of implementation, ensuring proper configuration and execution.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

Sets the screen lock timeout on an endpoint.

## Example Agent Procedure Log

| Time                     | Procedure                                    | Status                                                                                                                | User                             |
|--------------------------|----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|----------------------------------|
| 3:24:54 pm 18-Oct-22     | Screen Lock Protect                          | Success THEN                                                                                                         | provaltech.com/dan.hicks        |
| 3:24:54 pm 18-Oct-22     | Screen Lock Protect-0003                    | Data: Registry settings set successfully.                                                                             | provaltech.com/dan.hicks        |
| 3:24:53 pm 18-Oct-22     | Screen Lock Protect-0002                    | Log: 2022-10-18 15:24:49 INIT ----------------------------------------------- 2022-10-18 15:24:49 INIT Protect-ScreenLock 2022-10-18 15:24:49 INIT System: DEV-WIN11-DANVM 2022-10-18 15:24:49 INIT User: DEV-WIN11-DANVM$ 2022-10-18 15:24:49 INIT OS Bitness: AMD64 2022-10-18 15:24:49 INIT PowerShell Bitness: 64 2022-10-18 15:24:49 INIT PowerShell Version: 5 2022-10-18 15:24:49 INIT ----------------------------------------------- 2022-10-18 15:24:50 LOG PowerShell is already at or above version 5. 2022-10-18 15:24:50 LOG Checking HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Policies//System:InactivityTimeoutSecs... 2022-10-18 15:24:50 LOG HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Policies//System:InactivityTimeoutSecs needs configuration. 2022-10-18 15:24:50 LOG Domain exception is not active. Running configuration update. 2022-10-18 15:24:50 DATA Registry settings set successfully. | provaltech.com/dan.hicks        |
| 3:24:53 pm 18-Oct-22     | Screen Lock Protect                          | Raw PS1 Data: InactivityTimeoutSecs : 900 PSPath : Microsoft.PowerShell.Core//Registry::HKEY_LOCAL_MACHINE//SOFTWARE//Microsoft//Windows//CurrentVersion//Policies//System PSParentPath : Microsoft.PowerShell.Core//Registry::HKEY_LOCAL_MACHINE//SOFTWARE//Microsoft//Windows//CurrentVersion//Policies PSChildName : System PSDrive : HKLM PSProvider : Microsoft.PowerShell.Core//Registry | provaltech.com/dan.hicks        |
| 3:24:53 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                         | provaltech.com/dan.hicks        |
| 3:24:53 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks        |
| 3:24:53 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//735959849026022//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/dan.hicks        |
| 3:24:48 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%//_automation//AgentProcedure//ScreenLockProtect//Protect-ScreenLock.ps1 -timeout 900\" >\"c://provaltech//psoutputtmp.txt\" | provaltech.com/dan.hicks        |
| 3:24:48 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                  | provaltech.com/dan.hicks        |
| 3:24:48 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%//_automation//AgentProcedure//ScreenLockProtect//Protect-ScreenLock.ps1 -timeout 900 | provaltech.com/dan.hicks        |
| 3:24:48 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                                | provaltech.com/dan.hicks        |
| 3:24:45 pm 18-Oct-22     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                              | provaltech.com/dan.hicks        |
| 3:24:42 pm 18-Oct-22     | Execute Powershell Command                      | Success THEN                                                                                                         | provaltech.com/dan.hicks        |
| 3:24:42 pm 18-Oct-22     | Execute Powershell Command-0011                | Powershell command completed!                                                                                        | provaltech.com/dan.hicks        |
| 3:24:40 pm 18-Oct-22     | Execute Powershell Command-0011                | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name ScreenLockProtect\" \"\" | provaltech.com/dan.hicks        |
| 3:24:40 pm 18-Oct-22     | Execute Powershell Command-0010                | Not sending output to variable.                                                                                     | provaltech.com/dan.hicks        |
| 3:24:40 pm 18-Oct-22     | Execute Powershell Command-0008                | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name ScreenLockProtect\" | provaltech.com/dan.hicks        |
| 3:24:40 pm 18-Oct-22     | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name ScreenLockProtect | provaltech.com/dan.hicks        |
| 3:24:36 pm 18-Oct-22     | Execute Powershell Command-0002                | Powershell is present.                                                                                              | provaltech.com/dan.hicks        |
| 3:24:28 pm 18-Oct-22     | Run Now - Screen Lock Protect                  | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Screen Lock Protect to run at Oct 18 2022 3:24 PM       |                                  |

## Dependencies

[Protect-ScreenLock](/docs/9c89e293-7f28-4e7c-936f-e285b04e8df0)

## Process

Uses the ProVal Agnostic Protect-ScreenLock script to set a configurable timeout for screen lock. Includes the ability to exclude domain-joined machines.

## Output

Agent Procedure Log