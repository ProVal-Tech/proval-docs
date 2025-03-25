---
id: 'ebb1d05a-bb80-45e7-a4be-9cc73b8f308d'
slug: /ebb1d05a-bb80-45e7-a4be-9cc73b8f308d
title: 'plugin_proval_restore_points'
title_meta: 'plugin_proval_restore_points'
keywords: ['windows', 'restore', 'points', 'information', 'audit']
description: 'This document provides detailed information about Windows restore points, including their storage, dependencies, and the structure of the data table that captures key attributes such as ComputerID, RestorePointDate, RestorePointDescription, and SequenceNumber.'
tags: ['backup', 'database', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores information about Windows restore points.

## Dependencies

[Windows Restore Point Automation - Gather Only](<../scripts/Windows Restore Point Automation - Gather Only.md>)  
@Windows Restore Point Automation (Script)

## Table

#### plugin_proval_restore_points

| Column                  | Type     | Explanation                                                  |
|------------------------|----------|-------------------------------------------------------------|
| ComputerID             | INT      | The ComputerID of the audited machine.                     |
| RestorePointDate       | DATETIME | The date that the audited restore point was taken.         |
| RestorePointDescription | VARCHAR  | The description of the audited restore point.              |
| SequenceNumber         | INT      | The number of previous sequences that this restore point has been through. |


