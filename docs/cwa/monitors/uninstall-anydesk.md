---
id: '34d2f7ec-4b5d-43d3-b109-4af2bb24d6be'
slug: /34d2f7ec-4b5d-43d3-b109-4af2bb24d6be
title: 'Uninstall Anydesk'
title_meta: 'Uninstall Anydesk'
keywords: ['remote', 'monitor', 'anydesk', 'removal', 'windows']
description: 'This document outlines the setup for a remote monitor designed to uninstall Anydesk from Windows machines. It includes details on suggested configurations, alert styles, and ticketing information for effective monitoring and issue resolution.'
tags: ['software', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to remove `Anydesk` from Windows machines.

## Details

**Suggested "Limit to"**: Windows OS  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation Computer  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator  | Interval | Result                                                      |
| ------------ | -------------- | ---------- | ------------ | ----------- | -------- | ----------------------------------------------------------- |
| System       | 127.0.0.1      | Run File   | **REDACTED** | State Based | 3600     | ![Image](../../../static/img/docs/34d2f7ec-4b5d-43d3-b109-4af2bb24d6be/image_1.png) |

## Target

Windows OS

## Ticketing

**Subject**: `Anydesk Removal Failed on %CLIENTNAME%/%COMPUTERNAME%`  

**Ticket Body**: `Failed to remove Anydesk on %CLIENTNAME%/%COMPUTERNAME%`

## How To Import

[Implement - Remote Monitor - Uninstall Anydesk](/docs/8b658a17-cb91-457a-9efc-4b8f676b0fb0)