---
id: 'vsa-soji-disk-cleaner'
title: 'Soji - Windows Disk Cleaner'
title_meta: 'Soji - Windows Disk Cleaner'
keywords: ['windows', 'disk', 'cleaner', 'log', 'csv', 'report']
description: 'Soji is a Windows disk cleaner designed to log actions to the agent procedure log and upload CSV reports to the target agent’s "Get Files" section. This document provides a summary, sample run, process details, output expectations, and export attachment instructions for using Soji effectively.'
tags: ['disk-cleanup', 'logging', 'reporting', 'windows', 'software']
draft: false
unlisted: false
---
## Summary

Soji - A Windows disk cleaner. Will log to the agent procedure log and upload CSV reports to the "Get Files" section of the target agent.

## Sample Run

| Time                     | Action                                      | Result                                                                                                                                                                                                                         | Status   |
|--------------------------|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| 1:37:51 pm 1-Jul-22     | Soji - Disk Cleaner                         | Success THEN                                                                                                                                                                                                                   | learning |
| 1:37:51 pm 1-Jul-22     | Soji - Disk Cleaner                         | Comment at THEN step 19                                                                                                                                                                                                        | learning |
| 1:37:49 pm 1-Jul-22     | Soji - Disk Cleaner                         | Soji Log: 2022-07-01 08:15:38.037 -07:00 [INF] Starting up Soji! 2022-07-01 08:15:38.308 -07:00 [INF] No drive letters passed in. Starting drive detection. 2022-07-01 08:15:38.313 -07:00 [INF] 1 valid drive letter detected. 2022-07-01 08:15:38.315 -07:00 [INF] Getting volume caches for drive C:// ... | learning |
| 1:37:49 pm 1-Jul-22     | Execute Shell command - Get Results to Variable | Success THEN                                                                                                                                                                                                                   | learning |
| 1:37:47 pm 1-Jul-22     | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: TYPE "%ProgramData%//_automation//app//Soji//SojiLogs//Soji.log" >"c://provaltech//commandresults-1215149873.txt" 2>&1                                                                 | learning |
| 1:37:44 pm 1-Jul-22     | Soji - Disk Cleaner                         | Files created successfully. Running Soji                                                                                                                                                                                      | learning |
| 1:37:44 pm 1-Jul-22     | Soji - Disk Cleaner                         | Comment at THEN step 10                                                                                                                                                                                                        | learning |
| 1:37:42 pm 1-Jul-22     | Write text to file                          | Success THEN                                                                                                                                                                                                                   | learning |
| 1:37:42 pm 1-Jul-22     | Write text to file-0002                    | Overwrite enabled and file exists - deleting before write process.                                                                                                                                                            | learning |
| 1:37:38 pm 1-Jul-22     | Soji - Disk Cleaner-0001                   | App folder Created. Directory: %ProgramData%//_automation//app//Soji                                                                                                                                                        | learning |
| 1:37:37 pm 1-Jul-22     | Soji - Disk Cleaner-0001                   | App Folder does not exist. Creating...                                                                                                                                                                                       | learning |
| 1:37:29 pm 1-Jul-22     | Run Now - Soji - Disk Cleaner               | Admin learning scheduled procedure Run Now - Soji - Disk Cleaner to run at Jul 1 2022 1:37PM                                                                                                                                 | learning |

## Process

[https://proval.itglue.com/5078775/docs/10338558](https://proval.itglue.com/5078775/docs/10338558)

## Output

- Agent Procedure Log.

## Export Attachment

Attach the content XML VSA Export to this document.



