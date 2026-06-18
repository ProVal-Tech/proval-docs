---
id: '056a117e-1e9b-4a81-b1a7-966c15b660f9'
slug: /056a117e-1e9b-4a81-b1a7-966c15b660f9
title: 'Manage Developer Mode'
title_meta: 'Manage Developer Mode'
keywords: ['developer-mode', 'enable-developer-mode', 'disable-developer-mode', 'check-developer-mode', 'manage-developer-mode']
description: 'Includes Windows 10 and 11 devices with the desired Developer Mode set to Check, Enable, or Disable. A daily automation enforces the desired state and updates the current value. Use this group to compare and track desired vs current settings.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

The Manage Developer Mode group includes Windows 10 and Windows 11 devices where the [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) field is set to `Check`, `Enable`, or `Disable`. Devices set to `None` are not included in this group.

A daily automation runs on all devices in this group. This automation ensures that the Developer Mode setting on each device matches the value defined in the [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) field. If the value is set to `Enable` or `Disable`, the [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af) automation will apply the required change on the device. If the value is set to `Check`, the automation will only read the current state without making changes.

After each run, the automation updates the [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b) field with the latest state reported from the device. This allows you to track the actual configuration present on the endpoint.

This group can also be used for monitoring and validation. Since both desired and current values are available as columns, you can easily compare them to identify mismatches, confirm compliance, or troubleshoot issues where the expected setting has not been applied.

## Dependencies

- [Custom Field: cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2)
- [Custom Field: cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b)
- [Automation: Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af)
- [Solution: Manage Developer Mode](/docs/3ab05cd9-d579-49d1-92c8-2b57870f5e7d)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/manage-developer-mode.toml)

## Columns

| Sort | Column | Description |
| ---- | ------ | ----------- |
| 1 | Device | The name of the device. |
| 2 | Health Detail | Current health status of the device as reported by NinjaRMM. |
| 3 | Organization | The organization the device belongs to. |
| 4 | Location | The location assigned to the device within the organization. |
| 5 | Last Uptime | Indicates whether the device is currently online or offline in NinjaRMM. |
| 6 | OS Name | The operating system name and version installed on the device. |
| 7 | [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) | The desired Developer Mode state configured at the Organization, Location, or Device level. |
| 8 | [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b) | The actual Developer Mode state on the device as of the last automation run. |

## Changelog

### 2026-06-17

- Initial version of the document
