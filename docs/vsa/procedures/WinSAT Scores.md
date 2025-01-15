---
id: 'f716df74-c208-45fd-bff8-2865399e446b'
title: 'WinSAT Scores Collection Procedure'
title_meta: 'WinSAT Scores Collection Procedure'
keywords: ['winsat', 'scores', 'procedure', 'endpoint', 'performance']
description: 'This document outlines a procedure for collecting WinSAT scores on endpoints using custom fields and PowerShell commands. It includes detailed logs of actions taken and results obtained during the execution of the procedure, providing insights into the performance of system components such as CPU, memory, graphics, and disk.'
tags: ['performance', 'windows', 'configuration', 'setup', 'security']
draft: false
unlisted: false
---
## Summary

The procedure utilizes WinSAT and custom fields to store the scores of the machine.

## Example Agent Procedure Log

| Timestamp               | Action                          | Result                                                                                                                | User          |
|------------------------|---------------------------------|-----------------------------------------------------------------------------------------------------------------------|---------------|
| 3:51:07 pm 13-Jun-23   | WinSat [CFs]                   | Success THEN                                                                                                         | derek.joniak  |
| 3:51:07 pm 13-Jun-23   | WinSat [CFs]                   | Memory Score: 8.2                                                                                                   | derek.joniak  |
| 3:51:07 pm 13-Jun-23   | Execute Powershell Command      | Success THEN                                                                                                         | derek.joniak  |
| 3:51:07 pm 13-Jun-23   | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.                         | derek.joniak  |
| 3:51:07 pm 13-Jun-23   | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/177735712236329/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | derek.joniak  |
| 3:51:06 pm 13-Jun-23   | Execute Powershell Command-0011 | Powershell command completed!                                                                                        | derek.joniak  |
| 3:51:04 pm 13-Jun-23   | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty MemoryScore).ToString('F1') >"c:/kworking/psoutput.txt" | derek.joniak  |
| 3:51:04 pm 13-Jun-23   | Execute Powershell Command-0010 | Sending output to global variable.                                                                                   | derek.joniak  |
| 3:51:04 pm 13-Jun-23   | Execute Powershell Command-0008 | New command variable is: -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty MemoryScore).ToString('F1') | derek.joniak  |
| 3:51:04 pm 13-Jun-23   | Execute Powershell Command-0008 | Custom commands detected as (Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty MemoryScore).ToString('F1') | derek.joniak  |
| 3:51:02 pm 13-Jun-23   | Execute Powershell Command-0002 | Powershell is present.                                                                                               | derek.joniak  |
| 3:51:00 pm 13-Jun-23   | WinSat [CFs]                   | Graphics Score: 2.8                                                                                                  | derek.joniak  |
| 3:51:00 pm 13-Jun-23   | Execute Powershell Command      | Success THEN                                                                                                         | derek.joniak  |
| 3:51:00 pm 13-Jun-23   | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.                         | derek.joniak  |
| 3:51:00 pm 13-Jun-23   | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/177735712236329/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | derek.joniak  |
| 3:50:59 pm 13-Jun-23   | Execute Powershell Command-0011 | Powershell command completed!                                                                                        | derek.joniak  |
| 3:50:57 pm 13-Jun-23   | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty GraphicsScore).ToString('F1') >"c:/kworking/psoutput.txt" | derek.joniak  |
| 3:50:57 pm 13-Jun-23   | Execute Powershell Command-0010 | Sending output to global variable.                                                                                   | derek.joniak  |
| 3:50:57 pm 13-Jun-23   | Execute Powershell Command-0008 | New command variable is: -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty GraphicsScore).ToString('F1') | derek.joniak  |
| 3:50:57 pm 13-Jun-23   | Execute Powershell Command-0008 | Custom commands detected as (Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty GraphicsScore).ToString('F1') | derek.joniak  |
| 3:50:55 pm 13-Jun-23   | Execute Powershell Command-0002 | Powershell is present.                                                                                               | derek.joniak  |
| 3:50:55 pm 13-Jun-23   | WinSat [CFs]                   | Disk Score: 8.50                                                                                                     | derek.joniak  |
| 3:50:55 pm 13-Jun-23   | Execute Powershell Command      | Success THEN                                                                                                         | derek.joniak  |
| 3:50:54 pm 13-Jun-23   | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.                         | derek.joniak  |
| 3:50:54 pm 13-Jun-23   | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/177735712236329/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | derek.joniak  |
| 3:50:54 pm 13-Jun-23   | Execute Powershell Command-0011 | Powershell command completed!                                                                                        | derek.joniak  |
| 3:50:50 pm 13-Jun-23   | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty DiskScore).ToString('F') >"c:/kworking/psoutput.txt" | derek.joniak  |
| 3:50:50 pm 13-Jun-23   | Execute Powershell Command-0010 | Sending output to global variable.                                                                                   | derek.joniak  |
| 3:50:50 pm 13-Jun-23   | Execute Powershell Command-0008 | New command variable is: -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty DiskScore).ToString('F') | derek.joniak  |
| 3:50:50 pm 13-Jun-23   | Execute Powershell Command-0008 | Custom commands detected as (Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty DiskScore).ToString('F') | derek.joniak  |
| 3:50:49 pm 13-Jun-23   | Execute Powershell Command-0002 | Powershell is present.                                                                                               | derek.joniak  |
| 3:50:48 pm 13-Jun-23   | WinSat [CFs]                   | CPU Score: 8.2                                                                                                      | derek.joniak  |
| 3:50:48 pm 13-Jun-23   | Execute Powershell Command      | Success THEN                                                                                                         | derek.joniak  |
| 3:50:47 pm 13-Jun-23   | Execute Powershell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.                         | derek.joniak  |
| 3:50:47 pm 13-Jun-23   | Execute Powershell Command-0012 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/177735712236329/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | derek.joniak  |
| 3:50:47 pm 13-Jun-23   | Execute Powershell Command-0011 | Powershell command completed!                                                                                        | derek.joniak  |
| 3:50:45 pm 13-Jun-23   | Execute Powershell Command-0011 | Executing powershell "" -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty CPUScore).ToString('F1') >"c:/kworking/psoutput.txt" | derek.joniak  |
| 3:50:45 pm 13-Jun-23   | Execute Powershell Command-0010 | Sending output to global variable.                                                                                   | derek.joniak  |
| 3:50:45 pm 13-Jun-23   | Execute Powershell Command-0008 | New command variable is: -Command "(Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty CPUScore).ToString('F1') | derek.joniak  |
| 3:50:45 pm 13-Jun-23   | Execute Powershell Command-0008 | Custom commands detected as (Get-WmiObject -Namespace "root/CIMv2" -Class Win32_WinSat | Select-Object -ExpandProperty CPUScore).ToString('F1') | derek.joniak  |
| 3:50:43 pm 13-Jun-23   | Execute Powershell Command-0002 | Powershell is present.                                                                                               | derek.joniak  |
| 3:50:42 pm 13-Jun-23   | WinSat [CFs]                   | Determining scores for endpoint                                                                                     | derek.joniak  |
| 3:50:35 pm 13-Jun-23   | Run Now - WinSat [CFs]         | Admin derek.joniak scheduled procedure Run Now - WinSat [CFs] to run at Jun 13 2023 4:50PM                          | derek.joniak  |

## Output

Agent Procedure Log






