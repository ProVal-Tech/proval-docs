---
id: 'ps-duo-install-upgrade'
title: 'Duo Installation and Upgrade Procedure for Windows'
title_meta: 'Duo Installation and Upgrade Procedure for Windows'
keywords: ['duo', 'installation', 'upgrade', 'windows', 'procedure']
description: 'This document outlines the procedure for installing and upgrading Duo for Windows, including detailed logs of the execution steps and their statuses. It provides insights into the commands used, the success of each step, and the overall effectiveness of the installation process.'
tags: ['installation', 'windows', 'software', 'upgrade', 'security']
draft: false
unlisted: false
---
## Summary

This procedure installs and upgrades Duo for Windows.

## Example Agent Procedure Log

| Time                     | Procedure                                      | Status                                         | User          |
|--------------------------|------------------------------------------------|------------------------------------------------|---------------|
| 10:26:36 am 6-Jul-23    | Duo - Install & Upgrade                        | Success THEN                                   | derek.joniak  |
| 10:26:36 am 6-Jul-23    | Duo - Install & Upgrade-0001                  | Success THEN                                   | derek.joniak  |
| 10:26:36 am 6-Jul-23    | Duo - Install & Upgrade-0001                  | Install Succeeded. Cleanup performed           | derek.joniak  |
| 10:26:36 am 6-Jul-23    | Duo - Install & Upgrade-0001                  | Allowing procedure time to install before performing cleanup | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                   | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0001 | Success THEN                                   | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Success THEN                                   | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Success THEN                                   | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0014 | Success ELSE                                   | derek.joniak  |
| 10:26:05 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed!                  | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "MSIEXEC /qn /i /"C://ProgramData//_automation//AgentProcedure//Duo//DuoWindowsLogon64.msi/"" | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0012 | Success THEN                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Success ELSE                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable.                | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0003 | Success ELSE                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Success THEN                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0009 | Success ELSE                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0010 | Success ELSE                                   | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as MSIEXEC /qn /i "C://ProgramData//_automation//AgentProcedure//Duo//DuoWindowsLogon64.msi" | derek.joniak  |
| 10:26:02 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.          | derek.joniak  |
| 10:25:59 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                         | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Duo - Install & Upgrade-0001                   | File Downloaded Successfully                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File                                     | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0003                                | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0004                                | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0005                                | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0005                                | Zip commands run - %ProgramData%//_automation//AgentProcedure//Duo//DuoLatest.zip extracted to %ProgramData%//_automation//AgentProcedure//Duo | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0007                                | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0008                                | Success THEN                                   | derek.joniak  |
| 10:25:58 am 6-Jul-23    | Unzip File-0009                                | Success ELSE                                   | derek.joniak  |
| 10:25:57 am 6-Jul-23    | Unzip File-0006                                | Success ELSE                                   | derek.joniak  |
| 10:25:57 am 6-Jul-23    | Unzip File-0001                                | Success THEN                                   | derek.joniak  |
| 10:25:57 am 6-Jul-23    | Unzip File-0002                                | Success ELSE                                   | derek.joniak  |
| 10:25:56 am 6-Jul-23    | Unzip File-0002                                | Overwrite is not set                           | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0001 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0014 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0015 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Success THEN                                   | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | derek.joniak  |
| 10:25:55 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//910544681671025//GetFiles//..//docs//psoutput.txt with the new contents from c://Proval//psoutput.txt in THEN step 3. | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "New-Item -ItemType Directory -Path /"%ProgramData%//_automation//AgentProcedure -Name Duo/" >/"c://Proval//psoutputtmp.txt" | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0012 | Success THEN                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Success THEN                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.             | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0003 | Success ELSE                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Success THEN                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0009 | Success ELSE                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0010 | Success ELSE                                   | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as New-Item -ItemType Directory -Path "%ProgramData%//_automation//AgentProcedure -Name Duo" | derek.joniak  |
| 10:25:49 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.          | derek.joniak  |
| 10:25:45 am 6-Jul-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                         | derek.joniak  |
| 10:25:35 am 6-Jul-23    | Run Now - Duo - Install & Upgrade              | Admin derek.joniak scheduled procedure Run Now - Duo - Install & Upgrade to run at Jul 6 2023 11:25AM | derek.joniak  |

## Output

Procedure Logfiles



