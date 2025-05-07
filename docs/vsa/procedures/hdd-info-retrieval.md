---
id: 'f64826a7-f9c0-45c5-9d1f-136657fbd875'
slug: /f64826a7-f9c0-45c5-9d1f-136657fbd875
title: 'HDD Info Retrieval'
title_meta: 'HDD Info Retrieval'
keywords: ['disk', 'drive', 'csv', 'information', 'reporting']
description: 'This document outlines a procedure to retrieve disk drive information and save it to a CSV file on the endpoint for client ingestion. It provides a detailed log example and dependencies related to the EPM - Disk - Agnostic - Get-DiskInfo implementation.'
tags: ['disk', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document retrieves useful disk drive information and saves it to a CSV file on the endpoint for client ingestion. It is an agnostic stack implementation of [EPM - Disk - Agnostic - Get-DiskInfo](/docs/5cba460d-9322-4c3b-9630-55cb46d57b1a).

## Example Agent Procedure Log

| Time                  | Procedure                                   | Status                                                                                                     | User                          |
|-----------------------|---------------------------------------------|------------------------------------------------------------------------------------------------------------|-------------------------------|
| 1:00:40 pm 5-Oct-22   | HDD Info Retrieval                          | Success THEN                                                                                               | provaltech.com/dan.hicks      |
| 1:00:40 pm 5-Oct-22   | HDD Info Retrieval-0002                     | Drive Reporting Complete. See GetLogs/StackLogs/DriveReport.csv for details.                              | provaltech.com/dan.hicks      |
| 1:00:39 pm 5-Oct-22   | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                               | provaltech.com/dan.hicks      |
| 1:00:38 pm 5-Oct-22   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 1:00:38 pm 5-Oct-22   | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/121486040513998/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks      |
| 12:59:35 pm 5-Oct-22  | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"$driveInfo = %ProgramData%/_automation/StackContent/DriveReporting/Get-DiskInfo.ps1; $driveinfo.DiskDrive | Select-Object FriendlyName, Model, SerialNumber, BusType, MediaType, HealthStatus, Size | Export-Csv -Path %ProgramData%/_automation/StackContent/DriveReporting/DriveReport.csv -NoTypeInformation\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks      |
| 12:59:35 pm 5-Oct-22  | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                         | provaltech.com/dan.hicks      |
| 12:59:35 pm 5-Oct-22  | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as $driveInfo = %ProgramData%/_automation/StackContent/DriveReporting/Get-DiskInfo.ps1; $driveinfo.DiskDrive | Select-Object FriendlyName, Model, SerialNumber, BusType, MediaType, HealthStatus, Size | Export-Csv -Path %ProgramData%/_automation/StackContent/DriveReporting/DriveReport.csv -NoTypeInformation | provaltech.com/dan.hicks      |
| 12:59:35 pm 5-Oct-22  | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                      | provaltech.com/dan.hicks      |
| 12:59:27 pm 5-Oct-22  | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                     | provaltech.com/dan.hicks      |
| 12:59:16 pm 5-Oct-22  | Execute Powershell Command                   | Success THEN                                                                                               | provaltech.com/dan.hicks      |
| 12:59:15 pm 5-Oct-22  | Execute Powershell Command-0011              | Powershell command completed!                                                                              | provaltech.com/dan.hicks      |
| 12:59:06 pm 5-Oct-22  | Execute Powershell Command-0011              | Executing powershell \"\" -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/StackContent -Name DriveReporting -Force -ErrorAction SilentlyContinue\" \"\" | provaltech.com/dan.hicks      |
| 12:59:06 pm 5-Oct-22  | Execute Powershell Command-0010              | Not sending output to variable.                                                                            | provaltech.com/dan.hicks      |
| 12:59:06 pm 5-Oct-22  | Execute Powershell Command-0008              | New command variable is: -Command \"New-Item -Type Directory -Path %ProgramData%/_automation/StackContent -Name DriveReporting -Force -ErrorAction SilentlyContinue\" | provaltech.com/dan.hicks      |
| 12:59:06 pm 5-Oct-22  | Execute Powershell Command-0008              | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/StackContent -Name DriveReporting -Force -ErrorAction SilentlyContinue | provaltech.com/dan.hicks      |
| 12:58:57 pm 5-Oct-22  | Execute Powershell Command-0002              | Powershell is present.                                                                                     | provaltech.com/dan.hicks      |
| 12:58:46 pm 5-Oct-22  | Run Now - HDD Info Retrieval                 | Admin provaltech.com/dan.hicks scheduled procedure Run Now - HDD Info Retrieval to run at Oct 5 2022 12:58 PM | provaltech.com/dan.hicks      |

## Dependencies

[EPM - Disk - Agnostic - Get-DiskInfo](/docs/5cba460d-9322-4c3b-9630-55cb46d57b1a)

## Process

This procedure runs Get-DiskInfo and creates a CSV file with commonly requested values.

## Output

GetFile: StackContent/DiskReport.csv  
Endpoint: %ProgramData%/_automation/StackContent/DiskReport/DiskReport.csv

