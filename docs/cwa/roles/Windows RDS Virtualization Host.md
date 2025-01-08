---
id: 'cwa-detect-rds-virtualization-host'
title: 'Detecting Remote Desktop Virtualization Host Feature'
title_meta: 'Detecting Remote Desktop Virtualization Host Feature'
keywords: ['remote', 'desktop', 'virtualization', 'host', 'feature']
description: 'This document provides a summary of how to detect the agents on which the Remote Desktop Virtualization Host feature is installed using PowerShell. It includes settings and detection strings relevant for Windows operating systems.'
tags: ['windows', 'detection', 'feature', 'virtualization', 'configuration']
draft: false
unlisted: false
---
## Summary

The role detects the agents on which the Remote Desktop Virtualization Host feature is installed.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `%{@powershell "(Get-WindowsFeature RDS-Virtualization).Installed"@%}` | Equals     | True   | Windows        |


