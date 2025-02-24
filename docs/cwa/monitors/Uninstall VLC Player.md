---
id: '5e887154-c307-4ac7-9b75-0a85c516dbad'
title: 'Uninstall VLC Player'
title_meta: 'Uninstall VLC Player'
keywords: ['remote', 'monitor', 'vlc', 'uninstallation', 'windows', 'workstations']
description: 'This document outlines the setup for a remote monitor designed to uninstall VLC Media Player from Windows workstations, including configuration details, ticketing information, and import instructions.'
tags: ['software', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to remove the `VLC Media Player` from Windows machines.

## Details

**Suggested "Limit to"**: Windows Workstations  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info    | Comparator       | Interval | Result                 |
|--------------|----------------|------------|------------------|-------------------|----------|------------------------|
| System       | 127.0.0.1     | Run File   | _**REDACTED**_   | Does Not Contain   | 604800   | Failed to remove VLC    |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Windows Workstations

## Ticketing

**Subject:** `VLC Removal Failed - %COMPUTERNAME%`  

**Body:** `Failed to remove VLC Player for %COMPUTERNAME%. Please review.`  

## How to Import

[Import - Remote Monitor - Uninstall VLC Player](<./Import%20-%20Remote%20Monitor%20-%20Uninstall%20VLC%20Player.md>)
 