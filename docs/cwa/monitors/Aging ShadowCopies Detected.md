---
id: '403139ff-70e7-440d-9683-be915f4ce16f'
title: 'Aging ShadowCopies Detected'
title_meta: 'Aging ShadowCopies Detected'
keywords: ['monitor', 'shadow', 'copy', 'windows', 'agents']
description: 'This document describes a monitor that detects Windows agents lacking shadow copies or having copies older than a specified system property value. It includes dependencies and target systems for implementation.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will detect agents where shadow copies are not present or are older than the system property value, `@ProVal_ShadowCopyRemoveMaxInDays`.

## Dependencies

- `@ProVal_ShadowCopyRemoveMaxInDays` - System Property.
- [Shadow Copy - Audit Complete Statistics [DV]](../scripts/Shadow%20Copy%20-%20Audit%20Complete%20Statistics%20DV.md)  
  `@ShadowCopy - Create [Global, Autofix]` -- Autofix script
- `@plugin_proval_shadowcopystats` - Custom Table

## Target

Windows Machines - This monitor should be run on all Windows machines.



