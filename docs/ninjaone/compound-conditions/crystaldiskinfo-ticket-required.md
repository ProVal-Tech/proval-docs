---
id: '2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6'
slug: /2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6
title: 'crystaldiskinfo-ticket-required'
title_meta: 'crystaldiskinfo-ticket-required'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Compound condition that evaluates drive health alerts and triggers ConnectWise Manage ticket creation when a degraded disk is detected.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Summary

The `CrystalDiskInfo - Ticket Required` compound condition evaluates the device's drive health state and triggers ConnectWise Manage ticket creation when a degraded or failing disk is detected. It checks that the [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) checkbox is marked, ensures the [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) is active and not set to Disable or Audit Only, and executes the [CrystalDiskInfo Alert](/docs/4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5) script. If the alert script exits with code 1 and returns a plain-text summary, the condition triggers the [CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3) ConnectWise Manage ticket template to create a support ticket. The condition resets when the drive health recovers and the alert is no longer required.

## Details

- **Name:** CrystalDiskInfo - Ticket Required
- **Description:** Evaluates the device's drive health state and triggers ConnectWise Manage ticket creation when a degraded or failing disk is detected.
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Solution: Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a)
- [Custom Field: cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1)
- [Custom Field: cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e)
- [Script: CrystalDiskInfo Alert](/docs/4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5)
- [CW Manage Ticket Template: CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/crystaldiskinfo-ticket-required.toml)

## Changelog

### 2026-08-06

- Initial version of the document
