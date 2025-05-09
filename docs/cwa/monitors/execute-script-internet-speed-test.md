---
id: '863ba816-8f4f-47e1-aa66-420b428b7188'
slug: /863ba816-8f4f-47e1-aa66-420b428b7188
title: 'Execute Script - Internet Speed Test'
title_meta: 'Execute Script - Internet Speed Test'
keywords: ['monitor', 'internet', 'speed', 'audit', 'windows']
description: 'This document provides details about an internal monitor that detects Windows agents where the Internet Speed Audit script has not been run in the last 10 days. It outlines important considerations, dependencies, and target groups for implementation.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor detects Windows agents where the script [EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6) has not been run in the last 10 days. It will only detect machines where the PowerShell version is greater than 5.

**Important**
- The monitor target should be applied to a group; otherwise, it will not function.
- Import the [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81) in the client environment.

## Dependencies

- [EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6)
- [EPM - Network - Custom Table - plugin_proval_speedtest_audit](/docs/38fbe617-1c50-443b-b69b-07eae7135652)
- [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81)

## Target

This monitor can be enabled for all service plan groups, servers only, infrastructure master servers only, or any custom grouping of machines controlled by EDFs. This solution is designed exclusively for Windows.