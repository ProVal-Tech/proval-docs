---
id: 'cwa-onedrive-sync-status'
title: 'OneDrive Sync Status Data View'
title_meta: 'OneDrive Sync Status Data View for EPM'
keywords: ['onedrive', 'sync', 'status', 'data', 'view', 'client', 'location', 'computer', 'quota', 'collection']
description: 'This document provides a comprehensive overview of the OneDrive Sync Status data view, detailing the information stored in the EPM custom table pvl_odsync_status, including dependencies, columns, and their descriptions.'
tags: ['data', 'status', 'collection', 'quota', 'windows']
draft: false
unlisted: false
---
## Summary

The dataview presents the OneDrive Sync Status data stored in the [EPM - Data Collection - Custom Table - pvl_odsync_status](https://proval.itglue.com/DOC-5078775-16007815) custom table along with the basic information.

## Dependencies

- [EPM - Data Collection - Custom Table - pvl_odsync_status](https://proval.itglue.com/DOC-5078775-16007815)
- [EPM - Data Collection - Script - Get OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-16007800)

## Columns

| Column                  | Description                                         |
|------------------------|-----------------------------------------------------|
| clientid               | clientid (Hidden)                                  |
| locationid             | locationid (Hidden)                                |
| computerid             | computerid (Hidden)                                |
| Client                 | Client Name                                        |
| Location               | Location Name                                      |
| Computer               | Computer Name                                      |
| UserName               | UserName                                           |
| Folder Path            | Full Path to the OneDrive Directory                |
| OneDrive Sync Status    | Current Sync Status of OneDrive                    |
| Is Quota Available     | Is Quota Available ? (0/1)                        |
| Total Quota (GB)      | Overall Size of available Quota (GB)               |
| Used Quota (GB)       | Currently Used size of Quota (GB)                  |
| Quota Label            | Current Status of Available Quota                  |
| Data Collection Time    | Data Collection Time                                |
| Last Contact           | Last Contact with Automate                          |
| Operating System       | Operating System                                    |
| Form Factor            | Form Factor of the machine                          |


