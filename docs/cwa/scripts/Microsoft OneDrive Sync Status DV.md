---
id: 'cwa-onedrive-sync-status'
title: 'OneDrive Sync Status Collection Script'
title_meta: 'OneDrive Sync Status Collection Script for Windows Machines'
keywords: ['onedrive', 'sync', 'status', 'windows', 'script']
description: 'This document details a script for collecting OneDrive sync status information from Windows machines, targeting Non-SharePoint Linked Sites. The script utilizes the Onedrive.dll module and requires an active user session to function correctly.'
tags: ['windows', 'configuration', 'software', 'performance', 'report']
draft: false
unlisted: false
---
## Summary

This document outlines a script designed to collect OneDrive sync status information from Windows machines exclusively for Non-SharePoint Linked Sites. The script leverages the [Onedrive.dll](https://github.com/rodneyviana/ODSyncService) module to retrieve the requisite data. It is crucial to note that the script necessitates an active user session on the computer to operate effectively.

## Sample Run

![Sample Run](..\..\..\static\img\Microsoft-OneDrive-Sync-Status-DV\image_1.png)

## Dependencies

- [EPM - Data Collection - Dataview - Microsoft OneDrive Sync Status [Script]](https://proval.itglue.com/DOC-5078775-14227800)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](https://proval.itglue.com/DOC-5078775-14241947)

#### Global Parameters

| Name      | Default                                             | Required | Description                                          |
|-----------|----------------------------------------------------|----------|------------------------------------------------------|
| ODFolder  | C:\Windows\LTSvc\Packages\ODFolder                 | True     | Path to write and execute the PowerShell script.    |
| ODFile    | C:\Windows\LTSvc\Packages\ODFolder\ODFile.ps1     | True     | Full path of the PowerShell script.                  |

#### Script States

| Name                          | Example                                                                                                                                                        | Description                                                             |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| OneDriveSyncStatus            | "Sync Status for "ramkishor" for "C:\Users\ramkishor\OneDrive\Desktop" is "Synced"; "Sync Status for "ramkishor" for "C:\Users\ramkishor\OneDrive\Documents" is "Synced"; "Sync Status for "ramkishor" for "C:\Users\ramkishor\OneDrive\Picture" is "Not Synced"; | Stores the result returned by the PowerShell script checking the OneDrive status on the endpoint. |
| OneDriveSyncStatusScriptruntime | 2023-10-26 11:51:02                                                                                                                                         | Stores the data collection time                                       |

## Output

- Script log
- Script states



