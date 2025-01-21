---
id: 'e54f4273-60a6-4790-bb8e-8c0a3d2033d5'
title: 'OneDrive Sync Status Issue'
title_meta: 'OneDrive Sync Status Issue'
keywords: ['onedrive', 'monitor', 'alert', 'sync', 'issue']
description: 'This document outlines the internal monitoring process for detecting OneDrive sync issues within a 48-hour timeframe. It details the dependencies required for the monitoring script and provides guidance on ticket creation when issues are detected, including subject and body templates for alerts.'
tags: ['report', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

The internal monitor identifies machines where an issue with OneDrive sync has been detected within the last 48 hours. It triggers alerts based on data collected by the [Microsoft OneDrive Sync Status [DV]](<../scripts/Microsoft OneDrive Sync Status DV.md>) script.

## Dependencies

- [EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](<../scripts/Microsoft OneDrive Sync Status DV.md>)
- [EPM - Data Collection - Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](<./Execute Script - Microsoft OneDrive Sync Status.md>)
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Global

## Ticketing

**Subject:** `OneDrive Error Detected on %Clientname%//%computername%`

**Body:**  
`The OneDrive Audit script found an issue with %Clientname%//%computername%.`  
`Data Collection Time: %FIELDNAME%`  
`Reported Issue:`  
`%RESULT%`  

**Example:**  
`The OneDrive Audit script found an issue with ABC Inc.//TEST-COMPUTER`  
`Data Collection Time: 3/14/2024 1:11:45 PM`  
`Reported Issue:`  
`Sync Status for "someone" for "C://Users//someone//OneDriveCloudTemp" is "<ERROR>Status not found for type [OneDriveCloudTemp]";`  
`Sync Status for "someone" for "C://Users//someone//OneDrive - Some Inc" is "Up to date";`

## Alert Template

`△ Custom - Ticket Creation - Computer`



