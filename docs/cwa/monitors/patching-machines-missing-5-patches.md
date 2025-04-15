---
id: '127ea64b-5538-4fd4-92fb-143ff6ce1216'
slug: /127ea64b-5538-4fd4-92fb-143ff6ce1216
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

This monitor is designed to work with the '~Custom - Ticket Creation - Computer' Alert Template ([CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)).

**NOTE:** The number of missing patches is adjustable to any threshold required. This monitor may become very noisy during patch approval and denial, so you can schedule it to run around the patching schedule.

## Dependencies

CW Automate must have the "new" patch manager enabled. This data uses the ComputerPatchComplianceStats table, which is a calculated metrics table. This process typically runs once per day, so the data may need to be updated before the monitor will display accurate information.

To force update this table:
1. From the Control Center window, click on "Help" and then "Server Status". This will open up the server status menu. In the server status menu, there are several available buttons along the bottom of the window.

![image](/img/127ea64b-5538-4fd4-92fb-143ff6ce1216/image.png)

2. Click the option for "Do Patch Report Calculations" - this command will tell Automate to run the stored procedure to update the patching metrics. This process may take a few minutes to update the required tables.

![image](/img/127ea64b-5538-4fd4-92fb-143ff6ce1216/image2.png)

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Target

Windows Machines - This monitor should be run on all Windows machines that patch via CW Automate.


