---
id: '18432358-9550-4ab9-959e-255196b0ebcf'
slug: /18432358-9550-4ab9-959e-255196b0ebcf
title: 'Active Directory - Sync Out of Date'
title_meta: 'Active Directory - Sync Out of Date'
keywords: ['active-directory', 'monitor', 'credential', 'sync', 'ticket']
description: 'This document outlines a monitor that detects Active Directory servers onboarded for over 30 days experiencing credential issues. It utilizes API integration with CW Control to auto-resolve syncing problems and creates tickets if resolution fails.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

This monitor looks for Active Directory (AD) servers that have been onboarded for more than 30 days and are experiencing credential issues in the Active Directory Plugin. It will auto-resolve any issues with the plugin syncing using the API integration with CW Control and create a ticket if it fails to fix the problem.

## Dependencies

This monitor is dependent on the following items:

- [CWM - Automate - Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]](/docs/6c9ef438-835d-44a9-bf31-4a1db9253347)  
- [CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)  

## Target

The monitor set is explicitly limited to the domain controllers detected in the Active Directory plugin.