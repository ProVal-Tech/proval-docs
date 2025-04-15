---
id: '021f4d58-3458-4536-96e7-b618960a1e0b'
slug: /021f4d58-3458-4536-96e7-b618960a1e0b
title: 'Time Sync Compliance'
title_meta: 'Time Sync Compliance'
keywords: ['windows', 'monitor', 'sync', 'time', 'compliance']
description: 'This document outlines the setup and details for a remote monitor designed to ensure that Windows workstations synchronize their time with the NTP server us.pool.ntp.org. It includes configuration details, alert settings, and ticketing information for compliance failures.'
tags: ['compliance', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to synchronize the time of Windows workstations with `us.pool.ntp.org`.

## Details

**Suggested "Limit to"**: Windows Workstations  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator           | Interval | Result                                          |
| ------------ | -------------- | ---------- | ------------ | -------------------- | -------- | ----------------------------------------------- |
| System       | 127.0.0.1      | Run File   | **REDACTED** | Does Not Regex Match | 86400    | (The Computer did not resync) (Failed to start) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)

## Target

**Windows Workstations**

## Ticketing

**Subject:** `Time Sync Compliance Failed - %ComputerName%`  

**Body:**  
`Time Sync Compliance failed for %ComputerName%`  
`Reason: %RESULT%`

## How to Import

[Import - Remote Monitor - Time Sync Compliance](/docs/d0b9c0fa-fe52-412b-a4b9-dee96f9ff58b)
