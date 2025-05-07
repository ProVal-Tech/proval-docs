---
id: '59bbf54a-55af-42fa-9e77-cd0b105122de'
slug: /59bbf54a-55af-42fa-9e77-cd0b105122de
title: 'plugin_proval_shadowcopystats'
title_meta: 'plugin_proval_shadowcopystats'
keywords: ['shadow', 'copies', 'windows', 'audit', 'statistics']
description: 'This document provides detailed information about Windows shadow copies, including their statistics and storage details. It outlines the structure of the data collected, dependencies, and specific metrics related to shadow copies on audited machines.'
tags: ['backup', 'disk-encryption', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores information about Windows shadow copies.

## Dependencies

[Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766)

## Table

#### plugin_proval_shadowcopystats

| Column          | Type    | Explanation                                                                                      |
|-----------------|---------|--------------------------------------------------------------------------------------------------|
| ComputerID      | INT     | The ComputerID of the audited machine.                                                          |
| DriveLetter     | VARCHAR | The audited drive letter.                                                                        |
| DriveSize       | FLOAT   | The total size of the drive, provided in GB.                                                   |
| DriveFree       | FLOAT   | The free size of the drive, provided in GB.                                                    |
| CopyCount       | INT     | The number of shadow copies of the drive that exist on the audited computer.                   |
| OldestCopy      | DATETIME| The date of the oldest shadow copy.                                                              |
| LatestCopy      | DATETIME| The date of the newest shadow copy.                                                              |
| AllocatedSpace   | FLOAT   | Allocated space size for the Shadow Copy in GB.                                               |
| UsedSpace       | FLOAT   | Used space size by the Shadow Copy in GB.                                                       |
| MaxSpace        | FLOAT   | Maximum space provided to the Shadow Copy in GB.                                               |

