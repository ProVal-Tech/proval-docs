---
id: '54992d2f-f374-41bb-9f61-e4d2fcc93478'
slug: /54992d2f-f374-41bb-9f61-e4d2fcc93478
title: '5 Consecutive Patch Jobs Failed'
title_meta: '5 Consecutive Patch Jobs Failed'
keywords: ['monitor', 'patch', 'failed', 'microsoft', 'jobs']
description: 'This document outlines a monitor designed to detect machines that have experienced five consecutive failed patches for Microsoft-based updates. It details the requirements for effective monitoring, including the necessity of having a minimum number of available patch jobs stored in the patchjobs table.'
tags: ['database', 'patching']
draft: false
unlisted: false
last_update:
  date: 2025-08-21
---

## Summary

This monitor will detect machines that have had five failed patches in a row for Microsoft-based patches. The number of patch jobs stored in the `patchjobs` table for that computer determines how well this monitor will work.

## Update Notice: 2025-08-21

- Optimized the mySQL query

## Requirements

1. A machine must have a minimum of 5 available patch jobs listed in the `patchjobs` table.
2. Patch history must be configured to allow for a minimum of 5 available patch jobs per computer to be stored in the `patchjobs` table.

## Target

`Global`

## Alert Template

`△ Custom - Ticket Creation - Computer`

## Ticketing

**Ticket Subject:** `5 Consecutive Patch Jobs Failed for <CLIENTNAME>\<COMPUTERNAME>`

**Ticket Body:** 

```PlainText
5 Consecutive Patch Jobs Failed for <CLIENTNAME>\<COMPUTERNAME>. 

Most Recent ErrorCode: "@TESTVALUE@"

Most Recent Patchjob log details: 

@FIELDNAME@
```

**Sample Ticket Body:**

```PlainText
5 Consecutive Patch Jobs Failed for Development\DEV-WIN11. 

Most Recent ErrorCode: "0xFFFFFFFF80070003"

Most Recent Patchjob log details: 

Windows Update Version 1407.2506.11012.0
2025-07 Cumulative Update for Windows 11 Version 24H2 for x64-based Systems (KB5062553) could not be downloaded, but will be reattempted.
```

## Changelog

### 2026-02-02

- Updated the monitor set to exclude machines missing 0 patches

### 2025-09-04

- Optimized the mySQL query

### 2025-04-10

- Initial version of the document
