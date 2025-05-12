---
id: '8437ea68-5f49-4e76-ba19-52001cd178ef'
slug: /8437ea68-5f49-4e76-ba19-52001cd178ef
title: 'OneDrive Sync Failures'
title_meta: 'OneDrive Sync Failures'
keywords: ['onedrive', 'sync', 'monitor', 'alert', 'issue']
description: 'This document details the OneDrive Sync Monitor, which identifies machines with sync issues detected in the last 48 hours and triggers alerts. It relies on specific data collection scripts and custom tables to provide timely notifications for IT support teams.'
tags: ['data-collection']
draft: false
unlisted: false
---

## Summary

The internal monitor identifies machines where an issue with OneDrive sync has been detected within the last 48 hours. It triggers alerts based on data collected by the [Get OneDrive Sync Status [DV]](/docs/ed03ad47-d4f8-4917-8ecc-0505b6172ece) script.

## Dependencies

- [EPM - Data Collection - Script - Get OneDrive Sync Status [DV]](/docs/ed03ad47-d4f8-4917-8ecc-0505b6172ece)
- [EPM - Data Collection - Custom Table - pvl_odsync_status](/docs/e7a826db-104c-4ebb-877f-b44e138067f9)

## Target

Global

## Ticketing

**Subject:** `OneDrive Sync Failure Detected on %computername%`

**Body:**

```
The OneDrive Audit script found an issue with %Clientname%/%computername%.
```

```
Data Collection Time: %RESULT%
```

```
Reported Issue: 
```

```
%FIELDNAME%
```

**Example:**

```
The OneDrive Audit script found an issue with ABC Inc./TEST-COMPUTER
```

```
Data Collection Time: 7/6/2024 1:11:45 PM
```

```
Reported Issue: 
```

```
UserName: AzAD/User1
Folder Path: C:/Users/User1/OneDrive - Investigations
Sync Status: Error
```

```
UserName: AzAD/User2
Folder Path: C:/Users/User2/OneDrive - Investigations
Sync Status: Error
```

## Alert Template

```
△ Custom - Ticket Creation - Computer
```