---
id: '7fc4ec09-7e32-4fb7-8f5e-6db2c32567dc'
title: 'Windows RDS Virtualization Host'
title_meta: 'Windows RDS Virtualization Host'
keywords: ['remote', 'desktop', 'virtualization', 'host', 'feature']
description: 'This document provides a summary of how to detect the agents on which the Remote Desktop Virtualization Host feature is installed using PowerShell. It includes settings and detection strings relevant for Windows operating systems.'
tags: ['virtualization', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to detect the agents on which the Remote Desktop Virtualization Host feature is installed.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `%{@powershell "(Get-WindowsFeature RDS-Virtualization).Installed"@%}` | Equals     | True   | Windows        |



