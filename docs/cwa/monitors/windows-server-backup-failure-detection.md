---
id: 'ef03b1ec-11f8-438e-a21e-b4a2bdcd4c78'
slug: /ef03b1ec-11f8-438e-a21e-b4a2bdcd4c78
title: 'Windows Server Backup Failure Detection'
title_meta: 'Windows Server Backup Failure Detection'
keywords: ['backup', 'monitor', 'windows', 'server', 'ticket']
description: 'This document outlines a remote monitoring solution that detects the last backup status of Windows Server Backup. It raises a ticket if the backup fails, ensuring prompt attention to backup issues.'
tags: ['backup', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor detects the last backup status of the Windows Server Backup.  
If the backup fails, it will raise a ticket.

## Details

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|-------------|----------|------|
| System       | 127.0.0.1     | Run File   | **See Below**  | Equals | 3600     | 0 |

**Execute Info:**
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "Get-WBSummary | select-object -ExpandProperty LastBackupResultHR"
```

## Dependencies

[Windows Server Backup](/docs/5cd09bd8-bf3c-431a-8ee6-e56bff349e50)

## Target

It should be targeted on the group that is bound with a search via the role "Windows Server Backup."