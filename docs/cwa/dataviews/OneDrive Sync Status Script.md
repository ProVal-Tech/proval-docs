---
id: '61160125-8794-4e01-ba0a-3bf4ec81077e'
title: 'OneDrive Sync Status Script'
title_meta: 'OneDrive Sync Status Script'
keywords: ['onedrive', 'sync', 'status', 'data', 'view', 'client', 'location', 'computer', 'quota', 'collection']
description: 'This document provides a comprehensive overview of the OneDrive Sync Status data view, detailing the information stored in the EPM custom table pvl_odsync_status, including dependencies, columns, and their descriptions.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The data view presents the OneDrive Sync Status data stored in the [EPM - Data Collection - Custom Table - pvl_odsync_status](<../tables/pvl_odsync_status.md>) custom table along with the basic information.

## Dependencies

- [EPM - Data Collection - Custom Table - pvl_odsync_status](<../tables/pvl_odsync_status.md>)
- [EPM - Data Collection - Script - Get OneDrive Sync Status [DV]](<../scripts/Get OneDrive Sync Status DV.md>)

## Columns

| Column                  | Description                                         |
|------------------------|-----------------------------------------------------|
| clientid               | clientid (Hidden)                                  |
| locationid             | locationid (Hidden)                                |
| computerid             | computerid (Hidden)                                |
| Client                 | Client Name                                        |
| Location               | Location Name                                      |
| Computer               | Computer Name                                      |
| UserName               | User Name                                          |
| Folder Path            | Full Path to the OneDrive Directory                |
| OneDrive Sync Status    | Current Sync Status of OneDrive                    |
| Is Quota Available     | Is Quota Available? (0/1)                         |
| Total Quota (GB)      | Overall Size of available Quota (GB)               |
| Used Quota (GB)       | Currently Used Size of Quota (GB)                  |
| Quota Label            | Current Status of Available Quota                  |
| Data Collection Time    | Data Collection Time                                |
| Last Contact           | Last Contact with Automate                          |
| Operating System       | Operating System                                    |
| Form Factor            | Form Factor of the machine                          |




