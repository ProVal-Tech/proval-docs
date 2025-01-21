---
id: '142bb69a-42f3-469a-ac3f-a8b9007c73f0'
title: 'PHP.exe File Location'
title_meta: 'PHP.exe File Location'
keywords: ['php', 'file', 'audit', 'data', 'collection', 'monitor']
description: 'This document provides an overview of the information displayed for the PHP.exe file, fetched by the Locate PHP.exe script. It outlines the dependencies, columns, and details relevant to PHP file auditing within the ConnectWise Automate environment.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Displays the information of the PHP.exe file fetched by the [Locate PHP.exe](<../scripts/Locate PHP.exe.md>) script.

## Dependencies

- [EPM - Data Collection - Custom Table - pvl_php_audit](<../tables/pvl_php_audit.md>)
- [EPM - Data Collection - Script - Locate PHP.exe](<../scripts/Locate PHP.exe.md>)
- [EPM - Data Collection - Internal Monitor - Execute Script - Locate PHP.exe](<../monitors/Execute Script - Locate PHP.exe.md>)

## Columns

| Column                  | Description                                                                                      |
|------------------------|--------------------------------------------------------------------------------------------------|
| Clientid               | Client ID (Hidden)                                                                                |
| Locationid             | Location ID (Hidden)                                                                              |
| Computerid             | Computer ID (Hidden)                                                                              |
| Client                 | Client Name                                                                                     |
| Location               | Location Name                                                                                   |
| Computer               | Computer Name                                                                                   |
| Operating System       | Operating System                                                                                 |
| Last Contact           | Last Contact With RMM                                                                           |
| Last Logged-In User    | Last Logged-In User                                                                              |
| Form Factor            | Form Factor (Desktop/Laptop/Hyper-V Host/Virtual Server/Physical Server)                      |
| File Path              | Path to the PHP.exe file                                                                         |
| File Version           | Version of the file, if available                                                                  |
| Size (MB)             | Size of the file in megabytes                                                                    |
| Creation Time          | File Creation Time                                                                                |
| Last Write Time        | File Modification Time                                                                            |
| Attributes             | File's Attributes                                                                                 |
| Script Run Time        | Data Collection Time                                                                              |



