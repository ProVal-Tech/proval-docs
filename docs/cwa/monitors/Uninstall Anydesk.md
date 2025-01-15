---
id: '34d2f7ec-4b5d-43d3-b109-4af2bb24d6be'
title: 'Remote Monitor for Anydesk Removal on Windows'
title_meta: 'Remote Monitor for Anydesk Removal on Windows'
keywords: ['remote', 'monitor', 'anydesk', 'removal', 'windows']
description: 'This document outlines the setup for a remote monitor designed to uninstall Anydesk from Windows machines. It includes details on suggested configurations, alert styles, and ticketing information for effective monitoring and issue resolution.'
tags: ['windows', 'uninstallation', 'monitoring', 'ticketing', 'software']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to remove the `Anydesk` from the Windows machines.

## Details

**Suggested "Limit to"**: windows OS  
**Suggested Alert Style**: once  
**Suggested Alert Template**: △ Custom - Ticket Creation Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator    | Interval | Result |
|--------------|----------------|-------------|---------------|----------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | State Based     | 3600     | ![Image](../../../static/img/Uninstall-Anydesk/image_1.png) |

## Target

Windows OS

## Ticketing

**Subject**: - `Anydesk Removal Failed on %CLIENTNAME%/%COMPUTERNAME%`  

**Ticket Body**: - `Failed to remove Anydesk on %CLIENTNAME%/%COMPUTERNAME%`

## How To Import

[Implement - Remote Monitor - Uninstall Anydesk](https://proval.itglue.com/DOC-5078775-14007940)







