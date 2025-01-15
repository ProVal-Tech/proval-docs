---
id: '3003a8ec-6b99-4b7d-ae31-438371e3b4f3'
title: 'Windows Shadow Copy Audit Statistics'
title_meta: 'Windows Shadow Copy Audit Statistics'
keywords: ['windows', 'shadowcopy', 'audit', 'statistics', 'endpoint', 'data']
description: 'This document provides detailed information about the Windows Shadow Copy state for endpoints with Shadow Copy enabled. It includes a comprehensive table outlining the schema for storing shadow copy data collected from the specified script, along with dependencies and explanations for each column.'
tags: ['database', 'setup', 'report', 'performance', 'windows']
draft: false
unlisted: false
---
## Purpose

This table stores the Windows Shadow Copy state for endpoints with Shadow Copy Enabled collected from the script [Shadow Copy - Audit Complete Statistics [DV]](https://proval.itglue.com/DOC-5078775-7751337) result.

## Dependencies

[Shadow Copy - Audit Complete Statistics [DV]](https://proval.itglue.com/DOC-5078775-7751337)

## Tables

#### plugin_proval_shadowcopy

| Column            | Type    | Explanation                                                                                      |
|-------------------|---------|--------------------------------------------------------------------------------------------------|
| computerid        | INT     | It contains the ID of the associated computer where the script executed to collect shadow copy data |
| driveid           | INT     | It contains the ID of the associated drive where the script executed to collect shadow copy data  |
| DriveLetter       | VARCHAR | It stores the drive letter for which the shadow copy data is collected                           |
| CapacityGB        | DECIMAL | It stores the allotted capacity for Shadow Copy on the machine                                   |
| FreeSpaceGB      | DECIMAL | It contains the remaining space for Shadow Copy to use on the machine                            |
| ShadowCopyCount   | INT     | It collects the number of Shadow Copies on the machine                                          |
| OldestShadowCopy  | VARCHAR | It contains the oldest available Shadow Copy date                                               |
| LatestShadowCopy  | VARCHAR | It contains the most recent available Shadow Copy date                                           |






