---
id: 'cwa-windows-drive-defragmentation-report'
title: 'Windows Drive Defragmentation Report'
title_meta: 'Windows Drive Defragmentation Report'
keywords: ['defragmentation', 'report', 'client', 'computer', 'script', 'location', 'drive']
description: 'This document provides a detailed overview of the dataview that publishes the defragmentation scan results using a specific script. It outlines the dependencies, the columns included in the report, and the information displayed for each client and computer.'
tags: ['report', 'script', 'client', 'computer', 'location', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview publishes the defragmentation scan result by using a script @Windows Drive Defragmentation.

## Dependencies

- @Windows Drive Defragmentation

## Columns

| Column                | Description                                             |
|----------------------|---------------------------------------------------------|
| Client Name          | Displays the name of the client                         |
| Client ID            | Displays the ID of the client                           |
| Computer Name        | Displays the Computer Name of the machine               |
| Computer ID          | Displays the computer ID of the machine                 |
| Location Name        | Displays the location name of the client                |
| Location ID          | Displays the location ID                                 |
| Script Ran Count     | Displays the number of times the script ran             |
| Script Ran Date      | Displays the date when the script ran                   |
| Drive Fragmented     | Displays the drive letter of the fragmented drive       |
| Drive Fragment Report | Displays the full report of fragmentation fetched by the script |



