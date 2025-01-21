---
id: 'abddfc3a-9f1b-4356-a62c-3475cdb32c96'
title: 'Backup Exec - No successful backups in 3 days'
title_meta: 'Backup Exec - No successful backups in 3 days'
keywords: ['backup', 'exec', 'alert', 'monitoring', 'ticketing']
description: 'This document outlines the procedure to verify the occurrence of event ID 34112 within the last three days to ensure successful backup operations on machines with Symantec Backup Exec installed. It includes suggested alert styles, ticketing information, and import instructions for remote monitoring.'
tags: ['backup', 'ticketing']
draft: false
unlisted: false
---

## Summary

This document verifies the occurrence of event ID 34112 within the preceding three-day period to ascertain the execution of a successful backup operation on the respective machine.

## Details

**Suggested "Limit to"**: Computers with the `Symantec Backup Exec` application installed and configured  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: `Default - Create Automate Ticket` or `△ Custom - Ticket Creation Computer`  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator        | Interval | Result     |
|--------------|----------------|------------|---------------|--------------------|----------|------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does Not Contain    | 3600     | Problematic |

## Target

Backup Management > Backup Exec  

![Image](../../../static/img/Backup-Exec---No-successful-backups-in-3-days/image_1.png)  

**Auto Join Search for the group:** Backup - Backup Exec  
![Image](../../../static/img/Backup-Exec---No-successful-backups-in-3-days/image_2.png)  

## Ticketing

**Subject:** Backup Exec - No successful backups in 3 days - \<ComputerName\>  

**Body:** A successful backup job is not detected on \<ComputerName\> in 3 days. Please investigate.

## How to Import

[Import - Remote Monitor - Backup Exec - No successful backups in 3 days](<./Backup Exec - No successful backups in 3 days.md>)  



