---
id: '2b8f8910-5e27-4f1e-8921-65bbe93fb09f'
title: 'Physical Drives Collection Script'
title_meta: 'Physical Drives Collection Script for Non-Removable Drives'
keywords: ['drives', 'collection', 'physical', 'non-removable', 'capacity', 'disk']
description: 'This document provides a detailed overview of a script that polls for physical, non-removable drives with a capacity greater than 10GB. It captures the available drive letters and logs the results for further analysis, ensuring efficient management of disk resources.'
tags: ['disk', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This script polls for physical, non-removable drives with a capacity greater than 10GB and places the available drive letters in [EPM - Disk - Custom Field - xPVAL Drive List](<../custom-fields/xPVAL Drive List.md>).

## Sample Run

| Time                   | Action                      | Result                                                                                             | User                      |
|------------------------|-----------------------------|----------------------------------------------------------------------------------------------------|---------------------------|
| 3:15:59 PM 1-Sep-22    | Drive List Collection       | Success THEN                                                                                       | provaltech.com/dan.hicks  |
| 3:15:59 PM 1-Sep-22    | Drive List Collection       | C:                                                                                                 | provaltech.com/dan.hicks  |
| 3:15:59 PM 1-Sep-22    | Execute PowerShell Command   | Success THEN                                                                                       | provaltech.com/dan.hicks  |
| 3:15:59 PM 1-Sep-22    | Execute PowerShell Command-0012 | Results returned to global variable #global:psresult# and saved in Documents tab of server.      | provaltech.com/dan.hicks  |
| 3:15:59 PM 1-Sep-22    | Execute PowerShell Command-0011 | PowerShell command completed!                                                                       | provaltech.com/dan.hicks  |
| 3:15:51 PM 1-Sep-22    | Execute PowerShell Command-0011 | Executing PowerShell command: \"((Get-Partition | Where-Object \{($_.DriveLetter -and $_.Size -gt 10000000000) -and ($_.DiskPath -notmatch 'usb')} | Select-Object -expandProperty DriveLetter) -join ': ')+':'\" > \"c:/provaltech/psoutput.txt\" | provaltech.com/dan.hicks  |
| 3:15:51 PM 1-Sep-22    | Execute PowerShell Command-0010 | Sending output to global variable.                                                                  | provaltech.com/dan.hicks  |
| 3:15:51 PM 1-Sep-22    | Execute PowerShell Command-0008 | New command variable is: -Command \"((Get-Partition | Where-Object \{($_.DriveLetter -and $_.Size -gt 10000000000) -and ($_.DiskPath -notmatch 'usb')} | Select-Object -expandProperty DriveLetter) -join ': ')+':'\" | provaltech.com/dan.hicks  |
| 3:15:51 PM 1-Sep-22    | Execute PowerShell Command-0008 | Custom commands detected as: ((Get-Partition | Where-Object \{($_.DriveLetter -and $_.Size -gt 10000000000) -and ($_.DiskPath -notmatch 'usb')} | Select-Object -expandProperty DriveLetter) -join ': ')+':' | provaltech.com/dan.hicks  |
| 3:15:48 PM 1-Sep-22    | Execute PowerShell Command-0002 | PowerShell is present.                                                                             | provaltech.com/dan.hicks  |
| 3:15:39 PM 1-Sep-22    | Run Now - Drive List Collection | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Drive List Collection to run at Sep 1, 2022, 3:15 PM | provaltech.com/dan.hicks  |

## Process

The script queries the endpoint for physical, non-removable drives with a capacity greater than 10GB.

## Output

Agent Procedure Log  
[EPM - Disk - Custom Field - xPVAL Drive List](<../custom-fields/xPVAL Drive List.md>)


