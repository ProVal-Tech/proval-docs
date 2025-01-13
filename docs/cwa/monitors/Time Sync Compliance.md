---
id: 'cwa-remote-monitor-time-sync-compliance'
title: 'Remote Monitor: Time Sync Compliance'
title_meta: 'Remote Monitor: Time Sync Compliance'
keywords: ['windows', 'monitor', 'sync', 'time', 'compliance']
description: 'This document outlines the setup and details for a remote monitor designed to ensure that Windows workstations synchronize their time with the NTP server us.pool.ntp.org. It includes configuration details, alert settings, and ticketing information for compliance failures.'
tags: ['monitor', 'time', 'compliance', 'windows', 'alert', 'ticketing']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to set the sync of the Windows workstation time with `us.pool.ntp.org`.

## Details

**Suggested "Limit to"**: Windows Workstations  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info          | Comparator              | Interval | Result                                |
|--------------|----------------|------------|-----------------------|-------------------------|----------|---------------------------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**          | Does Not Regex Match    | 86400    | (The Computer did not resync)|(Failed to start) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)

## Target

**Windows Workstations**

## Ticketing

**Subject:** `Time Sync Compliance Failed - %ComputerName%`  

**Body:**  
`Time Sync Compliance failed for %ComputerName%.`  
`Reason:  %RESULT%`

## How to Import

[Import - Remote Monitor - Time Sync Compliance](https://proval.itglue.com/DOC-5078775-13498164)



