---
id: '5b97dae1-f82c-4ae4-9e21-a5c4e3b1480c'
slug: /5b97dae1-f82c-4ae4-9e21-a5c4e3b1480c
title: 'Microsoft OneDrive Sync Status Script'
title_meta: 'Microsoft OneDrive Sync Status Script'
keywords: ['onedrive', 'sync', 'status', 'data', 'collection']
description: 'This document provides an overview of the OneDrive Sync Status data view, detailing the information gathered by the EPM script designed for monitoring OneDrive synchronization across devices. It includes dependencies and a breakdown of the columns presented in the data view.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The data view displays the OneDrive Sync Status gathered by the [EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](/docs/11c05d45-a0fb-4cfb-b388-cdc59362d9a1) script.

## Dependencies

- [EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](/docs/11c05d45-a0fb-4cfb-b388-cdc59362d9a1)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](/docs/b7936e96-423d-4c53-bd95-d10a6c4861f1)

## Columns

| Column                  | Description                                           |
|------------------------|-------------------------------------------------------|
| Clientid               | Client ID (Hidden)                                   |
| Locationid             | Location ID (Hidden)                                 |
| Computerid             | Computer ID (Hidden)                                 |
| Client_Name            | Client Name                                          |
| Location_Name          | Location Name                                        |
| Computer_Name          | Computer Name                                        |
| Operating_System       | Operating System                                     |
| Last_Contact           | Last contact time of the computer with Automate      |
| Sync Enabled           | Is OneDrive Sync enabled?                            |
| Sync Status            | OneDrive Sync Status                                 |
| One_Drive_Sync_Status  | Detailed Sync Status fetched by the script           |
| Script_Run_Time        | Data Collection Time                                  |


