---
id: 'vsa-office-uninstall'
title: 'Silent Uninstallation of Microsoft Office'
title_meta: 'Silent Uninstallation of Microsoft Office'
keywords: ['uninstall', 'office', 'silent', 'procedure', 'agent']
description: 'This document outlines the procedure for silently removing Microsoft Office when it cannot be uninstalled via winget. It includes example logs from the agent procedure and a link to the Invoke-OffScrub script used in the process.'
tags: ['uninstallation', 'software', 'windows', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

Office is non-removable via winget. This procedure silently removes Office.

## Example Agent Procedure Log

| Time                  | Action                                                | Status                | User          |
|-----------------------|-------------------------------------------------------|-----------------------|---------------|
| 06:34 am 10-Jul-23    | Microsoft Office - Uninstall                          | Success THEN          | derek.joniak  |
| 10:06:34 am 10-Jul-23 | Microsoft Office - Uninstall-0003                     | Success ELSE          | derek.joniak  |
| 10:06:34 am 10-Jul-23 | Microsoft Office - Uninstall-0002                     | Success ELSE          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Microsoft Office - Uninstall-0001                     | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Microsoft Office - Uninstall-0001                     | Log: 2023-07-10 10:56:26 INIT... | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)    | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0001 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0002 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0011 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0014 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0015 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0016 | Success THEN          | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete... | derek.joniak  |
| 10:06:33 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command... | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command... | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0012 | Success THEN          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0013 | Success THEN          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable. | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0003 | Success ELSE          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0008 | Success THEN          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0009 | Success ELSE          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0010 | Success ELSE          | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as... | derek.joniak  |
| 10:06:27 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected. | derek.joniak  |
| 10:06:25 am 10-Jul-23 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present. | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command                               | Success THEN          | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command-0001                         | Success THEN          | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command-0002                         | Success THEN          | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command-0011                         | Success THEN          | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command-0012                         | Success ELSE          | derek.joniak  |
| 10:06:16 am 10-Jul-23 | Execute Powershell Command-0011                         | Powershell command completed! | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0011                         | Executing powershell... | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0009                         | Success THEN          | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0010                         | Success ELSE          | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0010                         | Not sending output to variable. | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0007                         | Success THEN          | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0008                         | Success THEN          | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0008                         | New command variable is... | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0008                         | Custom commands detected as... | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0003                         | Success THEN          | derek.joniak  |
| 10:06:14 am 10-Jul-23 | Execute Powershell Command-0004                         | Success ELSE          | derek.joniak  |
| 10:06:12 am 10-Jul-23 | Execute Powershell Command-0002                         | Powershell is present. | derek.joniak  |

## Process

Procedure uses Invoke-OffScrub  
[https://file.provaltech.com/repo/script/Invoke-OffScrub.ps1](https://file.provaltech.com/repo/script/Invoke-OffScrub.ps1)

## Output

AP Log



