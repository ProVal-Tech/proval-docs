---
id: '6c1a94e7-f52b-4a8d-9e3c-8b5d26f4a7e2'
slug: /6c1a94e7-f52b-4a8d-9e3c-8b5d26f4a7e2
title: 'crystaldiskinfo-audit-eligible-devices'
title_meta: 'crystaldiskinfo-audit-eligible-devices'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Compound condition that identifies physical Windows devices eligible for the Proactive Disk Health Monitor audit, excluding opted-out entities.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Summary

The `CrystalDiskInfo - Audit Eligible Devices` compound condition identifies physical Windows workstations that are opted into the [Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a) solution. It verifies that the [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) custom field exists and is not set to Disable. When the conditions are met, it triggers the [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8) script to collect drive health data and populate the device custom fields. The automation runs every 24 hours and automatically resets after 4 hours to ensure regular monitoring.

## Details

- **Name:** CrystalDiskInfo - Audit Eligible Devices
- **Description:** Identifies physical Windows workstations that are opted into the Proactive Disk Health Monitor and triggers the audit automation.
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Solution: Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a)
- [Custom Field: cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e)
- [Script: CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/crystaldiskinfo-audit-eligible-devices.toml)

## Changelog

### 2026-08-06

- Initial version of the document
