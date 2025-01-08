---
id: 'cwa-monitor-missing-patches'
title: 'Monitor for Missing Patches in CW Automate'
title_meta: 'Monitor for Missing Patches in CW Automate'
keywords: ['monitor', 'patches', 'cw', 'automate', 'windows']
description: 'This document outlines a monitor designed to identify Windows machines managed by ConnectWise Automate that are missing five or more patches which are at least 21 days old. It includes details on dependencies, configuration, and scheduling to minimize noise during patch approval processes.'
tags: ['monitoring', 'patching', 'windows', 'configuration', 'report']
draft: false
unlisted: false
---
## Summary

This monitor will look for any machines (Excluding EOL) that are patching via CW Automate and are missing 5 or more patches which are at least 21 days older.

This monitor is designed to work with the '~Custom - Ticket Creation - Computer' Alert Template ([CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)).

NOTE: The number of missing patches is adjustable to any threshold required. This monitor may become very noisy during patch approval & denial so you can schedule it to run around the patching schedule.

## Dependencies

CW Automate must have the "new" patch manager enabled. This data uses the ComputerPatchComplianceStats table, which is a calculated metrics table. This process typically runs one time per day, so the data may need to be updated before the monitor will display accurate information.

To force update this table, please follow this guide: [CW Automate - Force Update Patch Reporting Statistics](https://proval.itglue.com/DOC-5078775-8038412).

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)

## Target

Windows Machines - Should be run on all Windows machines that patch via CW Automate.

