---
id: 'e63a5602-1618-45cd-a9ae-b877fccc2ea7'
slug: /e63a5602-1618-45cd-a9ae-b877fccc2ea7
title: 'Time Sync Compliance - Workstations'
title_meta: 'Time Sync Compliance - Workstations'
keywords: ['windows', 'sync', 'time', 'compliance']
description: 'Triggers the `Configure Time Sync` on Windows Workstations where device time synchronization is enabled using `cPVAL Enable Time Sync Compliance` custom field.'
tags: ['compliance', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-30
---

## Summary
Triggers the [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) on Windows Workstations where device time synchronization is enabled using [Custom Field - cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3).

## Details

- **Name:** `Time Sync Compliance - Workstations`
- **Description:** `Triggers the 'Configure Time Sync' on Windows Workstations where device time synchronization is enabled using 'cPVAL Enable Time Sync Compliance' custom field.`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Automation - Configure Time Sync](/docs/002bd069-639a-488a-935f-17182ae8efe0) 
- [Custom Field - cPVAL Enable Time Sync Compliance](/docs/703ea4d2-6375-4f57-b54c-cce06808ebb3)
- [Solution - Time Sync Compliance](/docs/49acbca5-5fa4-4f75-bbbc-595cec9a7e29)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/time-sync-compliance-workstations.toml)

## Changelog

### 2026-09-30

- Initial version of the document
