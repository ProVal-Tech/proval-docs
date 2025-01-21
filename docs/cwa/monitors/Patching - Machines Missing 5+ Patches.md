---
id: '127ea64b-5538-4fd4-92fb-143ff6ce1216'
title: 'Patching - Machines Missing 5+ Patches'
title_meta: 'Patching - Machines Missing 5+ Patches'
keywords: ['monitor', 'patches', 'cw', 'automate', 'windows']
description: 'This document outlines a monitor designed to identify Windows machines managed by ConnectWise Automate that are missing five or more patches which are at least 21 days old. It includes details on dependencies, configuration, and scheduling to minimize noise during patch approval processes.'
tags: ['patching', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will look for any machines (excluding EOL) that are patching via CW Automate and are missing five or more patches that are at least 21 days old.

This monitor is designed to work with the '~Custom - Ticket Creation - Computer' Alert Template ([CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)).

**NOTE:** The number of missing patches is adjustable to any threshold required. This monitor may become very noisy during patch approval and denial, so you can schedule it to run around the patching schedule.

## Dependencies

CW Automate must have the "new" patch manager enabled. This data uses the ComputerPatchComplianceStats table, which is a calculated metrics table. This process typically runs once per day, so the data may need to be updated before the monitor will display accurate information.

To force update this table, please follow this guide: [CW Automate - Force Update Patch Reporting Statistics](https://proval.itglue.com/DOC-5078775-8038412).

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Target

Windows Machines - This monitor should be run on all Windows machines that patch via CW Automate.



