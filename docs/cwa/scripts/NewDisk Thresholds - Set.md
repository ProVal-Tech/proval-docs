---
id: '9abc689e-609d-48dc-9f90-802c69ddef9b'
slug: /9abc689e-609d-48dc-9f90-802c69ddef9b
title: 'NewDisk Thresholds - Set'
title_meta: 'NewDisk Thresholds - Set'
keywords: ['disk', 'thresholds', 'global', 'computer', 'properties']
description: 'This document provides a comprehensive guide on using the script to set or reset global or computer level disk thresholds. It includes sample runs, dependencies, variable documentation, user parameters, and expected output.'
tags: ['performance', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script can be used to set or reset global or computer level disk thresholds.

## Sample Run

## Dependencies

- [CWM - Automate - Script - Property - Set](<./Property - Set.md>)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                                                  |
|-------|--------------------------------------------------------------|
| Name  | The name of the Global / Computer system property / EDF.    |
| Value | The value to be assigned to the Name.                        |

#### User Parameters

| Name               | Example               | Required | Description                                                                                       |
|--------------------|-----------------------|----------|---------------------------------------------------------------------------------------------------|
| 16-300Threshold     | A percent such as 10  | True     | The percent of free space that, if above, violates the threshold.                                 |
| 300-1024Threshold   | A size in bytes such as 34200 | True     | The size in bytes of free space that, if below, violates the threshold.                          |
| 1024+Threshold      | A size in bytes such as 72000 | True     | The size in bytes of the free space that, if below, violates the threshold.                      |
| Overwrite           | 0 / 1                 | False    | Set to 1 to overwrite any currently set global or computer level thresholds.                      |
| Type                | Computer / Global      | False    | Sets the type of property to set, either global or computer.                                     |

## Output

- Script log


