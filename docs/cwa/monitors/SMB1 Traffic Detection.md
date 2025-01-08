---
id: 'cwa-smb1-server-auditing'
title: 'SMB1 Server Auditing Remote Monitor'
title_meta: 'SMB1 Server Auditing Remote Monitor'
keywords: ['smb1', 'monitor', 'server', 'auditing', 'event', 'logs']
description: 'This document outlines the SMB1 Server Auditing Remote Monitor, which activates auditing for SMB1 connections and reviews event logs for client connection attempts. It serves to identify environments still using the SMB1 protocol before disabling it.'
tags: ['monitoring', 'event', 'logging', 'security', 'networking']
draft: false
unlisted: false
---
## Summary

The remote monitor activates SMB1 Server Auditing if not already enabled to generate event logs when any computer attempts to connect using the SMB1 protocol. Subsequently, it reviews the event logs to identify any instances of client connection attempts using the SMB1 protocol within the last hour.

This monitoring mechanism serves to identify servers or environments where the SMB1 protocol is still in use before any protocol disabling procedures are implemented.

**Note:** The ticket created by the monitor set will not be automatically closed.

## Details

**Suggested "Limit to":** Search: SMB1 Server Enabled [Remote Monitor]  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** `△ Custom - Ticket Creation Computer - Failures Only`

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | State Based | 3600     | ![Result](5078775/docs/14460386/images/20903558) |

## Dependencies

- [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]](https://proval.itglue.com/DOC-5078775-13459854)
- [EPM - Windows Configuration - Remote Monitor - SMB1 Detection](https://proval.itglue.com/DOC-5078775-13177312)

## Target

SMB1 Server Enabled [Remote Monitor]

## Ticketing

**Subject:**  `SMB1 Traffic Detected on %COMPUTERNAME%`

**Body:**  
`SMB1 Traffic detected on %CLIENTNAME%\%COMPUTERNAME% in the past 1 hour.  
Details: `  
`%RESULT%`

## Implementation

[Implement - Remote Monitor - SMB1 Traffic Detection](https://proval.itglue.com/DOC-5078775-14461257)


