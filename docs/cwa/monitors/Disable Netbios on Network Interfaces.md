---
id: '7cd56a9d-67d5-4d67-a8bf-f61497a93059'
title: 'Disable Netbios on Network Interfaces'
title_meta: 'Disable Netbios on Network Interfaces'
keywords: ['netbios', 'remote', 'monitor', 'windows', 'network']
description: 'This document provides a guide on how to implement a remote monitor that disables NetBIOS on all network interfaces for Windows operating systems. It includes details on alert styles, ticketing, and the import process.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor disables NetBIOS on all network interfaces.

## Details

**Suggested "Limit to"**: Windows OS  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

| Check Action | Server Address | Check Type | Execute Info | Comparator         | Interval | Result         |
|--------------|----------------|------------|---------------|---------------------|----------|----------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does not Contain    | 21600    | Failed to Set  |

## Target

Windows OS

## Ticketing

**Subject:** `Failed to Disable NetBIOS on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%`

**Success Body:** `NetBIOS has been disabled on all Network Interfaces`  

**Failure Body:** `Failed to Set NetBIOS on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.`

## How To Import

[Implement - Remote Monitor - Disable NetBIOS on Network Interfaces](<./Disable NetBIOS on Network Interfaces.md>)



