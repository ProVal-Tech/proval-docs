---
id: '282be91b-f8ee-4ed8-9a1c-1cf9510678f2'
title: 'Windows 10/11 Complete Listing with Build Versions'
title_meta: 'Windows 10/11 Complete Listing with Build Versions'
keywords: ['windows', 'build', 'version', 'listing', 'support', 'eol']
description: 'This document provides a comprehensive dataview of Windows 10 and 11 systems, detailing their build versions such as 22H2 and 22H3. It includes essential information about each computer, including client details, operating system, last contact, and end-of-life status.'
tags: ['performance', 'report', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview shows the Windows 10/11 complete listing with their build version such as 22H2, 22H3, etc.

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)

## Columns

| Column            | Description                                       |
|-------------------|---------------------------------------------------|
| Clientid          | Clientid (Hidden)                                |
| Locationid        | Locationid (Hidden)                              |
| Computerid        | Computerid (Hidden)                              |
| Client            | Client name of the agent                         |
| Location          | Location name of the agent                       |
| Computer          | The computer name of the agent                   |
| Form Factor       | Form Factor of the computer (Desktop/Laptop/Virtual Workstation) |
| Operating System   | The operating system name of the agent           |
| LastContact       | The last contact of the agent with the RMM      |
| lastusername      | Last Logged In User                              |
| Windows Update Date | Windows upgrade date of the agent                |
| ReleaseID        | Current Build info of the agent i.e. 22H2, 22H3, etc. |
| Version           | Windows version information of the agent         |
| Feature Release Date | This shows the date when the build was released |
| EOL Date          | Support End Date                                 |
| EOL               | Computer is End of Life? (Yes/No)               |

## Format Control

| Column | Comparator | Value | Colour |
|--------|------------|-------|--------|
| EOL    | Equals     | Yes   | **\\<span style="color: rgb(178, 34, 34);">\\<span style="background-color: rgb(0, 0, 0);">Red\\</span>\\</span>** |
| EOL    | Equals     | No    | **\\<span style="color: rgb(0, 128, 0);">Green\\</span>** |













