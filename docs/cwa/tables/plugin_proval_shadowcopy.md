---
id: '3003a8ec-6b99-4b7d-ae31-438371e3b4f3'
title: 'Windows Shadow Copy Audit Statistics'
title_meta: 'Windows Shadow Copy Audit Statistics'
keywords: ['windows', 'shadowcopy', 'audit', 'statistics', 'endpoint', 'data']
description: 'This document provides detailed information about the Windows Shadow Copy state for endpoints with Shadow Copy enabled. It includes a comprehensive table outlining the schema for storing shadow copy data collected from the specified script, along with dependencies and explanations for each column.'
tags: ['database', 'performance', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

This table stores the Windows Shadow Copy state for endpoints with Shadow Copy enabled, collected from the script [Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>) result.

## Dependencies

[Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>)

## Tables

#### plugin_proval_shadowcopy

| Column            | Type    | Explanation                                                                                      |
|-------------------|---------|--------------------------------------------------------------------------------------------------|
| computerid        | INT     | Contains the ID of the associated computer where the script executed to collect shadow copy data. |
| driveid           | INT     | Contains the ID of the associated drive where the script executed to collect shadow copy data.  |
| DriveLetter       | VARCHAR | Stores the drive letter for which the shadow copy data is collected.                           |
| CapacityGB        | DECIMAL | Stores the allotted capacity for Shadow Copy on the machine.                                   |
| FreeSpaceGB      | DECIMAL | Contains the remaining space for Shadow Copy to use on the machine.                            |
| ShadowCopyCount   | INT     | Indicates the number of Shadow Copies on the machine.                                          |
| OldestShadowCopy  | VARCHAR | Contains the oldest available Shadow Copy date.                                               |
| LatestShadowCopy  | VARCHAR | Contains the most recent available Shadow Copy date.                                           |

