---
id: 'a7bcd631-f96c-4443-ae87-e7739407e283'
slug: /a7bcd631-f96c-4443-ae87-e7739407e283
title: 'ShadowCopy Creation Failure Detection'
title_meta: 'ShadowCopy Creation Failure Detection'
keywords: ['monitor', 'event', 'log', 'check', 'windows', 'server', 'workstation']
description: 'This document describes a remote monitor that queries the event log to determine if event ID 12298 has occurred within the last 12 hours, returning the count of occurrences. It includes details on suggested limits, alert styles, and target environments for optimal monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This is a remote monitor that determines, by querying the event log, if event ID 12298 has occurred within the last 12 hours and returns the count.

## Details

**Suggested "Limit to"**: Windows Server, Workstations (Optional).  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **See Below**  | Equals     | 43200    | 0      |

**Check Value:**
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "(Get-EventLog -LogName Application | Where-Object {$_.TimeGenerated -gt (Get-Date).AddHours(-13) -and $_.EventID -eq '12298'}).count"
```

## Dependencies

None.

## Target

The suggested target for the monitor is Service Plan(s) for Servers and Workstations.

**Examples**:  
- **Windows Servers**: Should be run on all Windows-based servers.  
- **Windows Workstations**: Should be run on all Windows workstations (Optional).