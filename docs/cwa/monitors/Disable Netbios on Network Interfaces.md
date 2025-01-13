---
id: 'cwa-disable-netbios-remote-monitor'
title: 'Disable NetBIOS on All Network Interfaces'
title_meta: 'Disable NetBIOS on All Network Interfaces'
keywords: ['netbios', 'remote', 'monitor', 'windows', 'network']
description: 'This document provides a guide on how to implement a remote monitor that disables NetBIOS on all network interfaces for Windows operating systems. It includes details on alert styles, ticketing, and the import process.'
tags: ['networking', 'windows', 'configuration', 'alert', 'monitor']
draft: false
unlisted: false
---
## Summary

This remote monitor disables netbios on all network interfaces

## Details

**Suggested "Limit to"**: windows OS  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

| Check Action | Server Address | Check Type | Execute Info | Comparator         | Interval | Result         |
|--------------|----------------|------------|---------------|---------------------|----------|----------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does not Contain    | 21600    | Failed to Set  |

## Target

Windows OS

## Ticketing

**Subject:** `Failed to Disable NetBios on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%`

**Success Body**: `Netbios has been disabled on all Network Interfaces`  

**Failure Body:** `Failed to Set Netbios on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.`

## How To Import

[Implement - Remote Monitor - Disable Netbios on Network Interfaces](https://proval.itglue.com/DOC-5078775-13837769)


