---
id: '183aecf1-4d22-4373-89b4-14f9dcedef13'
slug: /183aecf1-4d22-4373-89b4-14f9dcedef13
title: 'Desktop Shortcut Creation'
title_meta: 'Desktop Shortcut Creation'
keywords: ['shortcut', 'desktop', 'link', 'uri', 'windows']
description: 'This document provides a comprehensive guide on creating a desktop shortcut in the Public Desktop using the New-DesktopUriShortcut script. It includes example logs, process details, and output files generated during execution.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Creates a shortcut in the Public Desktop.  
Implementation of [EPM - Windows Configuration - Agnostic - New-DesktopUriShortcut](/docs/56fa7d90-7c83-4c4a-ac0e-c49a6d5701af).

## Example Agent Procedure Log

| Time                      | Action                                   | Status                                                                                                                  | User                           |
|---------------------------|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| 12:38:59 pm 20-Dec-22     | Desktop Shortcut Creation                 | Success THEN                                                                                                           | provaltech.com/dan.hicks      |
| 12:38:58 pm 20-Dec-22     | Desktop Shortcut Creation-0001           | Log: 2022-12-20 12:32:38 INIT ----------------------------------------------- 2022-12-20 12:32:38 INIT New-DesktopUriShortcut 2022-12-20 12:32:38 INIT System: DEV 2022-12-20 12:32:38 INIT User: DEV$ 2022-12-20 12:32:38 INIT OS Bitness: AMD64 2022-12-20 12:32:38 INIT PowerShell Bitness: 64 2022-12-20 12:32:38 INIT PowerShell Version: 5 2022-12-20 12:32:38 INIT ----------------------------------------------- 2022-12-20 12:36:57 INIT ----------------------------------------------- 2022-12-20 12:36:57 INIT New-DesktopUriShortcut 2022-12-20 12:36:57 INIT System: DEV 2022-12-20 12:36:57 INIT User: DEV$ 2022-12-20 12:36:57 INIT OS Bitness: AMD64 2022-12-20 12:36:57 INIT PowerShell Bitness: 64 2022-12-20 12:36:57 INIT PowerShell Version: 5 2022-12-20 12:36:57 INIT ----------------------------------------------- 2022-12-20 12:36:57 LOG URI Detected as a web link. 2022-12-20 12:36:57 LOG ... | provaltech.com/dan.hicks      |
| 12:38:58 pm 20-Dec-22     | Desktop Shortcut Creation                 | Raw PS1 Data: 2022-12-20 12:38:54 INIT ----------------------------------------------- 2022-12-20 12:38:54 INIT New-DesktopUriShortcut 2022-12-20 12:38:54 INIT System: DEV 2022-12-20 12:38:54 INIT User: DEV$ 2022-12-20 12:38:54 INIT OS Bitness: AMD64 2022-12-20 12:38:54 INIT PowerShell Bitness: 64 2022-12-20 12:38:54 INIT PowerShell Version: 5 2022-12-20 12:38:54 INIT ----------------------------------------------- 2022-12-20 12:38:54 LOG URI Detected as a web link. 2022-12-20 12:38:54 LOG Getting webpage Favicon from [www.google.com](http://www.google.com). 2022-12-20 12:38:55 LOG Shortcut Saved Successfully | provaltech.com/dan.hicks      |
| 12:38:58 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                           | provaltech.com/dan.hicks      |
| 12:38:57 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 12:38:57 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/dan.hicks      |
| 12:38:54 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"$InformationPreference = 'Continue'; %ProgramData%//_automation//AgentProcedure//DesktopShortcutCreation//New-DesktopUriShortcut.ps1 -TargetUri [https://www.google.com](https://www.google.com) -ShortcutName test\" >\"c://provaltech//psoutputtmp.txt\" | provaltech.com/dan.hicks      |
| 12:38:54 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                     | provaltech.com/dan.hicks      |
| 12:38:54 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as $InformationPreference = 'Continue'; %ProgramData%//_automation//AgentProcedure//DesktopShortcutCreation//New-DesktopUriShortcut.ps1 -TargetUri [https://www.google.com](https://www.google.com) -ShortcutName test | provaltech.com/dan.hicks      |
| 12:38:53 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                                  | provaltech.com/dan.hicks      |
| 12:38:52 pm 20-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                                 | provaltech.com/dan.hicks      |
| 12:38:45 pm 20-Dec-22     | Execute Powershell Command                 | Success THEN                                                                                                           | provaltech.com/dan.hicks      |
| 12:38:45 pm 20-Dec-22     | Execute Powershell Command-0011            | Powershell command completed!                                                                                          | provaltech.com/dan.hicks      |
| 12:38:43 pm 20-Dec-22     | Execute Powershell Command-0011            | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name DesktopShortcutCreation\" \"\" | provaltech.com/dan.hicks      |
| 12:38:43 pm 20-Dec-22     | Execute Powershell Command-0010            | Not sending output to variable.                                                                                       | provaltech.com/dan.hicks      |
| 12:38:43 pm 20-Dec-22     | Execute Powershell Command-0008            | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name DesktopShortcutCreation\" | provaltech.com/dan.hicks      |
| 12:38:43 pm 20-Dec-22     | Execute Powershell Command-0008            | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name DesktopShortcutCreation | provaltech.com/dan.hicks      |
| 12:38:41 pm 20-Dec-22     | Execute Powershell Command-0002            | Powershell is present.                                                                                                 | provaltech.com/dan.hicks      |
| 12:38:34 pm 20-Dec-22     | Run Now - Desktop Shortcut Creation        | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Desktop Shortcut Creation to run at Dec 20 2022 12:38 PM |                                |

## Process

Runs the agnostic script [EPM - Windows Configuration - Agnostic - New-DesktopUriShortcut](/docs/56fa7d90-7c83-4c4a-ac0e-c49a6d5701af).  
Prompts for a shortcut path, shortcut target, and an optional custom icon.  
The custom icon will need to be uploaded to managed files. Once uploaded, point the `writeFile` function on line 8 to the icon. The file on the endpoint should always be **_#directory#/icon.ico_**.

## Output

- $env:PUBLIC/Desktop/link.lnk
- $env:PUBLIC/Pictures/icon.ico
- New-DesktopUriShortcut-log.txt
- New-DesktopUriShortcut-error.txt
- Agent Procedure Log