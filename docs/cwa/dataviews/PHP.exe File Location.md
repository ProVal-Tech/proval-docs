---
id: 'cwa-locate-php-info'
title: 'Locate PHP.exe Information Display'
title_meta: 'Locate PHP.exe Information Display'
keywords: ['php', 'file', 'audit', 'data', 'collection', 'monitor']
description: 'This document provides an overview of the information displayed for the PHP.exe file, fetched by the Locate PHP.exe script. It outlines the dependencies, columns, and details relevant to PHP file auditing within the ConnectWise Automate environment.'
tags: ['data', 'collection', 'audit', 'monitor', 'file', 'windows']
draft: false
unlisted: false
---
## Summary

Displays the information of PHP.exe file fetched by the [Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023) script.

## Dependencies

- [EPM - Data Collection - Custom Table - pvl_php_audit](https://proval.itglue.com/DOC-5078775-16245130)
- [EPM - Data Collection - Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023)
- [EPM - Data Collection - Internal Monitor - Execute Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245108)

## Columns

| Column                  | Description                                                                                      |
|------------------------|--------------------------------------------------------------------------------------------------|
| Clientid               | Clientid (Hidden)                                                                                |
| Locationid             | Locationid (Hidden)                                                                              |
| Computerid             | Computerid (Hidden)                                                                              |
| Client                 | Client Name                                                                                     |
| Location               | Location Name                                                                                   |
| Computer               | Computer Name                                                                                   |
| Operating System       | Operating System                                                                                 |
| Last Contact           | Last Contact With RMM                                                                           |
| Last Logged-In User    | Last Logged-In User                                                                              |
| Form Factor            | Form Factor (Desktop/Laptop/Hyper-V Host/Virtual Server/Physical Server)                      |
| File Path              | Path to the PHP.exe file                                                                         |
| File Version           | Version of the File if available                                                                  |
| Size (MB)             | Size of the file in Mega Bytes                                                                    |
| Creation Time          | File Creation Time                                                                                |
| Last Write Time        | File Modification Time                                                                            |
| Attributes             | File's Attributes                                                                                 |
| Script Run Time        | Data Collection Time                                                                              |

