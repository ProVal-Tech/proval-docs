---
id: 'cwa-detect-windows-rds-web-access-server'
title: 'Detect Windows RDS Web Access Server'
title_meta: 'Detect Windows RDS Web Access Server'
keywords: ['detection', 'rds', 'web', 'access', 'server', 'windows']
description: 'This document provides a method to detect the Windows RDS Web Access Server using a specific detection string and settings. It includes the necessary comparator and result for identifying the installed feature on Windows operating systems.'
tags: ['detection', 'windows', 'server', 'configuration']
draft: false
unlisted: false
---
## Summary

This role will detect the Windows RDS Web Access Server.

## Settings

| Detection String                                   | Comparator | Result | Applicable OS |
|----------------------------------------------------|------------|--------|----------------|
| {%@powershell "(Get-WindowsFeature RDS-Web-Access).Installed"@%} | Equals     | True   | Windows        |


