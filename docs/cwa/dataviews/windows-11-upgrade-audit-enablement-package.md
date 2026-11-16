---
id: '1488c8ab-6719-4b0b-987a-a2e163a0b26a'
slug: /1488c8ab-6719-4b0b-987a-a2e163a0b26a
title: 'Windows 11 Upgrade Audit [Enablement Package]'
title_meta: 'Windows 11 Upgrade Audit [Enablement Package]'
keywords: ['windows-11', '25h2', '26h2', 'enablement-package', 'upgrade', 'report', 'audit']
description: 'Displays Windows 11 24H2, 25H2, and 26H2 computers, whether the enablement package upgrades are turned on for them, and the result of the last upgrade attempt.'
tags: ['report', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Displays Windows 11 24H2, 25H2, and 26H2 computers and their progress in the [Windows 11 Enablement Package Upgrade](/docs/b3a6abf9-10cd-40fe-a628-d736665b8963) solution. For each computer, it shows whether the 25H2 and 26H2 upgrades are turned on and the result of the last run of the [Update Windows 11 [Enablement Package] [Autofix]](/docs/451e5dc2-dc40-11f1-90d7-92000234cfc2) script.

## Dependencies

- [Solution: Windows 11 Enablement Package Upgrade](/docs/b3a6abf9-10cd-40fe-a628-d736665b8963)
- [Script: Update Windows 11 [Enablement Package] [Autofix]](/docs/451e5dc2-dc40-11f1-90d7-92000234cfc2)

## Columns

| Column | Description |
|--------|-------------|
| clientid | clientid (Hidden) |
| locationid | locationid (Hidden) |
| ComputerId | ComputerId |
| Client | Client Name |
| Location | Location Name |
| Computer | Computer Name |
| Friendly Name | Friendly Name of the computer |
| Operating System | Operating System |
| Last Contact | Last Contact time with Automate |
| Last Logged In User | Last Logged In User on the computer |
| Form Factor | Computer type (Physical Server/Virtual Server/Laptop/Desktop) |
| Current OS Version | Current OS Version of the machine |
| 25H2 Upgrade | `Enabled` when the 25H2 upgrade is turned on for the computer by its system property or EDFs and not blocked by a Disable EDF. Otherwise `Disabled`. |
| 26H2 Upgrade | `Enabled` when the 26H2 upgrade is turned on for the computer by its system property or EDFs and not blocked by a Disable EDF. Otherwise `Disabled`. |
| OS Version Before Script Run | Windows 11 version of the computer when the script last ran (`EP_Autofix_SourceVersion`) |
| Upgrade Script RunTime | Most recent run time of the script (`EP_Autofix_RunTime`) |
| Upgrade Status | `Success` once the computer reports a newer version than **OS Version Before Script Run**. Otherwise, the result of the last run (`EP_Autofix_Result`): `Reboot Pending` or `Failed`. Shows `Not Attempted` when the script has not run on the computer. |

## Format Control

| Column | Comparator | Value | Colour |
| ------ | ---------- | ----- | ------ |
| Upgrade Status | Equals | Success | Green |
| Upgrade Status | Equals | Failed | Red |
| Upgrade Status | Equals | Reboot Pending | Blue |
| Upgrade Status | Equals | Not Attempted | Orange |
| 25H2 Upgrade | Equals | Enabled | Green |
| 25H2 Upgrade | Equals | Disabled | Red |
| 26H2 Upgrade | Equals | Enabled | Green |
| 26H2 Upgrade | Equals | Disabled | Red |

## Changelog

### 2026-11-09

- Initial version of the document.
