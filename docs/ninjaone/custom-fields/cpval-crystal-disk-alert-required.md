---
id: '1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1'
slug: /1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1
title: 'cpval-crystal-disk-alert-required'
title_meta: 'cpval-crystal-disk-alert-required'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Device-level checkbox that acts as a boolean flag to indicate if a drive health condition requires a support ticket.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Summary

The `cPVAL Crystal Disk Alert Required` custom field acts as a boolean flag indicating whether the device currently has a drive health condition that requires a support ticket. It is checked automatically by the [Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a) solution based on the drive health status and the configured [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e).

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Crystal Disk Alert Required | cpvalCrystalDiskAlertRequired | Checked | Device | Checkbox | No | Unchecked | N/A | No | CrystalDiskInfo |

This field is checked when an alert is required, and unchecked when no alert is needed. It is evaluated by the alerting compound condition to trigger automated ticket creation. When the box is checked, the alerting automation runs and generates a ticket. When the drive health recovers or no longer meets the alerting thresholds, the automation unchecks the box. Because the field is strictly managed by the automation, it is configured as read-only for technicians to prevent accidental modifications that could trigger false tickets or suppress legitimate alerts.

## Dependencies

- [Solution: Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-crystal-disk-alert-required.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1/image1.webp)

## Changelog

### 2026-08-06

- Initial version of the document
