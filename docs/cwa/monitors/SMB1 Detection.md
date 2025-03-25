---
id: 'de67816f-e6ff-4fed-92e1-26fd5ae5359d'
slug: /de67816f-e6ff-4fed-92e1-26fd5ae5359d
title: 'SMB1 Detection'
title_meta: 'SMB1 Detection'
keywords: ['smb1', 'monitor', 'windows', 'status', 'check']
description: 'This document outlines the procedure to check whether SMB1 is enabled on a Windows machine. It includes details on how to fetch the data using compatible commands and provides guidelines on the appropriate usage of the monitor set for Windows workstations and servers.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks whether SMB1 is enabled on the end machine. It runs the OS version [compatible command](https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server#how-to-detect-status-enable-and-disable-smb-protocols) to fetch the data.

**CAUTION:** DO NOT APPLY ANY ALERT TEMPLATE TO THIS MONITOR SET. Its only purpose is to fetch the data to be displayed in the [SMB1 Status [Remote Monitor]](<../dataviews/SMB1%20Status%20Remote%20Monitor.md>) dataview. This monitor set should not be used for alerting or ticketing purposes.

## Details

**Suggested "Limit to":** Windows Workstations and Servers  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** Default Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**    | Missing     | 86400    | _      |

## Target

Managed Windows Service Plan Groups

## How to Import

[Import - Remote Monitor - SMB1 Detection](<./Import%20-%20Remote%20Monitor%20-%20SMB1%20Detection.md>)