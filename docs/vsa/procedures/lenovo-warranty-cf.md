---
id: 'ae08bde8-3c4e-48d2-a390-d772b279db6d'
slug: /ae08bde8-3c4e-48d2-a390-d772b279db6d
title: 'Lenovo Warranty CF'
title_meta: 'Lenovo Warranty CF'
keywords: ['lenovo', 'warranty', 'lenovo-warranty']
description: 'This script is used to update the Custom filed with the leneovo warranty end date'
tags: ['auditing', 'custom-fields', 'lenovo']
draft: false
unlisted: false
---

## Summary

This script is used to update the custom field with the Lenovo warranty end date ([Warranty Expiration Date](/docs/961fdbf7-0066-46f1-9ebc-ead6efb63232)).

## Sample Run

| Time                  | Procedure                                         | Status                                                                                                                              | User                      |
|-----------------------|---------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| 11:19:41 am 21-Aug-25 | Lenovo Warranty (CF)                              | Success THEN                                                                                                                        | Pronoc   |
| 11:19:41 am 21-Aug-25 | Lenovo Warranty (CF)-0001                         | Success THEN                                                                                                                        | Pronoc   |
| 11:19:41 am 21-Aug-25 | Lenovo Warranty (CF)-0002                         | Success THEN                                                                                                                        | Pronoc   |
| 11:19:41 am 21-Aug-25 | Lenovo Warranty (CF)-0002                         | Script successfully got the warranty and now updating the Custom Field.                                                             | Pronoc   |
| 11:19:41 am 21-Aug-25 | Lenovo Warranty (CF)-0001                         | warrantyEnd on 2021-05-31                                                                                                           | Pronoc   |
| 11:19:41 am 21-Aug-25 | Execute Shell command - Get Results to Variable   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:41 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0001 | Success THEN                                                                                                                        | Pronoc   |
| 11:19:41 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0010 | Success THEN                                                                                                                        | Pronoc   |
| 11:19:40 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0002 | Success THEN                                                                                                                        | Pronoc   |
| 11:19:40 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0003 | Success THEN                                                                                                                        | Pronoc   |
| 11:19:40 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0004 | Success THEN                                                                                                                        | Pronoc   |
| 11:19:40 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0005 | Success ELSE                                                                                                                        | Pronoc   |
| 11:19:40 am 21-Aug-25 | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& %ProgramData%\_automation\AgentProcedure\get-lenovowarranty\get-lenovowarranty.ps1" >"c:\Pronoc\commandresults-1572523429.txt" 2>&1 | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command                        | Success THEN                                                                                                                        | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0001                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0002                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0011                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0012                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0012                   | Results returned to global variable #global:psresult# and saved in Documents tab of server.                                         | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0012                   | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\479272172520311\GetFiles\..\docs\psoutput.txt with the new contents from c:\Pronoc\psoutput.txt in THEN step 2. | Pronoc   |
| 11:19:37 am 21-Aug-25 | Execute Powershell Command-0011                   | Powershell command completed!                                                                                                       | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0011                   | Executing powershell "" -Command "New-Item -Type Directory -Path %ProgramData%\_automation\AgentProcedure -Name get-lenovowarranty -ErrorAction SilentlyContinue" >"c:\Pronoc\psoutput.txt" | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0009                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0010                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0010                   | Sending output to global variable.                                                                                                  | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0007                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0008                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0008                   | New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%\_automation\AgentProcedure -Name get-lenovowarranty -ErrorAction SilentlyContinue" | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0008                   | Custom commands detected as New-Item -Type Directory -Path %ProgramData%\_automation\AgentProcedure -Name get-lenovowarranty -ErrorAction SilentlyContinue | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0003                   | Success THEN                                                                                                                        | Pronoc   |
| 11:19:35 am 21-Aug-25 | Execute Powershell Command-0004                   | Success ELSE                                                                                                                        | Pronoc   |
| 11:19:33 am 21-Aug-25 | Execute Powershell Command-0002                   | Powershell is present.                                                                                                              | Pronoc   |
| 11:19:32 am 21-Aug-25 | Lenovo Warranty (CF)                              | Machine is: LENOVO                                                                                                                  | Pronoc   |
| 11:19:27 am 21-Aug-25 | Run Now - Lenovo Warranty (CF)                    | Admin Pronoc scheduled procedure Run Now - Lenovo Warranty (CF) to run at Aug 21 2025 11:19AM                      | Pronoc   |

## Dependencies

[Warranty Expiration Date](/docs/961fdbf7-0066-46f1-9ebc-ead6efb63232)

## Variables

|Name                 | Description            |
|-----------------------|---------------------------------------------------|
|Manufacturer  | This shows the Manafucturer fetched from VSA|
|Dir  |      %ProgramData%\ _automation\AgentProcedure\get-lenovowarranty|

## Managed Files

[Get-LenovoWarranty](../../../static/attachments/get-lenovowarranty.ps1)

## Output

Script Logs
