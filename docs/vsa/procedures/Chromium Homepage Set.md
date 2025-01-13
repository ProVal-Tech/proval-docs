---
id: 'vsa-set-chromium-homepage'
title: 'Set Chromium Homepage'
title_meta: 'Set Chromium Homepage for Chromium Based Browsers'
keywords: ['chromium', 'homepage', 'browser', 'configuration', 'endpoint']
description: 'This document outlines the procedure for setting the homepage in Chromium-based browsers using the SWM - Software Configuration - Set-ChromiumHomepage method. It includes a detailed example of agent procedure logs and the process involved in executing the commands.'
tags: ['browser', 'configuration', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

Summarize the Procedure.

## Example Agent Procedure Log

| Time                     | Action                                                                                  | Status                                                 | Link                          |
|--------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------|-------------------------------|
| 9:22:37 am 7-Nov-22     | Chromium Homepage Set                                                                   | Success THEN                                           | provaltech.com/dan.hicks      |
| 9:22:37 am 7-Nov-22     | Chromium Homepage Set-0001                                                              | Home Page Set Successfully                              | provaltech.com/dan.hicks      |
| 9:22:37 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)                                     | Success THEN                                           | provaltech.com/dan.hicks      |
| 9:22:37 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0016                                | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 9:22:32 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0011                                | Executing 64-bit Powershell command as System: "" -command "%ProgramData%/_automation/AgentProcedure/ChromeHome/Set-ChromiumHomepage.ps1 -Homepage [https://provaltech.com](https://provaltech.com) -Target Chrome,Edge -EnforceOnNewTab:$True -EnforceHomepageStartup:$True" >"c:/provaltech/psoutputtmp.txt" | provaltech.com/dan.hicks      |
| 9:22:32 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0013                                | Sending output to global variable.                     | provaltech.com/dan.hicks      |
| 9:22:32 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0008                                | Custom commands detected as %ProgramData%/_automation/AgentProcedure/ChromeHome/Set-ChromiumHomepage.ps1 -Homepage [https://provaltech.com](https://provaltech.com) -Target Chrome,Edge -EnforceOnNewTab:$True -EnforceHomepageStartup:$True | provaltech.com/dan.hicks      |
| 9:22:32 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0003                                | No powershell file variable detected.                  | provaltech.com/dan.hicks      |
| 9:22:29 am 7-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0002                                | Powershell is present.                                 | provaltech.com/dan.hicks      |
| 9:22:28 am 7-Nov-22     | Chromium Homepage Set                                                                   | Browser Target(s) " Chrome,Edge                       | provaltech.com/dan.hicks      |
| 9:22:28 am 7-Nov-22     | Chromium Homepage Set                                                                   | Enforce Homepage On Startup: True                      | provaltech.com/dan.hicks      |
| 9:22:28 am 7-Nov-22     | Chromium Homepage Set                                                                   | Enforce on New tab: True                               | provaltech.com/dan.hicks      |
| 9:22:28 am 7-Nov-22     | Chromium Homepage Set                                                                   | Setting Homepage to [https://provaltech.com](https://provaltech.com) | provaltech.com/dan.hicks      |
| 9:22:26 am 7-Nov-22     | Execute Powershell Command                                                              | Success THEN                                           | provaltech.com/dan.hicks      |
| 9:22:26 am 7-Nov-22     | Execute Powershell Command-0011                                                         | Powershell command completed!                          | provaltech.com/dan.hicks      |
| 9:22:24 am 7-Nov-22     | Execute Powershell Command-0011                                                         | Executing powershell "" -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name ChromeHome" "" | provaltech.com/dan.hicks      |
| 9:22:24 am 7-Nov-22     | Execute Powershell Command-0010                                                         | Not sending output to variable.                        | provaltech.com/dan.hicks      |
| 9:22:23 am 7-Nov-22     | Execute Powershell Command-0008                                                         | New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name ChromeHome" | provaltech.com/dan.hicks      |
| 9:22:23 am 7-Nov-22     | Execute Powershell Command-0008                                                         | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name ChromeHome | provaltech.com/dan.hicks      |
| 9:22:21 am 7-Nov-22     | Execute Powershell Command-0002                                                         | Powershell is present.                                 | provaltech.com/dan.hicks      |
| 9:22:13 am 7-Nov-22     | Run Now - Chromium Homepage Set                                                          | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Chromium Homepage Set to run at Nov 7 2022 9:22AM |                               |

## Process

Uses [SWM - Software Configuration - Set-ChromiumHomepage](https://proval.itglue.com/DOC-5078775-10372109) to set homepages in Chromium based browsers on an endpoint. Uses the same parameters as the agnostic script.

## Output

Agent procedure log




