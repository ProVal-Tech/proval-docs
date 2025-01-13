---
id: 'cwa_outlook_ost_pst_audit'
title: 'Outlook OST/PST Audit Dataview'
title_meta: 'Outlook OST/PST Audit Dataview'
keywords: ['dataview', 'outlook', 'audit', 'ost', 'pst', 'windows']
description: 'This document provides a detailed overview of the Dataview that displays the path and size of OST and PST files for users on a Windows machine. It includes dependencies, column descriptions, and data collection details essential for monitoring Outlook files.'
tags: ['windows', 'report', 'performance', 'setup', 'database']
draft: false
unlisted: false
---
## Summary

This Dataview displays the result of the path and size of the OST and PST files for users on a windows machine.

## Dependencies

- [EPM - Data Collection - Script - Microsoft Outlook - OST/PST - Audit](https://proval.itglue.com/DOC-5078775-8168634)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](https://proval.itglue.com/DOC-5078775-15490756)
- [EPM - Data Collection - Custom Table - pvl_outlook_pst_ost_audit](https://proval.itglue.com/DOC-5078775-15595946)

## Columns

| Column                     | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| Clientid                  | Clientid (Hidden)                                          |
| Locationid                | Locationid (Hidden)                                        |
| Computerid                | Computerid (Hidden)                                        |
| Client Name               | Client Name                                                |
| Location Name             | Location Name                                              |
| Computer Name             | Computer Name                                              |
| File Name                 | Name of the file                                          |
| Path                      | Path to the OST/PST file                                   |
| Type                      | Type of the file (ost/pst)                                 |
| Size (MB)                | Size of the file in MegaBytes                              |
| Size (GB)                | Size of the file in GigaBytes                              |
| Last Modified Time        | Most recent modification time of the file                  |
| Data Collection Time      | Data Collection Time                                        |
| Operating System          | Operating System                                            |
| Last Contact              | Last Contact with RMM                                      |
| Last Logged In User       | Last Logged In User                                        |




