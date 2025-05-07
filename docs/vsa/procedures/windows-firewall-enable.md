---
id: '2b875e4d-de3a-40ad-a63d-508a97d20ad9'
slug: /2b875e4d-de3a-40ad-a63d-508a97d20ad9
title: 'Windows Firewall Enable'
title_meta: 'Windows Firewall Enable'
keywords: ['windows', 'firewall', 'public', 'private', 'enable', 'network']
description: 'This document provides a detailed guide on enabling Windows Firewall for both Public and Private Networks, including example logs and process explanations.'
tags: ['firewall', 'security']
draft: false
unlisted: false
---

## Summary

This document provides the option to enable Windows Firewall for both Public and Private Networks.

## Example Agent Procedure Log

| Time                  | Action                                   | Status                                                                                               | User                          |
|-----------------------|------------------------------------------|------------------------------------------------------------------------------------------------------|-------------------------------|
| 10:14:17 am 2-Nov-22  | Windows Firewall Enable                  | Success THEN                                                                                         | provaltech.com/dan.hicks      |
| 10:14:17 am 2-Nov-22  | Windows Firewall Enable -0004            | Public Firewall is ON                                                                                | provaltech.com/dan.hicks      |
| 10:14:17 am 2-Nov-22  | Execute Powershell Command               | Success THEN                                                                                         | provaltech.com/dan.hicks      |
| 10:14:17 am 2-Nov-22  | Execute Powershell Command-0012          | Results returned to global variable #global:psresult# and saved in Documents tab of server.        | provaltech.com/dan.hicks      |
| 10:14:17 am 2-Nov-22  | Execute Powershell Command-0012          | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks      |
| 10:14:16 am 2-Nov-22  | Execute Powershell Command-0011          | Powershell command completed!                                                                        | provaltech.com/dan.hicks      |
| 10:14:13 am 2-Nov-22  | Execute Powershell Command-0011          | Executing powershell "" -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks      |
| 10:14:13 am 2-Nov-22  | Execute Powershell Command-0010          | Sending output to global variable.                                                                    | provaltech.com/dan.hicks      |
| 10:14:12 am 2-Nov-22  | Execute Powershell Command-0008          | New command variable is: -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled" | provaltech.com/dan.hicks      |
| 10:14:12 am 2-Nov-22  | Execute Powershell Command-0008          | Custom commands detected as Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled | provaltech.com/dan.hicks      |
| 10:14:11 am 2-Nov-22  | Execute Powershell Command-0002          | Powershell is present.                                                                                | provaltech.com/dan.hicks      |
| 10:14:10 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                         | provaltech.com/dan.hicks      |
| 10:14:10 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed!                                                                        | provaltech.com/dan.hicks      |
| 10:14:06 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Set-NetFirewallProfile -Profile Public -Enabled True" "" | provaltech.com/dan.hicks      |
| 10:14:06 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable.                                                                       | provaltech.com/dan.hicks      |
| 10:14:06 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Set-NetFirewallProfile -Profile Public -Enabled True                     | provaltech.com/dan.hicks      |
| 10:14:06 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                 | provaltech.com/dan.hicks      |
| 10:14:04 am 2-Nov-22  | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                | provaltech.com/dan.hicks      |
| 10:14:03 am 2-Nov-22  | Windows Firewall Enable -0003            | Public Firewall is OFF, Enabling.                                                                    | provaltech.com/dan.hicks      |
| 10:14:03 am 2-Nov-22  | Execute Powershell Command               | Success THEN                                                                                         | provaltech.com/dan.hicks      |
| 10:14:03 am 2-Nov-22  | Execute Powershell Command-0012          | Results returned to global variable #global:psresult# and saved in Documents tab of server.        | provaltech.com/dan.hicks      |
| 10:14:03 am 2-Nov-22  | Execute Powershell Command-0012          | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks      |
| 10:14:02 am 2-Nov-22  | Execute Powershell Command-0011          | Powershell command completed!                                                                        | provaltech.com/dan.hicks      |
| 10:13:58 am 2-Nov-22  | Execute Powershell Command-0011          | Executing powershell "" -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:/provaltech/pblfw.txt" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks      |
| 10:13:58 am 2-Nov-22  | Execute Powershell Command-0010          | Sending output to global variable.                                                                    | provaltech.com/dan.hicks      |
| 10:13:58 am 2-Nov-22  | Execute Powershell Command-0008          | New command variable is: -Command "Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:/provaltech/pblfw.txt" | provaltech.com/dan.hicks      |
| 10:13:58 am 2-Nov-22  | Execute Powershell Command-0008          | Custom commands detected as Get-NetFirewallProfile -Name Public | Select-Object -ExpandProperty Enabled >C:/provaltech/pblfw.txt | provaltech.com/dan.hicks      |
| 10:13:56 am 2-Nov-22  | Execute Powershell Command-0002          | Powershell is present.                                                                                | provaltech.com/dan.hicks      |
| 10:13:55 am 2-Nov-22  | Windows Firewall Enable -0001            | Private Firewall is ON                                                                                | provaltech.com/dan.hicks      |
| 10:13:55 am 2-Nov-22  | Execute Powershell Command               | Success THEN                                                                                         | provaltech.com/dan.hicks      |
| 10:13:55 am 2-Nov-22  | Execute Powershell Command-0012          | Results returned to global variable #global:psresult# and saved in Documents tab of server.        | provaltech.com/dan.hicks      |
| 10:13:55 am 2-Nov-22  | Execute Powershell Command-0012          | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks      |
| 10:13:54 am 2-Nov-22  | Execute Powershell Command-0011          | Powershell command completed!                                                                        | provaltech.com/dan.hicks      |
| 10:13:50 am 2-Nov-22  | Execute Powershell Command-0011          | Executing powershell "" -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks      |
| 10:13:50 am 2-Nov-22  | Execute Powershell Command-0010          | Sending output to global variable.                                                                    | provaltech.com/dan.hicks      |
| 10:13:50 am 2-Nov-22  | Execute Powershell Command-0008          | New command variable is: -Command "Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled" | provaltech.com/dan.hicks      |
| 10:13:50 am 2-Nov-22  | Execute Powershell Command-0008          | Custom commands detected as Get-NetFirewallProfile -Name Private | Select-Object -ExpandProperty Enabled | provaltech.com/dan.hicks      |
| 10:13:49 am 2-Nov-22  | Execute Powershell Command-0002          | Powershell is present.                                                                                | provaltech.com/dan.hicks      |
| 10:13:41 am 2-Nov-22  | Run Now - Windows Firewall Enable        | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Windows Firewall Enable                |                               |

## Process

If `EnablePublicFirewall` is set to 1, Windows Firewall will be enabled for Public Networks. The same applies for Private Networks.

## Output

AP Log

