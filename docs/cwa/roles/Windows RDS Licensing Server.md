---
id: '96b26cf7-01fe-4f69-bb2f-359af6f46933'
title: 'RDS Licensing Feature Enabled Servers'
title_meta: 'RDS Licensing Feature Enabled Servers'
keywords: ['rds', 'licensing', 'servers', 'windows']
description: 'This document provides a role definition that identifies which servers have the RDS Licensing feature enabled, including the relevant detection string and settings for Windows operating systems.'
tags: ['report', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition shows which servers have the RDS Licensing feature enabled.

## Settings

| Detection String                                  | Comparator | Result | Applicable OS |
|--------------------------------------------------|------------|--------|----------------|
| \{%@powershell "(Get-WindowsFeature RDS-Licensing).Installed"@%} | Equals     | True   | Windows        |


