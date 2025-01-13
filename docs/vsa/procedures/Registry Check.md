---
id: 'vsa-check-windows-10-feature-upgrade'
title: 'Check Windows 10 Feature Upgrade Status'
title_meta: 'Check Windows 10 Feature Upgrade Status'
keywords: ['windows', 'upgrade', 'status', 'feature', 'check']
description: 'This document outlines a process for checking the status of the Windows 10 Feature Upgrade process, including sample runs, output logs, and how the process reacts to different installation states.'
tags: ['windows', 'upgrade', 'configuration', 'report', 'performance']
draft: false
unlisted: false
---
## Summary

checks the status of the Windows 10 Feature Upgrade process

## Sample Run

| Time                     | Task               | Status                                           | Link                       |
|--------------------------|--------------------|--------------------------------------------------|----------------------------|
| 10:54:24 am 1-Sep-22    | Registry Check      | Success THEN                                     | provaltech.com/dan.hicks   |
| 10:54:23 am 1-Sep-22    | Registry Check      | Feature Upgrade Install State: 2                 | provaltech.com/dan.hicks   |
| 10:54:16 am 1-Sep-22    | Run Now - Registry Check | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Registry Check to run at Sep 1 2022 10:54AM |

## Process

Scheduled automatically in 1 hour increments. Reacts to the reported installation state and reacts accordingly:
- Sets the custom field to FAILURE, SUCCESS, or IN PROGRESS
- Reschedules the check if the status is in progress.

## Output

AP Log



