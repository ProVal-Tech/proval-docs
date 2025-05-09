---
id: 'abc609cc-f2a2-4a37-94f9-e8e18f6ded31'
slug: /abc609cc-f2a2-4a37-94f9-e8e18f6ded31
title: 'Defragment Scan Report'
title_meta: 'Defragment Scan Report'
keywords: ['defragmentation', 'report', 'client', 'computer', 'script', 'location', 'drive']
description: 'This document provides a detailed overview of the dataview that publishes the defragmentation scan results using a specific script. It outlines the dependencies, the columns included in the report, and the information displayed for each client and computer.'
tags: ['performance', 'report']
draft: false
unlisted: false
---

## Summary

This dataview publishes the defragmentation scan results by using the script @Windows Drive Defragmentation.

## Dependencies

- @Windows Drive Defragmentation

## Columns

| Column                | Description                                             |
|----------------------|---------------------------------------------------------|
| Client Name          | Displays the name of the client                         |
| Client ID            | Displays the ID of the client                           |
| Computer Name        | Displays the computer name of the machine               |
| Computer ID          | Displays the computer ID of the machine                 |
| Location Name        | Displays the location name of the client                |
| Location ID          | Displays the location ID                                 |
| Script Ran Count     | Displays the number of times the script ran             |
| Script Ran Date      | Displays the date when the script ran                   |
| Drive Fragmented     | Displays the drive letter of the fragmented drive       |
| Drive Fragment Report | Displays the full report of fragmentation fetched by the script |