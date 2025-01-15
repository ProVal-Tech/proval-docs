---
id: '37fe5efc-3b1d-45d8-906d-0388baf6caac'
title: 'Windows 10 - Feature Update - Latest Statistics'
title_meta: 'Windows 10 - Feature Update - Latest Statistics'
keywords: ['windows', 'update', 'statistics', 'feature', 'install', 'report']
description: 'This document provides a comprehensive overview of the statistics related to the Windows 10 - Feature Update - Latest script, including installation dates, states, success and failure counts, and total attempts for each Windows version.'
tags: ['windows', 'update', 'report', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview is intended to provide statistics regarding the Windows 10 - Feature Update - Latest script. It gives information on the update installation date, the update state, success count of the script for each Windows version, failure count for each version, and the total attempts made.

## Requirements

1. The Script Windows 10 - Feature Update - Latest must be used to push the most recent feature update.
2. The Group Windows 10 - Upgrade Pending Reports must have the remote monitor (Application - Event 6501 - Provider Update-Windows10-PS) configured with an autofix action calling the script (Windows 10 Update Stats - Retrieve) on error every day all day (See Below). This should be configured within one hour of running the Windows 10 - Feature Update - Latest script for the first time.

![Image](../../../static/img/Windows-10---Feature-Update---Latest---Stats/image_1.png)

## Dependencies

- [SEC - Windows Patching - Script - Windows 10 - Feature Update - Install Latest](https://proval.itglue.com/DOC-5078775-9744053)
- [EPM - Data Collection - Script - Windows 10 Update Stats - Retrieve](https://proval.itglue.com/DOC-5078775-9747193)

## Columns

| Column             | Description                                                                                              |
|--------------------|----------------------------------------------------------------------------------------------------------|
| ID                 | Displays the computer id.                                                                                |
| Client Name        | Displays the client name for the device.                                                                |
| Computer Name      | Displays the name of the computer.                                                                       |
| Windows Version     | Displays the currently installed version of Windows on the computer.                                     |
| Installation Date   | Displays the date and time that the Windows 10 - Feature Update - Latest Script was run on the computer.|
| Installation State  | Displays the State of the Installation pushed, It will display one of the following (Not Attempted, Attempted, Failed, or Successful). |
| Success Count      | Displays the total times the Windows 10 Feature Update - Latest script was run and returned a Successful result for this version. |
| Failure Count      | Displays the total times the Windows 10 Feature Update - Latest script was run and returned a failed result for this version. |
| Total Attempts      | Displays the total times the Windows 10 Feature update attempted to push that Windows version on the specific computer. |






