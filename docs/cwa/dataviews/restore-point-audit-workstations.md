---
id: '29f1dee2-174e-47e1-ae3a-f233fe55386c'
slug: /29f1dee2-174e-47e1-ae3a-f233fe55386c
title: 'Restore Point Audit - Workstations'
title_meta: 'Restore Point Audit - Workstations'
keywords: ['audit', 'restore', 'point', 'workstations', 'dataview']
description: 'This document provides an overview of a dataview designed to audit restore point details on workstations using a specific script. It outlines the dependencies, columns included in the dataview, and their descriptions, enabling effective tracking and management of restore points.'
tags: ['backup', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview helps you audit restore point details on workstations with the help of the script: @windows Restore Point Automation - Gather Only.

## Dependencies

- @windows Restore Point Automation - Gather Only

## Columns

| Column                   | Description                                               |
|-------------------------|-----------------------------------------------------------|
| Client Name             | Displays the name of the client                           |
| Client ID               | Displays the ID of the client                             |
| Computer Name           | Displays the name of the computer                         |
| Computer ID             | Displays the ID of the computer                           |
| Location Name           | Displays the name of the location                         |
| Location ID             | Displays the ID of the location                           |
| Operating System        | Displays the operating system of the machine              |
| Restore Sequence        | Displays the sequence number of the restore point detected |
| Restore Point Date      | Displays the date of the restore point detected           |
| Restore Point Description| Displays the name of the restore point detected           |


