---
id: '863ba816-8f4f-47e1-aa66-420b428b7188'
title: 'Internet Speed Audit Monitor'
title_meta: 'Internet Speed Audit Monitor'
keywords: ['monitor', 'internet', 'speed', 'audit', 'windows']
description: 'This document provides details about an internal monitor that detects Windows agents where the Internet Speed Audit script has not been run in the last 10 days. It outlines important considerations, dependencies, and target groups for implementation.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---
## Summary

This internal monitor detects the Windows agent where the script [EPM - Network - Script - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226) has not been run in the last 10 days. It will only detect the machines where the Powershell version is greater than 05.

**Important**
- The monitor target should be applied to a group, otherwise, it will not function.
- Import the [Dynamic PowerShell Role](<../roles/Dynamic PowerShell Role.md>) in the client environment.

## Dependencies

- [EPM - Network - Script - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226)
- [EPM - Network - Custom Table - plugin_proval_speedtest_audit](<../tables/plugin_proval_speedtest_audit.md>)
- [Dynamic PowerShell Role](<../roles/Dynamic PowerShell Role.md>)

## Target

This monitor can be enabled for all service plan groups, Servers only, Infrastructure master servers only, or any custom grouping of machines controlled by EDFs. This solution is built for only Windows.














