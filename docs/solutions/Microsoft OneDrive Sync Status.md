---
id: 'ad3966ca-92dd-45b6-880d-e665821bd6da'
title: 'OneDrive Sync Status Monitoring for Non-SharePoint Linked Sites'
title_meta: 'OneDrive Sync Status Monitoring for Non-SharePoint Linked Sites'
keywords: ['onedrive', 'sync', 'monitoring', 'automation', 'alerting', 'auditing']
description: 'This document outlines the implementation of a solution to collect and display OneDrive sync status information from Windows machines, specifically for Non-SharePoint Linked Sites. It includes associated content for auditing and alerting, as well as a detailed implementation guide and FAQs regarding potential errors in data retrieval.'
tags: ['alerting', 'auditing', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to collect and display OneDrive sync status information from Windows machines exclusively for Non-SharePoint Linked Sites.

## Associated Content

#### Auditing

| Content                                                                 | Type           | Function                                                   |
|-------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| [Script - Microsoft OneDrive Sync Status [DV]](<../cwa/scripts/Microsoft OneDrive Sync Status DV.md>) | Script         | Fetch the data.                                           |
| [Dataview - Microsoft OneDrive Sync Status [Script]](<../cwa/dataviews/Microsoft OneDrive Sync Status Script.md>) | Dataview       | Display the data.                                         |
| [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](<../cwa/monitors/Execute Script - Microsoft OneDrive Sync Status.md>) | Internal Monitor | Detect the relevant computers to execute the script.     |
| △ CUSTOM - Execute Script - Microsoft OneDrive Sync Status              | Alert Template | Executes the script against the computers detected by the Internal Monitor. |

#### Alerting

| Content                                                                 | Type           | Function                                                   |
|-------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| [Internal Monitor - OneDrive Sync Status Issue](<../cwa/monitors/OneDrive Sync Status Issue.md>) | Internal Monitor | Detects the problematic machines.                          |
| [Script - Ticket Creation - Computer](<../cwa/scripts/Ticket Creation - Computer.md>) | Autofix Script | Manages ticketing.                                        |
| △ Custom - Ticket Creation - Computer                                     | Alert Template | Executes the script against the computers detected by the Internal Monitor. |

## Implementation

### 1.
Import/Update the following scripts from the `ProSync` plugin:
- [Script - Microsoft OneDrive Sync Status [DV]](<../cwa/scripts/Microsoft OneDrive Sync Status DV.md>)  
- [Script - Ticket Creation - Computer](<../cwa/scripts/Ticket Creation - Computer.md>)  

### 2.
Import/Update the following internal monitors from the `ProSync` plugin:
- [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](<../cwa/monitors/Execute Script - Microsoft OneDrive Sync Status.md>)  
- [Internal Monitor - OneDrive Sync Status Issue](<../cwa/monitors/OneDrive Sync Status Issue.md>)  

### 3.
Import/Update the following alert templates from the `ProSync` plugin:
- △ CUSTOM - Execute Script - Microsoft OneDrive Sync Status  
- △ Custom - Ticket Creation - Computer  

### 4.
Import the [Dataview - Microsoft OneDrive Sync Status [Script]](<../cwa/dataviews/Microsoft OneDrive Sync Status Script.md>) from the `ProSync` plugin.

### 5.
Reload the system cache.  
![System Cache Reload](../../static/img/Microsoft-OneDrive-Sync-Status/image_1.png)

### 6.
Implement the Auditing solution as follows:
- Navigate to Automation > Monitors > Internal Monitors
  - [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](<../cwa/monitors/Execute Script - Microsoft OneDrive Sync Status.md>)  
  - Alert Template: `△ CUSTOM - Execute Script - Microsoft OneDrive Sync Status`

### 7.
Implement the Alerting solution as follows:
- Navigate to Automation > Monitors > Internal Monitors
  - [Internal Monitor - OneDrive Sync Status Issue](<../cwa/monitors/OneDrive Sync Status Issue.md>)  
  - Alert Template: `△ Custom - Ticket Creation - Computer`

## FAQ

**Q:** Why does the script occasionally throw an error and fail to retrieve data from the computer?  
**A:** The script relies on the functionality of the [Onedrive.dll](https://github.com/rodneyviana/ODSyncService) module to fetch the necessary data. However, it's important to note that the [Onedrive.dll](https://github.com/rodneyviana/ODSyncService) module is not entirely infallible, which can result in occasional errors during data retrieval. Additionally, it's crucial to ensure that no security applications are impeding the functionality of this module, as it needs to operate without restrictions to retrieve data successfully.

