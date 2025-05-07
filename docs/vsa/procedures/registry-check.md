---
id: 'f0d83724-e8a8-41f8-8f73-fea99d0f34de'
slug: /f0d83724-e8a8-41f8-8f73-fea99d0f34de
title: 'Registry Check'
title_meta: 'Registry Check'
keywords: ['windows', 'upgrade', 'status', 'feature', 'check']
description: 'This document outlines a process for checking the status of the Windows 10 Feature Upgrade process, including sample runs, output logs, and how the process reacts to different installation states.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks the status of the Windows 10 Feature Upgrade process.

## Sample Run

| Time                     | Task               | Status                                           | Link                       |
|--------------------------|--------------------|--------------------------------------------------|----------------------------|
| 10:54:24 am 1-Sep-22    | Registry Check      | Success THEN                                     | provaltech.com/dan.hicks   |
| 10:54:23 am 1-Sep-22    | Registry Check      | Feature Upgrade Install State: 2                 | provaltech.com/dan.hicks   |
| 10:54:16 am 1-Sep-22    | Run Now - Registry Check | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Registry Check to run at Sep 1 2022 10:54 AM |

## Process

The process is scheduled automatically in 1-hour increments. It reacts to the reported installation state and responds accordingly:
- Sets the custom field to FAILURE, SUCCESS, or IN PROGRESS.
- Reschedules the check if the status is IN PROGRESS.

## Output

AP Log

