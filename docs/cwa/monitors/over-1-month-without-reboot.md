---
id: 'c3b60a6c-fa81-475f-8c96-6b167e32a0f9'
slug: /c3b60a6c-fa81-475f-8c96-6b167e32a0f9
title: 'Over 1 Month Without Reboot'
title_meta: 'Over 1 Month Without Reboot'
keywords: ['monitor', 'uptime', 'alert', 'system', 'machines']
description: 'This document details an internal monitor designed to track machines with a system uptime greater than 30 days and provide alerts if the machine has been online in the last 15 minutes. It is applicable for both servers and workstations managed in 24x7 and 8x5 environments.'
tags: []
draft: false
unlisted: false
---

## Summary

This internal monitor looks for machines showing a system uptime greater than 30 days (in seconds) and alerts if the machine has been online within the last 15 minutes.

## Dependencies

None

## Target

Optional Targets:
- Global - Should be run without explicitly defined targets.
- Managed 24x7 | 8x5 Servers
- Managed 24x7 | 8x5 Workstations


