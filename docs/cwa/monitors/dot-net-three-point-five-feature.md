---
id: 'be6d1705-be61-4510-b3c1-9a0f75397e46'
slug: /be6d1705-be61-4510-b3c1-9a0f75397e46
title: '.Net 3.5 Feature'
title_meta: '.Net 3.5 Feature'
keywords: ['feature', 'windows-workstations', '.net', '.net-3.5', '3.5']
description: 'This monitor verifies the installation status of the .NET Framework 3.5 feature on Windows 10 and Windows 11 workstations. It executes a PowerShell check for the 'NetFx3' feature state. If the feature is disabled, the monitor returns a Compliance Failure alert, which triggers the associated autofix action to install the framework'
tags: ['dotnet', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor verifies the installation status of the .NET Framework 3.5 feature on Windows 10 and Windows 11 workstations. It executes a PowerShell check for the 'NetFx3' feature state. If the feature is disabled, the monitor returns a 'Compliance Failure' alert, which triggers the associated autofix action to install the framework

## Details

**Suggested "Limit to"**: `Enable .Net 3.5 Feature`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `△ Custom - Enable - .Net 3.5 Feature`

| Check Action | Server Address | Check Type | Comparator | Interval | Result |
| ------------ | -------------- | ---------- | ---------- | -------- | ------ |
|              |                |            |            |          |        |

## Dependencies

- [Solution: Enable .Net 3.5](/docs/5d596cd8-3e9d-4a03-a610-ec85f8a9fb19)

## Target

Managed Windows Workstations

## Implementation