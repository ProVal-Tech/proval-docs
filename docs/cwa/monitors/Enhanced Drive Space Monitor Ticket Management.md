---
id: '4535820b-8254-4b20-bb7c-f68b2f05494e'
slug: /4535820b-8254-4b20-bb7c-f68b2f05494e
title: 'Enhanced Drive Space Monitor Ticket Management'
title_meta: 'Enhanced Drive Space Monitor Ticket Management'
keywords: ['monitor', 'drive', 'space', 'tickets', 'configuration', 'alert']
description: 'This document outlines the configuration process for the Enhanced Drive Space Monitor, which identifies machines with unresolved low drive space issues and generates tickets accordingly. It details dependencies, configuration steps, and important cautions to ensure effective monitoring.'
tags: ['disk']
draft: false
unlisted: false
---

## Summary

This monitor replicates the functionality of the Internal Monitor: 'Enhanced Drive Space Monitor'. Its primary purpose is to identify machines for which tickets have been closed prematurely without effectively resolving the space issue on the respective machine. The monitor scans will output all of the machines that still have the low drive space issue, but for which no ticket has been generated. The monitor is designed to run daily to recreate those problem tickets.

**Note:** The monitor will not detect machines in maintenance mode.

## Dependencies

- [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](<../scripts/Enhanced Disk Space Monitoring Process.md>)
- [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](<./Agent - Enhanced Drive Space Monitor.md>)

## How to Configure

This monitor must be configured the same as the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](<./Agent - Enhanced Drive Space Monitor.md>) with the same alert template. It will use the same group and computer-level EDFs.

Simply import this monitor and set the alert template that has been used by the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](<./Agent - Enhanced Drive Space Monitor.md>).

## Caution

Ensure that the [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](<../scripts/Enhanced Disk Space Monitoring Process.md>) uses the same name as the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](<./Agent - Enhanced Drive Space Monitor.md>) at line 54. Otherwise, both monitors will not be able to detect the tickets.

![Image](../../../static/img/Enhanced-Drive-Space-Monitor-Ticket-Management/image_1.png)


