---
id: 'cwa-export-eventlogs'
title: 'Export Application and Security Event Logs to CSV'
title_meta: 'Export Application and Security Event Logs to CSV'
keywords: ['event', 'logs', 'csv', 'export', 'upload', 'size', 'critical', 'warning', 'error']
description: 'This document describes a script that exports Application and Security event logs into a CSV file with configurable options for event levels, date range, and export path. It includes functionality to upload the CSV file to LTShare, with checks on file size to manage local storage.'
tags: ['csv', 'event', 'export', 'upload', 'size', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

The script is designed to export `Application` and `Security` event logs into a CSV file with configurable options. The user can control which event levels (Critical, Warning, Error) to export, set the number of days to select events from, and specify the folder path for the exported CSV file.

The script checks the size of the generated CSV file. If the file size is less than 30MB, it proceeds to upload to the designated LTShare. If the CSV file is successfully uploaded, it is removed from the end machine to prevent clutter. If the file size exceeds 30MB, it remains on the end machine for review.

## Sample Run

![Sample Run](..\..\..\static\img\Export-Application-and-Security-Logs-to-CSV\image_1.png)

## Variables

| Name              | Description                                  |
|-------------------|----------------------------------------------|
| ProjectName       | Export-Eventlogs                             |
| WorkingDirectory   | C:\ProgramData\_Automation\script\Export-Eventlogs |
| Param             | Parameter set for the powershell script      |

#### User Parameters

| Name        | Example                     | Required | Description                                                                                                                                                        |
|-------------|-----------------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Level       | Critical,Error,Warning      | False    | Event Type to export. Supported options are `Critical, Error, and Warning`. Multiple levels can be separated by a comma (without space or quotations). The default value is `Critical`. |
| Days        | 180                         | False    | Number of days to select event logs from. Only integer values are supported. The default value is `30`.                                                          |
| ExportPath  | C:\Temp                     | False    | Folder path for the exported CSV file. The default value is `C:\Windows\Temp`.                                                                                   |

**Quotations, (both single and double) and Spaces are not supported.**

## Output

- Script Logs
- File Upload



