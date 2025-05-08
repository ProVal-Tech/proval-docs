---
id: '8a19a7a7-454c-44ad-a2b7-6ce9fca32b47'
slug: /8a19a7a7-454c-44ad-a2b7-6ce9fca32b47
title: 'Invoke-RepairVolume'
title_meta: 'Invoke-RepairVolume'
keywords: ['windows', 'repair', 'volume', 'disk', 'scan']
description: 'This document details a script that runs Windows volume repair against one or more volumes, providing options for minimal interruption or complete drive stoppage during the repair process. It includes sample runs, dependencies, user parameters, and output details.'
tags: ['disk', 'windows']
draft: false
unlisted: false
---

## Summary

Runs Windows volume repair against one or more volumes.

## Sample Run

![Sample Run 1](../../../static/img/docs/8a19a7a7-454c-44ad-a2b7-6ce9fca32b47/image_1.webp)  
Run a scan and repair on the C drive with minimal drive interruption.

![Sample Run 2](../../../static/img/docs/8a19a7a7-454c-44ad-a2b7-6ce9fca32b47/image_2.webp)  
Run a scan and repair on all available drives, stopping the drives completely during the process.

## Dependencies

- [EPM - Disk - Agnostic - Script - Invoke-RepairVolume](/docs/5fc50641-00ec-41c0-b4c8-472d93cd8cfe)

#### User Parameters

| Name        | Example                                                                                          | Required | Description                                        |
|-------------|--------------------------------------------------------------------------------------------------|----------|----------------------------------------------------|
| DriveLetter | - C- "C", "D"- Blank (Targets all available drives)                                            | False    | The target drives you wish to scan or repair      |
| Repair      | `True` Toggles on the repair of any found issues; stopping the drive only when necessary. `false` or ` ` ensures scanning only. | False    | Toggles Scan only to Scan and repair.             |
| Full        | `True` Toggles the -Repair option to be more intrusive, stopping the drive for the entirety of the repair job. `False` or ` ` ensures that Repair is set to the least intrusive method. | False    | Toggles -Repair from least intrusive to most intrusive. |

## Process

1. Validates that the repair and Full parameters are within limits; if not, it logs errors and exits.
2. Reviews the agnostic content document for the process.

## Output

- Script log

