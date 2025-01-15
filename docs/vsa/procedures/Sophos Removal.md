---
id: '986e2bee-68f3-456a-afd3-8634c26b877f'
title: 'Remove Sophos Endpoint Agent'
title_meta: 'Remove Sophos Endpoint Agent'
keywords: ['sophos', 'endpoint', 'uninstall', 'zap', 'agent']
description: 'This document provides a comprehensive guide on removing the Sophos Endpoint Agent from an endpoint, including example logs, dependencies, and the process involved in the uninstallation. It details the use of SophosZap and necessary configurations for successful removal.'
tags: ['uninstallation', 'software', 'security', 'cleanup']
draft: false
unlisted: false
---
## Summary

Removes Sophos Endpoint Agent from the endpoint.  
Uses [SWM - Software Uninstall - Agnostic - Remove-Sophos](https://proval.itglue.com/DOC-5078775-11944799)

## Example Agent Procedure Log

| Time                     | Action                                                  | Result                                                                                                         | User                          |
|--------------------------|---------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|-------------------------------|
| 10:36:46 am 30-Jan-23   | Sophos Removal                                          | Success THEN                                                                                                   | provaltech.com/dan.hicks      |
| 10:36:45 am 30-Jan-23   | Sophos Removal-0003                                    | Log: 2023-01-30 09:36:36 INIT...                                                                              | provaltech.com/dan.hicks      |
| 10:36:45 am 30-Jan-23   | Sophos Removal-0001                                    | Raw PS1 Data:                                                                                                 | provaltech.com/dan.hicks      |
| 10:36:45 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)    | Success THEN                                                                                                   | provaltech.com/dan.hicks      |
| 10:36:45 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete...                                                                                | provaltech.com/dan.hicks      |
| 10:36:45 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote...                                                                   | provaltech.com/dan.hicks      |
| 10:36:43 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: ...                                                            | provaltech.com/dan.hicks      |
| 10:36:43 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                             | provaltech.com/dan.hicks      |
| 10:36:42 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as ...                                                                                | provaltech.com/dan.hicks      |
| 10:36:42 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                          | provaltech.com/dan.hicks      |
| 10:36:41 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                         | provaltech.com/dan.hicks      |
| 10:36:39 am 30-Jan-23   | Execute Powershell Command                              | Success THEN                                                                                                   | provaltech.com/dan.hicks      |
| 10:36:38 am 30-Jan-23   | Execute Powershell Command-0011                        | Powershell command completed!                                                                                 | provaltech.com/dan.hicks      |
| 10:36:37 am 30-Jan-23   | Execute Powershell Command-0011                        | Executing powershell ...                                                                                      | provaltech.com/dan.hicks      |
| 10:36:37 am 30-Jan-23   | Execute Powershell Command-0010                        | Not sending output to variable.                                                                                | provaltech.com/dan.hicks      |
| 10:36:37 am 30-Jan-23   | Execute Powershell Command-0008                        | New command variable is: ...                                                                                  | provaltech.com/dan.hicks      |
| 10:36:37 am 30-Jan-23   | Execute Powershell Command-0008                        | Custom commands detected as ...                                                                                | provaltech.com/dan.hicks      |
| 10:36:35 am 30-Jan-23   | Execute Powershell Command-0002                        | Powershell is present.                                                                                         | provaltech.com/dan.hicks      |
| 10:32:29 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: ...                                                            | provaltech.com/dan.hicks      |
| 10:32:29 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                             | provaltech.com/dan.hicks      |
| 10:32:28 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as ...                                                                                | provaltech.com/dan.hicks      |
| 10:32:28 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                          | provaltech.com/dan.hicks      |
| 10:32:26 am 30-Jan-23   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                         | provaltech.com/dan.hicks      |
| 10:32:23 am 30-Jan-23   | Execute Powershell Command                              | Success THEN                                                                                                   | provaltech.com/dan.hicks      |
| 10:32:23 am 30-Jan-23   | Execute Powershell Command-0011                        | Powershell command completed!                                                                                 | provaltech.com/dan.hicks      |
| 10:32:20 am 30-Jan-23   | Execute Powershell Command-0011                        | Executing powershell ...                                                                                      | provaltech.com/dan.hicks      |
| 10:32:20 am 30-Jan-23   | Execute Powershell Command-0010                        | Not sending output to variable.                                                                                | provaltech.com/dan.hicks      |
| 10:32:20 am 30-Jan-23   | Execute Powershell Command-0008                        | New command variable is: ...                                                                                  | provaltech.com/dan.hicks      |
| 10:32:20 am 30-Jan-23   | Execute Powershell Command-0008                        | Custom commands detected as ...                                                                                | provaltech.com/dan.hicks      |
| 10:32:15 am 30-Jan-23   | Execute Powershell Command-0002                        | Powershell is present.                                                                                         | provaltech.com/dan.hicks      |
| 10:32:06 am 30-Jan-23   | Run Now - Sophos Removal                                | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Sophos Removal to run at Jan 30 2023 10:32AM    |                               |

### If Tamper Protection is NOT disabled, this is what appears in the log:

```
9:46:23 am 30-Jan-23    Sophos Removal    Success THEN    provaltech.com/dan.hicks
9:46:23 am 30-Jan-23    Sophos Removal-0005    ERROR: 2023-01-30 09:45:40 Error ERROR: SophosZap was not found in the script directory.    provaltech.com/dan.hicks
9:46:22 am 30-Jan-23    Sophos Removal-0003    Log: 2023-01-30 09:36:36 INIT...    provaltech.com/dan.hicks
...
```

## Dependencies

[SophosZap](https://download.sophos.com/tools/SophosZap.exe) needs to be in the managed files and the AP needs to be modified to point to it. Otherwise, SkipZap MUST be enabled on run or the AP will fail.  
Agnostic Content: [SWM - Software Uninstall - Agnostic - Remove-Sophos](https://proval.itglue.com/DOC-5078775-11944799)

## Process

- Runs the Sophos Endpoint Uninstaller
- Runs Sophos Zap
- Cleans up remnants.

## Output

- ./Remove-Sophos-Log.txt
- ./Remove-Sophos-Error.txt
- Agent Procedure Log







