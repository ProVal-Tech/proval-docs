---
id: 'cwa-enhanced-drive-space-monitor'
title: 'Enhanced Drive Space Monitor Configuration'
title_meta: 'Enhanced Drive Space Monitor Configuration for Ticket Management'
keywords: ['monitor', 'drive', 'space', 'tickets', 'configuration', 'alert']
description: 'This document outlines the configuration process for the Enhanced Drive Space Monitor, which identifies machines with unresolved low drive space issues and generates tickets accordingly. It details dependencies, configuration steps, and important cautions to ensure effective monitoring.'
tags: ['disk', 'monitoring', 'tickets', 'configuration', 'alert']
draft: false
unlisted: false
---
## Summary

This monitor replicates the functionality of the Internal Monitor: 'Enhanced Drive Space Monitor'. Its primary purpose is to identify machines for which tickets have been closed prematurely, without effectively resolving the space issue on the respective machine. The monitor scans will output all of the machines that still have the low drive space issue, but no ticket has been generated for it. The monitor is designed to run daily to re-create those problem tickets.

Note: The monitor will not detect machines in maintenance mode.

## Dependencies

- [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151)
- [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106)

## How to Configure

This monitor has to be configured the same as the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106) with the same alert template. It will use the same group and computer-level EDF's.

Just need to import this monitor and set the alert template which has been used by the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106).

## Caution

Just make sure [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151) should have been using the same name as the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106) at line 54. Otherwise, both monitors will not be able to detect the tickets.

![Image](5078775/docs/14608610/images/21122686)

