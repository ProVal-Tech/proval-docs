---
id: 'c02b447f-36ba-4a88-b40f-a47cf08fb690'
slug: /c02b447f-36ba-4a88-b40f-a47cf08fb690
title: 'Active Directory Replication Anomaly Monitoring'
title_meta: 'Active Directory Replication Anomaly Monitoring'
keywords: ['active', 'directory', 'replication', 'monitoring', 'alert']
description: 'This document details the setup for monitoring Active Directory Replication Failures on Primary Domain Controllers, including alert configurations and ticketing information for incidents detected within the domain.'
tags: ['active-directory', 'ticketing']
draft: false
unlisted: false
---

## Summary

The monitor set operates on a cluster of Primary Domain Controllers (Infrastructure Masters) for each domain, triggering a failure alert upon detecting any Active Directory Replication Failure.

**Note:** The monitor set is incompatible with servers running PowerShell versions older than 4.0.

## Details

**Suggested "Limit to":** `Server Role - AD - Infrastructure Master`  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** `△ Custom - Ticket Creation Computer - Failures Only`

Insert the details of the monitor in the table below.

| Check Action | Server Address | Execute Info | Check Value | Condition     | Interval | Result |
|--------------|----------------|---------------|-------------|---------------|----------|--------|
| System       | 127.0.0.1     | Run File      | **REDACTED**| State Based    | 3600     | ![Result](../../../static/img/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690/image_1.png) |

## Target

**Group:** Domain Controllers  
![Group Image](../../../static/img/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690/image_2.png)  

**Search:** Server Role - AD - Infrastructure Master  
![Search Image](../../../static/img/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690/image_3.png)  

## Ticketing

**Subject:** `AD Replication Failure - %DOMAIN%`

**Body:**  
```
AD Replication Failure(s) have been identified for the domain '%DOMAIN%' within the previous hour. The details are provided below:
%RESULT%
For a precise understanding of the error codes returned in the `LastError` property, please consult the following article: [Common Active Directory Replication Errors](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/common-active-directory-replication-errors)
```

## Implementation

[Implement - Remote Monitor - Active Directory Replication Anomaly Monitoring](/docs/495df667-0690-48e0-b929-f7671e9fc92c) 