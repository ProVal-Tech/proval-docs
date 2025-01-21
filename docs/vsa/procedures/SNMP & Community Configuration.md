---
id: '975ed6e2-5fb1-49f5-808a-672a42ccd56b'
title: 'SNMP & Community Configuration'
title_meta: 'SNMP & Community Configuration'
keywords: ['snmp', 'windows', 'feature', 'enable', 'optional']
description: 'This document outlines the procedure for enabling the SNMP Windows Optional feature on an endpoint, including example logs and a detailed process description.'
tags: ['installation', 'performance', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to enable the 'SNMP' Windows Optional feature on an endpoint.

## Example Agent Procedure Log

| Time                | Action                                    | Status                                          | User                             |
|---------------------|-------------------------------------------|-------------------------------------------------|----------------------------------|
| 12:07:28 pm 3-Oct-22 | SNMP & Community Configuration             | Success THEN                                   | provaltech.com/surender.kumar    |
| 12:07:28 pm 3-Oct-22 | SNMP & Community Configuration-0004       | SNMP Service is Running                        | provaltech.com/surender.kumar    |
| 12:07:28 pm 3-Oct-22 | SNMP & Community Configuration-0003       | SNMP Client Installed.                         | provaltech.com/surender.kumar    |
| 12:07:27 pm 3-Oct-22 | SNMP & Community Configuration-0001       | Installed                                      | provaltech.com/surender.kumar    |
| 12:07:27 pm 3-Oct-22 | Execute Powershell Command                 | Success THEN                                   | provaltech.com/surender.kumar    |
| 12:07:27 pm 3-Oct-22 | Execute Powershell Command-0012           | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar    |
| 12:07:27 pm 3-Oct-22 | Execute Powershell Command-0012           | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/746610212782388/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/surender.kumar    |
| 12:07:26 pm 3-Oct-22 | Execute Powershell Command-0011           | Powershell command completed!                  | provaltech.com/surender.kumar    |
| 12:07:21 pm 3-Oct-22 | Execute Powershell Command-0011           | Executing powershell "" -Command "(Get-WindowsCapability -name SNMP* -online).State" >"c:/provaltech/psoutput.txt" | provaltech.com/surender.kumar    |
| 12:07:21 pm 3-Oct-22 | Execute Powershell Command-0010           | Sending output to global variable.             | provaltech.com/surender.kumar    |
| 12:07:21 pm 3-Oct-22 | Execute Powershell Command-0008           | New command variable is: -Command "(Get-WindowsCapability -name SNMP* -online).State" | provaltech.com/surender.kumar    |
| 12:07:21 pm 3-Oct-22 | Execute Powershell Command-0008           | Custom commands detected as (Get-WindowsCapability -name SNMP* -online).State | provaltech.com/surender.kumar    |
| 12:07:19 pm 3-Oct-22 | Execute Powershell Command-0002           | Powershell is present.                         | provaltech.com/surender.kumar    |
| 12:07:17 pm 3-Oct-22 | Execute Powershell Command                 | Success THEN                                   | provaltech.com/surender.kumar    |
| 12:07:16 pm 3-Oct-22 | Execute Powershell Command-0011           | Powershell command completed!                  | provaltech.com/surender.kumar    |
| 12:07:11 pm 3-Oct-22 | Execute Powershell Command-0011           | Executing powershell "" -Command "Enable-WindowsOptionalFeature -Online -FeatureName \"SNMP\"" "" | provaltech.com/surender.kumar    |
| 12:07:11 pm 3-Oct-22 | Execute Powershell Command-0010           | Not sending output to variable.                | provaltech.com/surender.kumar    |
| 12:07:11 pm 3-Oct-22 | Execute Powershell Command-0008           | New command variable is: -Command "Enable-WindowsOptionalFeature -Online -FeatureName \"SNMP\"" | provaltech.com/surender.kumar    |
| 12:07:11 pm 3-Oct-22 | Execute Powershell Command-0008           | Custom commands detected as Enable-WindowsOptionalFeature -Online -FeatureName "SNMP" | provaltech.com/surender.kumar    |
| 12:07:08 pm 3-Oct-22 | Execute Powershell Command-0002           | Powershell is present.                         | provaltech.com/surender.kumar    |
| 12:07:07 pm 3-Oct-22 | Execute Powershell Command                 | Success THEN                                   | provaltech.com/surender.kumar    |
| 12:07:07 pm 3-Oct-22 | Execute Powershell Command-0011           | Powershell command completed!                  | provaltech.com/surender.kumar    |
| 12:04:11 pm 3-Oct-22 | Execute Powershell Command-0011           | Executing powershell "" -Command "Get-WindowsCapability -name SNMP* -online | Add-WindowsCapability –Online" "" | provaltech.com/surender.kumar    |
| 12:04:11 pm 3-Oct-22 | Execute Powershell Command-0010           | Not sending output to variable.                | provaltech.com/surender.kumar    |
| 12:04:11 pm 3-Oct-22 | Execute Powershell Command-0008           | New command variable is: -Command "Get-WindowsCapability -name SNMP* -online | Add-WindowsCapability –Online" | provaltech.com/surender.kumar    |
| 12:04:11 pm 3-Oct-22 | Execute Powershell Command-0008           | Custom commands detected as Get-WindowsCapability -name SNMP* -online | Add-WindowsCapability –Online | provaltech.com/surender.kumar    |
| 12:04:08 pm 3-Oct-22 | Execute Powershell Command-0002           | Powershell is present.                         | provaltech.com/surender.kumar    |
| 12:04:06 pm 3-Oct-22 | SNMP & Community Configuration             | NotPresent                                     | provaltech.com/surender.kumar    |
| 12:04:06 pm 3-Oct-22 | Execute Powershell Command                 | Success THEN                                   | provaltech.com/surender.kumar    |
| 12:04:06 pm 3-Oct-22 | Execute Powershell Command-0012           | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/surender.kumar    |
| 12:04:06 pm 3-Oct-22 | Execute Powershell Command-0012           | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/746610212782388/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/surender.kumar    |
| 12:04:05 pm 3-Oct-22 | Execute Powershell Command-0011           | Powershell command completed!                  | provaltech.com/surender.kumar    |
| 12:03:50 pm 3-Oct-22 | Execute Powershell Command-0011           | Executing powershell "" -Command "(Get-WindowsCapability -name SNMP* -online).State" >"c:/provaltech/psoutput.txt" | provaltech.com/surender.kumar    |
| 12:03:50 pm 3-Oct-22 | Execute Powershell Command-0010           | Sending output to global variable.             | provaltech.com/surender.kumar    |
| 12:03:50 pm 3-Oct-22 | Execute Powershell Command-0008           | New command variable is: -Command "(Get-WindowsCapability -name SNMP* -online).State" | provaltech.com/surender.kumar    |
| 12:03:50 pm 3-Oct-22 | Execute Powershell Command-0008           | Custom commands detected as (Get-WindowsCapability -name SNMP* -online).State | provaltech.com/surender.kumar    |
| 12:03:47 pm 3-Oct-22 | Execute Powershell Command-0002           | Powershell is present.                         | provaltech.com/surender.kumar    |
| 12:03:38 pm 3-Oct-22 | Run Now - SNMP & Community Configuration    | Admin provaltech.com/surender.kumar scheduled procedure Run Now - SNMP & Community Configuration to run at Oct 3 2022 12:03 PM | provaltech.com/surender.kumar    |

## Dependencies

None

## Process

The agent procedure checks whether the machine has the SNMP feature enabled. If not, the procedure enables it.

## Output

Procedure Logs



