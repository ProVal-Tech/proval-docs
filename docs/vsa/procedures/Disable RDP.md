---
id: 'rmm-disable-rdp'
title: 'Disable RDP on Windows Machines'
title_meta: 'Disable RDP on Windows Machines'
keywords: ['rdp', 'windows', 'registry', 'disable', 'script']
description: 'This document explains a script designed to check if Remote Desktop Protocol (RDP) is enabled on a Windows machine and disable it by modifying the relevant Registry value. It provides a detailed log of actions taken during the execution of the script, along with sample outputs and processes involved.'
tags: ['windows', 'security', 'configuration', 'script', 'logging']
draft: false
unlisted: false
---
## Summary

The script is used to check whether the RDP is enabled on the machine. If the RDP is enabled, the script disables the RDP by editing the Registry value.

## Sample Run

| Time                     | Action                          | Status                                                                                                      | Link                           |
|--------------------------|---------------------------------|-------------------------------------------------------------------------------------------------------------|--------------------------------|
| 4:12:00 pm 20-Sep-22     | Disable RDP                    | Success THEN                                                                                               | provaltech.com/ovais.rashid   |
| 4:12:00 pm 20-Sep-22     | Disable RDP-0002               | RDP is Disabled                                                                                            | provaltech.com/ovais.rashid   |
| 4:11:59 pm 20-Sep-22     | Disable RDP-0001               | 1                                                                                                         | provaltech.com/ovais.rashid   |
| 4:11:59 pm 20-Sep-22     | Execute Powershell Command      | Success THEN                                                                                               | provaltech.com/ovais.rashid   |
| 4:11:59 pm 20-Sep-22     | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.               | provaltech.com/ovais.rashid   |
| 4:11:59 pm 20-Sep-22     | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/162522262609191/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/ovais.rashid   |
| 4:11:59 pm 20-Sep-22     | Execute Powershell Command-0011 | Powershell command completed!                                                                               | provaltech.com/ovais.rashid   |
| 4:11:51 pm 20-Sep-22     | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections" >"c:/provaltech/psoutput.txt" | provaltech.com/ovais.rashid   |
| 4:11:51 pm 20-Sep-22     | Execute Powershell Command-0010 | Sending output to global variable.                                                                          | provaltech.com/ovais.rashid   |
| 4:11:51 pm 20-Sep-22     | Execute Powershell Command-0008 | New command variable is: -Command "(Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections" | provaltech.com/ovais.rashid   |
| 4:11:51 pm 20-Sep-22     | Execute Powershell Command-0008 | Custom commands detected as (Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections | provaltech.com/ovais.rashid   |
| 4:11:42 pm 20-Sep-22     | Execute Powershell Command-0002 | Powershell is present.                                                                                     | provaltech.com/ovais.rashid   |
| 4:11:39 pm 20-Sep-22     | Disable RDP                    | 0                                                                                                         | provaltech.com/ovais.rashid   |
| 4:11:39 pm 20-Sep-22     | Execute Powershell Command      | Success THEN                                                                                               | provaltech.com/ovais.rashid   |
| 4:11:39 pm 20-Sep-22     | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.               | provaltech.com/ovais.rashid   |
| 4:11:39 pm 20-Sep-22     | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/162522262609191/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/ovais.rashid   |
| 4:11:38 pm 20-Sep-22     | Execute Powershell Command-0011 | Powershell command completed!                                                                               | provaltech.com/ovais.rashid   |
| 4:11:31 pm 20-Sep-22     | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections" >"c:/provaltech/psoutput.txt" | provaltech.com/ovais.rashid   |
| 4:11:31 pm 20-Sep-22     | Execute Powershell Command-0010 | Sending output to global variable.                                                                          | provaltech.com/ovais.rashid   |
| 4:11:31 pm 20-Sep-22     | Execute Powershell Command-0008 | New command variable is: -Command "(Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections" | provaltech.com/ovais.rashid   |
| 4:11:31 pm 20-Sep-22     | Execute Powershell Command-0008 | Custom commands detected as (Get-ItemProperty -Path 'HKLM:/SYSTEM/CurrentControlSet/Control/Terminal Server').fDenyTSConnections | provaltech.com/ovais.rashid   |
| 4:11:24 pm 20-Sep-22     | Execute Powershell Command-0002 | Powershell is present.                                                                                     | provaltech.com/ovais.rashid   |
| 4:11:15 pm 20-Sep-22     | Run Now - Disable RDP          | Admin provaltech.com/ovais.rashid scheduled procedure Run Now - Disable RDP to run at Sep 20 2022 4:11PM | provaltech.com/ovais.rashid   |

## Dependencies

None

## Process

First, the script checks if the RDP is enabled or not. If the RDP is enabled, the shell command will run to make changes to the Registry value and disable the RDP. Then the script again checks if RDP is still enabled; if not, it provides logs that RDP is disabled.

## Output

Script Logs

## Export Attachment

Attach the content XML VSA Export to this document.



