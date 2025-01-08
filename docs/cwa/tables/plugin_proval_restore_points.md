---
id: 'cwa-windows-restore-points'
title: 'Windows Restore Points Information'
title_meta: 'Windows Restore Points Information'
keywords: ['windows', 'restore', 'points', 'information', 'audit']
description: 'This document provides detailed information about Windows restore points, including their storage, dependencies, and the structure of the data table that captures key attributes such as ComputerID, RestorePointDate, RestorePointDescription, and SequenceNumber.'
tags: ['windows', 'backup', 'configuration', 'security', 'database']
draft: false
unlisted: false
---
## Purpose

Stores information about Windows restore points.

## Dependencies

[Windows Restore Point Automation - Gather Only](https://proval.itglue.com/DOC-5078775-8094219)  
@Windows Restore Point Automation (Script)

## Table

#### plugin_proval_restore_points

| Column                | Type    | Explanation                                                  |
|----------------------|---------|-------------------------------------------------------------|
| ComputerID           | INT     | The ComputerID of the audited machine.                     |
| RestorePointDate     | DATETIME| The date that the audited restore point was taken.         |
| RestorePointDescription | VARCHAR | The description of the audited restore point.              |
| SequenceNumber       | INT     | The number of previous sequences that this restore point has been through. |


