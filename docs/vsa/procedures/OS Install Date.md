---
id: '8beb5e09-23af-40e8-8810-ec1a030c600b'
title: 'Determine OS Install Date'
title_meta: 'Determine the Initial Install Date of the Operating System'
keywords: ['os', 'install', 'date', 'powershell', 'agent', 'procedure']
description: 'This document outlines a procedure to determine the initial install date of the operating system using PowerShell. It provides a detailed example of the agent procedure log, dependencies required for execution, and the expected output of the procedure.'
tags: ['performance', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure runs PowerShell to determine the initial install date of the OS. This always pulls the oldest version and will not be overwritten with feature updates or upgrades to a new OS.

## Example Agent Procedure Log

| Time                     | Action                                           | Status                                               | User          |
|--------------------------|--------------------------------------------------|-----------------------------------------------------|---------------|
| 4:22:46 pm 13-Apr-23    | OS Install Date                                  | Success THEN                                        | derek.joniak  |
| 4:22:46 pm 13-Apr-23    | OS Install Date                                  | OS Install Date: 03/29/2022                         | derek.joniak  |
| 4:22:46 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                        | derek.joniak  |
| 4:22:46 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | derek.joniak  |
| 4:22:46 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/211658173702177/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | derek.joniak  |
| 4:22:44 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"$OS=@(Get-ChildItem -Path 'HKLM:/System/Setup/Source*' | ForEach-Object \{Get-ItemProperty -Path Registry::$_})+@(Get-ItemProperty 'HKLM:/SOFTWARE/Microsoft/Windows NT/CurrentVersion')|Select-Object @\{Name='InstallDate';Expression=\{ [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($_.InstallDate))}}|Sort-Object \"InstallDate\";$OS[0].InstallDate.ToString('MM/dd/yyyy');\" >\"c:/kworking/psoutputtmp.txt\" | derek.joniak  |
| 4:22:44 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                   | derek.joniak  |
| 4:22:44 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as $OS=@(Get-ChildItem -Path 'HKLM:/System/Setup/Source*' | ForEach-Object \{Get-ItemProperty -Path Registry::$_})+@(Get-ItemProperty 'HKLM:/SOFTWARE/Microsoft/Windows NT/CurrentVersion')|Select-Object @\{Name='InstallDate';Expression=\{ [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($_.InstallDate))}}|Sort-Object \"InstallDate\";$OS[0].InstallDate.ToString('MM/dd/yyyy'); | derek.joniak  |
| 4:22:44 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                | derek.joniak  |
| 4:22:42 pm 13-Apr-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                               | derek.joniak  |
| 4:22:42 pm 13-Apr-23    | OS Install Date                                  | Detecting OS Install Date                            | derek.joniak  |
| 4:22:35 pm 13-Apr-23    | Run Now - OS Install Date                        | Admin derek.joniak scheduled procedure Run Now - OS Install Date to run at Apr 13 2023 5:22 PM | derek.joniak  |

## Dependencies

The agent procedure requires the custom field to be created in order to successfully run:  
[Custom Field Documentation](<../custom-fields/xPVAL OS Install Date.md>)

## Output

The agent procedure updates the custom field.


