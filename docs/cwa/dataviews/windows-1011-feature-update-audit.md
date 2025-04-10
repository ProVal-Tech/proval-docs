---
id: '282be91b-f8ee-4ed8-9a1c-1cf9510678f2'
slug: /282be91b-f8ee-4ed8-9a1c-1cf9510678f2
title: 'Windows 1011 Feature Update Audit'
title_meta: 'Windows 1011 Feature Update Audit'
keywords: ['windows', 'build', 'version', 'listing', 'support', 'eol']
description: 'This document provides a comprehensive dataview of Windows 10 and 11 systems, detailing their build versions such as 22H2 and 22H3. It includes essential information about each computer, including client details, operating system, last contact, and end-of-life status.'
tags: ['performance', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview provides a complete listing of Windows 10/11 systems along with their build versions, such as 22H2 and 22H3.

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Columns

| Column               | Description                                                      |
| -------------------- | ---------------------------------------------------------------- |
| Clientid             | Client ID (Hidden)                                               |
| Locationid           | Location ID (Hidden)                                             |
| Computerid           | Computer ID (Hidden)                                             |
| Client               | Client name of the agent                                         |
| Location             | Location name of the agent                                       |
| Computer             | The computer name of the agent                                   |
| Form Factor          | Form factor of the computer (Desktop/Laptop/Virtual Workstation) |
| Operating System     | The operating system name of the agent                           |
| LastContact          | The last contact of the agent with the RMM                       |
| LastUsername         | Last logged-in user                                              |
| Windows Update Date  | Windows upgrade date of the agent                                |
| ReleaseID            | Current build info of the agent, i.e., 22H2, 22H3, etc.          |
| Version              | Windows version information of the agent                         |
| Feature Release Date | The date when the build was released                             |
| EOL Date             | Support end date                                                 |
| EOL                  | Is the computer end of life? (Yes/No)                            |

## Format Control

| Column | Comparator | Value | Colour |
| ------ | ---------- | ----- | ------ |
| EOL    | Equals     | Yes   | Red    |
| EOL    | Equals     | No    | Green  |


