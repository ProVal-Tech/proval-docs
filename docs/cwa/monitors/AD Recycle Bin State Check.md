---
id: '5041d497-ae6c-4209-a338-60f1da396106'
title: 'AD Recycle Bin State Check'
title_meta: 'AD Recycle Bin State Check'
keywords: ['active-directory', 'monitor', 'recycle-bin', 'windows', 'dc']
description: 'This document provides a detailed overview of a remote PowerShell monitor designed to detect whether the Active Directory Recycle Bin is enabled or disabled on Windows Domain Controller servers. It includes suggested configurations, dependencies, and implementation instructions.'
tags: ['active-directory', 'recovery', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a remote PowerShell monitor that detects whether the AD Recycle Bin is enabled or disabled on Windows Domain Controller (DC) servers.

## Details

**Suggested "Limit to"**: Windows Infrastructure masters  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Execute Script - AD - Enable AD Recycle Bin  

| Check Action | Server Address | Check Type | Comparator   | Interval | Result |
|--------------|----------------|-------------|--------------|----------|--------|
| System       | 127.0.0.1      | Run File    | State based   | 86400    | ![](../../../static/img/AD-Recycle-Bin-State-Check/image_1.png) |

## Dependencies

- [AD - Enable AD Recycle Bin](<../scripts/AD - Enable AD Recycle Bin.md>)  
- [RSM - Active Directory - Role - AD Domain Recycle Bin Feature](<../roles/AD Domain Recycle Bin Feature.md>)  

## Target

Domain Controllers only.

## Implementation

- [Import - Remote Monitor - AD Recycle Bin State Check](<./Import- AD Recycle Bin State Check.md>) 