---
id: '14af3c59-efba-4f62-959a-50ad6e382836'
slug: /14af3c59-efba-4f62-959a-50ad6e382836
title: 'pvl_lsuclient_audit'
title_meta: 'pvl_lsuclient_audit'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'This table stores the available update data retrieved during the Lenovo System Update scanning process.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

This table stores the available update data retrieved during the Lenovo System Update scanning process.

## Dependencies

- [Script: Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010)
- [Script: OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)
- [Solution: Lenovo System Update Handler](/docs/d801eded-6c8e-413b-852a-5ff83058667b)

## Tables

### pvl_lsuclient_audit

| Column           | Type     | Explanation                                                                 |
|------------------|----------|-----------------------------------------------------------------------------|
| ComputerID       | Int32    | Automate Computer ID                                                        |
| Id               | String   | The unique Lenovo update identifier                                         |
| Title            | String   | Human-readable update description                                           |
| Type             | String   | Update type (e.g., 'Driver', 'BIOS', 'Firmware')                            |
| Category         | String   | Hardware category (e.g., 'Networking LAN Ethernet')                         |
| Version          | String   | Update version                                                              |
| Severity         | String   | Severity level (e.g., 'Critical', 'Recommended')                            |
| ReleaseDate      | Date     | Release date of the update (yyyy-MM-dd)                                     |
| RebootType       | Int32    | Integer indicating reboot requirements (0=No Reboot; 1=Forces a Reboot; 2=Unknown; 3=Reboot Required; 4=Power Off Required; 5=Reboot Delayed) |
| Vendor           | String   | The vendor name (e.g., 'Lenovo')                                            |
| Size             | Int64    | File size of the update payload                                             |
| url              | String   | Direct download URL for the update XML/payload                              |
| Installer        | String   | Installer type (e.g., 'PackageInstallInfo')                                 |
| IsApplicable     | Int32    | Applicability status (1 for True, 0 for False)                              |
| IsInstalled      | Int32    | Installation status (1 for True, 0 for False)                               |
| ScriptRunTime    | DateTime | Timestamp the script executed (yyyy-MM-dd HH:mm:ss)                         |

## Changelog

### 2026-04-30

- Initial version of the document.
