---
id: '5041d497-ae6c-4209-a338-60f1da396106'
slug: /5041d497-ae6c-4209-a338-60f1da396106
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
| System       | 127.0.0.1      | Run File    | State based   | 86400    | ![](../../../static/img/docs/5041d497-ae6c-4209-a338-60f1da396106/image_1_1.webp) |

## Dependencies

- [AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f)  
- [RSM - Active Directory - Role - AD Domain Recycle Bin Feature](/docs/01cb2977-8f3e-49fa-ad5b-62375c54a39c)  

## Target

Domain Controllers only.

## Implementation

- [Import - Remote Monitor - AD Recycle Bin State Check](/docs/7f37dfc1-5f0a-4f7d-bf9f-631ea653a74d) 