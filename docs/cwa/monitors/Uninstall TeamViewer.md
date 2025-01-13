---
id: 'cwa-remove-teamviewer-windows'
title: 'Remote Monitor for TeamViewer Removal on Windows'
title_meta: 'Remote Monitor for TeamViewer Removal on Windows'
keywords: ['remote', 'monitor', 'teamviewer', 'removal', 'windows']
description: 'This document outlines the procedure for setting up a remote monitor to automate the removal of TeamViewer from Windows machines. It includes details on suggested configurations, ticketing information, and import instructions for the monitor.'
tags: ['windows', 'monitoring', 'ticketing', 'uninstallation', 'software']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to remove the `TeamViewer` from the Windows machines.

## Details

**Suggested "Limit to"**: windows OS  
**Suggested Alert Style**: once  
**Suggested Alert Template**: △ Custom - Ticket Creation Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator    | Interval | Result |
|--------------|----------------|------------|---------------|----------------|----------|--------|
| System       | 127.0.0.1      | Run File   | **REDACTED**  | State Based    | 3600     | ![Result](..\..\..\static\img\Uninstall-TeamViewer\image_1.png) |

## Target

Windows OS

## Ticketing

**Subject**: -  
`TeamViewer Removal Failed on %CLIENTNAME%\%COMPUTERNAME%`  

**Ticket Body**: -  
`Failed to remove TeamViewer on %CLIENTNAME%\%COMPUTERNAME%`

## How To Import

[Implement - Remote Monitor - Uninstall TeamViewer](https://proval.itglue.com/DOC-5078775-14007937)



