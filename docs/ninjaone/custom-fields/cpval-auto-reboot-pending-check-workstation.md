---
id: '82857979-0e81-45a3-af31-77a1e0def920'
slug: /82857979-0e81-45a3-af31-77a1e0def920
title: 'cPVAL Auto Reboot Pending Check Workstation'
title_meta: 'cPVAL Auto Reboot Pending Check Workstation'
keywords: ['reboot', 'pending-reboot', 'auto-reboot', 'workstation']
description: 'Restarts workstations only when NinjaOne reports a pending reboot.'
tags: ['custom-fields', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

Restarts workstations only when NinjaOne reports a pending reboot, for example after updates are installed.

- `Enabled` skips the scheduled restart of a workstation that has no pending reboot. The skip is recorded in [cPVAL Auto Reboot Status](/docs/1c29d754-ec90-4f42-88f1-4ac335657fbc) as `Skipped - No Pending Reboot`.
- `Disabled` restarts workstations on schedule whether a reboot is pending or not.

The pending reboot state is the one the NinjaOne agent last reported for the device, so a reboot that became pending in the last few minutes may not be seen yet.

:::note

- The field applies to workstations only and is ignored on servers.
- A blank value inherits from the level above. Blank at every level means `Disabled`.
- A change takes effect at the next run of the [Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b) automation, within an hour.

:::

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Auto Reboot Pending Check Workstation | cpvalAutoRebootPendingCheckWorkstation | `Enabled` | `Organization`, `Location`, `Device` | Drop-down | No | | `Enabled`, `Disabled` | Yes | <ul><li>`Auto Reboot Management` (Organization and Location)</li><li>`Auto Reboot Management - Workstations`</li></ul> |

## Dependencies

- [Automation: Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b)
- [Custom Field: cPVAL Auto Reboot Status](/docs/1c29d754-ec90-4f42-88f1-4ac335657fbc)
- [Solution: Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-auto-reboot-pending-check-workstation.toml)

## Sample Screenshot

![cPVAL Auto Reboot Pending Check Workstation](../../../static/img/docs/82857979-0e81-45a3-af31-77a1e0def920/image1.webp)

## Changelog

### 2026-11-11

- Initial version of the document
