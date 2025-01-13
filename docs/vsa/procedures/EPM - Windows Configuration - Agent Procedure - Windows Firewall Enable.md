---
id: 'ps-enable-windows-firewall'
title: 'Enable Windows Firewall on Endpoint'
title_meta: 'Enable Windows Firewall on Endpoint'
keywords: ['windows', 'firewall', 'enable', 'endpoint', 'procedure']
description: 'This document provides a detailed procedure for enabling Windows Firewall on an endpoint, including example logs and steps taken during the process. It ensures that the firewall is activated and logs the actions for review.'
tags: ['firewall', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This agent procedure is used to enable Windows Firewall in endpoint.

## Example Agent Procedure Log

| Timestamp            | Action                                          | Status                                    | User                             |
|---------------------|-------------------------------------------------|-------------------------------------------|----------------------------------|
| 8:55:45 am 2-Nov-22 | Windows Firewall Enable                         | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:45 am 2-Nov-22 | Windows Firewall Enable -0003                   | Windows Firewall Successfully Enabled.    | provaltech.com/surender.kumar   |
| 8:55:45 am 2-Nov-22 | Windows Firewall Enable                         | Comparing files C:\PROVALTECH\pvtfw.txt and C:\PROVALTECH\PBLFW.TXT FC: no differences encountered | provaltech.com/surender.kumar   |
| 8:55:45 am 2-Nov-22 | Execute Shell command - Get Results to Variable | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:43 am 2-Nov-22 | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: fc C:\provaltech\pvtfw.txt C:\provaltech\pblfw.txt >"c:\provaltech\commandresults-1804840338.txt" 2>&1 | provaltech.com/surender.kumar   |
| 8:55:42 am 2-Nov-22 | Execute Powershell Command                      | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:42 am 2-Nov-22 | Execute Powershell Command-0012                 | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar   |
| 8:55:42 am 2-Nov-22 | Execute Powershell Command-0012                 | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\382358830087781\GetFiles\..\docs\psoutput.txt with the new contents from c:\provaltech\psoutput.txt in THEN step 2. | provaltech.com/surender.kumar   |
| 8:55:41 am 2-Nov-22 | Execute Powershell Command-0011                 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:55:35 am 2-Nov-22 | Execute Powershell Command-0011                 | Executing powershell "" -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt" >"c:\provaltech\psoutput.txt" | provaltech.com/surender.kumar   |
| 8:55:35 am 2-Nov-22 | Execute Powershell Command-0010                 | Sending output to global variable.       | provaltech.com/surender.kumar   |
| 8:55:35 am 2-Nov-22 | Execute Powershell Command-0008                 | New command variable is: -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt" | provaltech.com/surender.kumar   |
| 8:55:35 am 2-Nov-22 | Execute Powershell Command-0008                 | Custom commands detected as Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt | provaltech.com/surender.kumar   |
| 8:55:32 am 2-Nov-22 | Execute Powershell Command-0002                 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:55:30 am 2-Nov-22 | Execute Powershell Command                       | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:30 am 2-Nov-22 | Execute Powershell Command-0012                 | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar   |
| 8:55:30 am 2-Nov-22 | Execute Powershell Command-0012                 | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\382358830087781\GetFiles\..\docs\psoutput.txt with the new contents from c:\provaltech\psoutput.txt in THEN step 2. | provaltech.com/surender.kumar   |
| 8:55:30 am 2-Nov-22 | Execute Powershell Command-0011                 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:55:23 am 2-Nov-22 | Execute Powershell Command-0011                 | Executing powershell "" -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt" >"c:\provaltech\psoutput.txt" | provaltech.com/surender.kumar   |
| 8:55:23 am 2-Nov-22 | Execute Powershell Command-0010                 | Sending output to global variable.       | provaltech.com/surender.kumar   |
| 8:55:23 am 2-Nov-22 | Execute Powershell Command-0008                 | New command variable is: -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt" | provaltech.com/surender.kumar   |
| 8:55:23 am 2-Nov-22 | Execute Powershell Command-0008                 | Custom commands detected as Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt | provaltech.com/surender.kumar   |
| 8:55:19 am 2-Nov-22 | Execute Powershell Command-0002                 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:55:18 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System) | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:17 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:55:14 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Set-NetFirewallProfile -Profile Public -Enabled True" "" | provaltech.com/surender.kumar   |
| 8:55:14 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable.          | provaltech.com/surender.kumar   |
| 8:55:14 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Set-NetFirewallProfile -Profile Public -Enabled True | provaltech.com/surender.kumar   |
| 8:55:14 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.    | provaltech.com/surender.kumar   |
| 8:55:12 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:55:11 am 2-Nov-22 | Windows Firewall Enable -0002                   | Public Firewall is OFF                   | provaltech.com/surender.kumar   |
| 8:55:11 am 2-Nov-22 | Execute Powershell Command                       | Success THEN                             | provaltech.com/surender.kumar   |
| 8:55:11 am 2-Nov-22 | Execute Powershell Command-0012                 | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar   |
| 8:55:11 am 2-Nov-22 | Execute Powershell Command-0012                 | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\382358830087781\GetFiles\..\docs\psoutput.txt with the new contents from c:\provaltech\psoutput.txt in THEN step 2. | provaltech.com/surender.kumar   |
| 8:55:10 am 2-Nov-22 | Execute Powershell Command-0011                 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:55:04 am 2-Nov-22 | Execute Powershell Command-0011                 | Executing powershell "" -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt" >"c:\provaltech\psoutput.txt" | provaltech.com/surender.kumar   |
| 8:55:04 am 2-Nov-22 | Execute Powershell Command-0010                 | Sending output to global variable.       | provaltech.com/surender.kumar   |
| 8:55:03 am 2-Nov-22 | Execute Powershell Command-0008                 | New command variable is: -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt" | provaltech.com/surender.kumar   |
| 8:55:03 am 2-Nov-22 | Execute Powershell Command-0008                 | Custom commands detected as Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:\provaltech\pblfw.txt | provaltech.com/surender.kumar   |
| 8:55:00 am 2-Nov-22 | Execute Powershell Command-0002                 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:54:59 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System) | Success THEN                             | provaltech.com/surender.kumar   |
| 8:54:59 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:54:55 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Set-NetFirewallProfile -Profile Private -Enabled True" "" | provaltech.com/surender.kumar   |
| 8:54:55 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable.          | provaltech.com/surender.kumar   |
| 8:54:55 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Set-NetFirewallProfile -Profile Private -Enabled True | provaltech.com/surender.kumar   |
| 8:54:55 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.    | provaltech.com/surender.kumar   |
| 8:54:53 am 2-Nov-22 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:54:52 am 2-Nov-22 | Windows Firewall Enable -0001                   | Private Firewall is OFF                  | provaltech.com/surender.kumar   |
| 8:54:52 am 2-Nov-22 | Execute Powershell Command                       | Success THEN                             | provaltech.com/surender.kumar   |
| 8:54:52 am 2-Nov-22 | Execute Powershell Command-0012                 | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar   |
| 8:54:52 am 2-Nov-22 | Execute Powershell Command-0012                 | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\382358830087781\GetFiles\..\docs\psoutput.txt with the new contents from c:\provaltech\psoutput.txt in THEN step 2. | provaltech.com/surender.kumar   |
| 8:54:51 am 2-Nov-22 | Execute Powershell Command-0011                 | Powershell command completed!            | provaltech.com/surender.kumar   |
| 8:54:44 am 2-Nov-22 | Execute Powershell Command-0011                 | Executing powershell "" -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt" >"c:\provaltech\psoutput.txt" | provaltech.com/surender.kumar   |
| 8:54:44 am 2-Nov-22 | Execute Powershell Command-0010                 | Sending output to global variable.       | provaltech.com/surender.kumar   |
| 8:54:44 am 2-Nov-22 | Execute Powershell Command-0008                 | New command variable is: -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt" | provaltech.com/surender.kumar   |
| 8:54:44 am 2-Nov-22 | Execute Powershell Command-0008                 | Custom commands detected as Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled >C:\provaltech\pvtfw.txt | provaltech.com/surender.kumar   |
| 8:54:41 am 2-Nov-22 | Execute Powershell Command-0002                 | Powershell is present.                   | provaltech.com/surender.kumar   |
| 8:54:32 am 2-Nov-22 | Run Now - Windows Firewall Enable                | Admin provaltech.com/surender.kumar scheduled procedure Run Now - Windows Firewall Enable to run at Nov 2 2022 8:54AM | provaltech.com/surender.kumar   |

## Dependencies

No

## Process

The agent procedure checks whether the machine has firewall enabled or not. If not then the procedure enables it and saves its logs in procedure log entry.

## Output

Procedure Logs


