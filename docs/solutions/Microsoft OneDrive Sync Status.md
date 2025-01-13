---
id: 'cwa-onedrive-sync-status'
title: 'OneDrive Sync Status Monitoring for Non-SharePoint Linked Sites'
title_meta: 'OneDrive Sync Status Monitoring for Non-SharePoint Linked Sites'
keywords: ['onedrive', 'sync', 'monitoring', 'automation', 'alerting', 'auditing']
description: 'This document outlines the implementation of a solution to collect and display OneDrive sync status information from Windows machines, specifically for Non-SharePoint Linked Sites. It includes associated content for auditing and alerting, as well as a detailed implementation guide and FAQs regarding potential errors in data retrieval.'
tags: ['monitoring', 'alerting', 'auditing', 'windows', 'script', 'internal-monitor', 'ticketing']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to collect and display the OneDrive sync status information from Windows machines exclusively for Non-SharePoint Linked Sites.

## Associated Content

#### Auditing

| Content                                                                 | Type           | Function                                                   |
|-------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| [Script - Microsoft OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-14227796) | Script         | Fetch the data.                                           |
| [Dataview - Microsoft OneDrive Sync Status [Script]](https://proval.itglue.com/DOC-5078775-14227800) | Dataview       | Display the data.                                         |
| [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](https://proval.itglue.com/DOC-5078775-14241947) | Internal Monitor | Detect the relevant computers to execute the script.     |
| △ CUSTOM - Execute Script - Microsoft OneDrive Sync Status              | Alert Template | Executes the script against the computers detected by the Internal Monitor. |

#### Alerting

| Content                                                                 | Type           | Function                                                   |
|-------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| [Internal Monitor - OneDrive Sync Status Issue](https://proval.itglue.com/DOC-5078775-15373743) | Internal Monitor | Detects the problematic machines.                          |
| [Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) | Autofix Script | Manages ticketing.                                        |
| △ Custom - Ticket Creation - Computer                                     | Alert Template | Executes the script against the computers detected by the Internal Monitor. |

## Implementation

### 1.
Import/Update the following scripts from the `ProSync` plugin:
- [Script - Microsoft OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-14227796)  
- [Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)  

### 2.
Import/Update the following internal monitors from the `ProSync` plugin:
- [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](https://proval.itglue.com/DOC-5078775-14241947)  
- [Internal Monitor - OneDrive Sync Status Issue](https://proval.itglue.com/DOC-5078775-15373743)  

### 3.
Import/Update the following alert templates from the `ProSync` plugin:
- △ CUSTOM - Execute Script - Microsoft OneDrive Sync Status  
- △ Custom - Ticket Creation - Computer  

### 4.
Import the [Dataview - Microsoft OneDrive Sync Status [Script]](https://proval.itglue.com/DOC-5078775-14227800) from the `ProSync` plugin.

### 5.
Reload the system cache.  
![System Cache Reload](..\..\static\img\Microsoft-OneDrive-Sync-Status\image_1.png)

### 6.
Implement the Auditing solution as follows:
- Navigate to Automation > Monitors > Internal Monitors
  - [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](https://proval.itglue.com/DOC-5078775-14241947)  
  - Alert Template: `△ CUSTOM - Execute Script - Microsoft OneDrive Sync Status`

### 7.
Implement the Alerting solution as follows:
- Navigate to Automation > Monitors > Internal Monitors
  - [Internal Monitor - OneDrive Sync Status Issue](https://proval.itglue.com/DOC-5078775-15373743)  
  - Alert Template: `△ Custom - Ticket Creation - Computer`

## FAQ

**Q:** Why does the script occasionally throw an error and fail to retrieve data from the computer?  
**A:** The script relies on the functionality of the [Onedrive.dll](https://github.com/rodneyviana/ODSyncService) module to fetch the necessary data. However, it's important to note that the [Onedrive.dll](https://github.com/rodneyviana/ODSyncService) module is not entirely infallible, which can result in occasional errors during data retrieval. Additionally, it's crucial to ensure that no security application is impeding the functionality of this module, as it needs to operate without restrictions to retrieve data successfully.


