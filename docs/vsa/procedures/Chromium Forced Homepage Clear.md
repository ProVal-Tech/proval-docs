---
id: 'd56a82d5-2ac2-4edd-b80b-41ccdb885fd7'
title: 'Clear Chromium Homepage'
title_meta: 'Clear Chromium Homepage'
keywords: ['chromium', 'homepage', 'registry', 'browser', 'clear']
description: 'This document outlines the procedure to clear enforced homepages in Chromium-based browsers. It details the process of removing specific registry keys that control homepage selection, new tab page control, and session restoration, ensuring a clean browser experience.'
tags: ['registry', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to clear enforced homepages in Chromium-based browsers. For implementation details, refer to the agnostic content: [SWM - Software Configuration - Clear-ChromiumHomepage](<../../powershell/Clear-ChromiumHomepage.md>).

## Example Agent Procedure Log

| Time                     | Action                                    | Result                                                                                                                                                                                                                       | User                        |
|--------------------------|-------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| 10:49:53 am 2-Dec-22    | Chromium Forced Homepage Clear            | Success THEN                                                                                                                                                                                                                 | provaltech.com/dan.hicks    |
| 10:49:53 am 2-Dec-22    | Chromium Forced Homepage Clear-0001       | Log: 2022-12-02 10:49:49 INIT ----------------------------------------------- 2022-12-02 10:49:49 INIT Clear-ChromiumHomepage 2022-12-02 10:49:49 INIT System: DEV ...  | provaltech.com/dan.hicks    |
| 10:49:52 am 2-Dec-22    | Chromium Forced Homepage Clear            | Raw PS1 Data:                                                                                                                                                                                                              | provaltech.com/dan.hicks    |
| 10:49:52 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                                                                                                                                 | provaltech.com/dan.hicks    |
| 10:49:52 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of the server.                                                                                          | provaltech.com/dan.hicks    |
| 10:49:47 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: `\"\" -command \"%ProgramData%/_automation/AgentProcedure/ChromiumHomePageClear/Clear-ChromiumHomepage.ps1 -Target Edge\" >\"c:/provaltech/psoutputtmp.txt\"`                   | provaltech.com/dan.hicks    |
| 10:49:47 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                                                                                                                        | provaltech.com/dan.hicks    |
| 10:49:47 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as `%ProgramData%/_automation/AgentProcedure/ChromiumHomePageClear/Clear-ChromiumHomepage.ps1 -Target Edge`                                                                                     | provaltech.com/dan.hicks    |
| 10:49:47 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                                                                                                                                                                      | provaltech.com/dan.hicks    |
| 10:49:43 am 2-Dec-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                                                                                                                                      | provaltech.com/dan.hicks    |
| 10:49:40 am 2-Dec-22    | Execute Powershell Command                 | Success THEN                                                                                                                                                                                                                 | provaltech.com/dan.hicks    |
| 10:49:39 am 2-Dec-22    | Execute Powershell Command-0011           | Powershell command completed!                                                                                                                                                                                              | provaltech.com/dan.hicks    |
| 10:49:37 am 2-Dec-22    | Execute Powershell Command-0011           | Executing Powershell `\"\" -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumHomePageClear\"` `\"\"`                                                                          | provaltech.com/dan.hicks    |
| 10:49:37 am 2-Dec-22    | Execute Powershell Command-0010           | Not sending output to variable.                                                                                                                                                                                            | provaltech.com/dan.hicks    |
| 10:49:37 am 2-Dec-22    | Execute Powershell Command-0008           | New command variable is: `-Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumHomePageClear\"`                                                                                 | provaltech.com/dan.hicks    |
| 10:49:37 am 2-Dec-22    | Execute Powershell Command-0008           | Custom commands detected as `New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ChromiumHomePageClear`                                                                                       | provaltech.com/dan.hicks    |
| 10:49:35 am 2-Dec-22    | Execute Powershell Command-0002           | Powershell is present.                                                                                                                                                                                                      | provaltech.com/dan.hicks    |
| 10:49:26 am 2-Dec-22    | Run Now - Chromium Forced Homepage Clear   | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Chromium Forced Homepage Clear to run at Dec 2 2022 10:49 AM                                                                                                 |                             |

## Process

1. Reads the `$Target` parameter and prepares a list of registry keys to edit.
2. Removes specific registry keys that enforce homepage selection, new tab page control, and session restoration.
3. Validates that the registry keys either did not exist or were successfully removed.

## Output

- Agnostic content logs
- Agent Procedure Log
