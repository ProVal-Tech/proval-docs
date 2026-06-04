---
id: 'a2868f9d-3f8b-47a9-97b9-8c658035a3d8'
slug: /a2868f9d-3f8b-47a9-97b9-8c658035a3d8
title: 'Remove Windows Defender Feature'
title_meta: 'Remove Windows Defender Feature'
keywords: ['windows-defender', 'windows-server', 'feature-removal', 'security']
description: 'Documentation for the Remove-WindowsDefenderFeature command to uninstall Windows Defender features on Windows Server with an optional server restart.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-01
---

## Description
This script removes the installed Windows Defender feature on supported Windows Server systems and can optionally restart the server after a successful uninstall.

## Sample Run

![Image](../../../static/img/docs/a2868f9d-3f8b-47a9-97b9-8c658035a3d8/samplerun1.webp) 
![Image](../../../static/img/docs/a2868f9d-3f8b-47a9-97b9-8c658035a3d8/samplerun2.webp) 
![Image](../../../static/img/docs/a2868f9d-3f8b-47a9-97b9-8c658035a3d8/samplerun3.webp) 

## Dependencies

- PowerShell 5.0+
- Remove-WindowsDefenderFeature.ps1
- [Agnostic Script](/docs/4fcf3a89-30a1-4c63-99a1-d4d8a706f95b)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** Remove Windows Defender Feature   

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.

## Parameter

| Parameter | Required | Value | Details |
| --------- | -------- | ------- | ------- |
|Forcerestart| Yes | `0`, `1` | Enter 1 to reboot the device, or 0 to skip the reboot. |

## Output

Script Logs

## Changelog

### 2026-06-01

- Initial version of the script.
