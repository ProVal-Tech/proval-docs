---
id: 'cwa-onedrive-error-monitor'
title: 'OneDrive Error Detection and Monitoring'
title_meta: 'OneDrive Error Detection and Monitoring'
keywords: ['onedrive', 'monitor', 'alert', 'sync', 'issue']
description: 'This document outlines the internal monitoring process for detecting OneDrive sync issues within a 48-hour timeframe. It details the dependencies required for the monitoring script and provides guidance on ticket creation when issues are detected, including subject and body templates for alerts.'
tags: ['alert', 'monitoring', 'ticketing', 'report', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

The internal monitor identifies machines where an issue with OneDrive sync has been detected within the last 48 hours. It triggers alerts based on data collected by the [Microsoft OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-14227796) script.  

## Dependencies

- [EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-14227796)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](https://proval.itglue.com/DOC-5078775-14241947) 
- [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) 

## Target

Global

## Ticketing

**Subject:** `OneDrive Error Detected on %Clientname%\\%computername%`

**Body:**  
`The OneDrive Audit script found an issue with %Clientname%\\%computername%.`  
`Data Collection Time: %FIELDNAME%`  
`Reported Issue:`  
`%RESULT%`  

**Example:**  
`The OneDrive Audit script found an issue with ABC Inc.\\TEST-COMPUTER`  
`Data Collection Time: 3/14/2024 1:11:45 PM`  
`Reported Issue:`  
`Sync Status for "someone" for "C:\\Users\\someone\\OneDriveCloudTemp" is "<ERROR>Status not found for type [OneDriveCloudTemp]";`  
`Sync Status for "someone" for "C:\\Users\\someone\\OneDrive - Some Inc" is "Up to date";`

## Alert Template

`△ Custom - Ticket Creation - Computer`


