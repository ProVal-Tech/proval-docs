---
id: '6098e1b1-86c8-4016-9715-b6be8f1b71ed'
slug: /6098e1b1-86c8-4016-9715-b6be8f1b71ed
title: 'Manage Developer Mode'
title_meta: 'Manage Developer Mode'
keywords: ['developer-mode', 'enable-developer-mode', 'disable-developer-mode', 'check-developer-mode', 'manage-developer-mode']
description: 'Runs the script daily at 11 AM on devices in the Manage Developer Mode group.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

This task targets all devices that are part of the [Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9) group. The group determines which devices are included based on their configured desired state for Developer Mode.

It executes the [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af) script daily at `11:00 AM` on each device in the group. The script checks the value set in the [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) custom field and takes the appropriate action. This may include enabling Developer Mode, disabling it, or simply checking the current state without making changes.

After execution, the script updates the [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b) custom field with the latest value from the device.

This task ensures that Developer Mode settings are checked and enforced daily across all applicable devices, keeping them aligned with the defined configuration.

## Dependencies

- [Custom Field: cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2)
- [Custom Field: cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b)
- [Automation: Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af)
- [Group: Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9)
- [Solution: Manage Developer Mode](/docs/3ab05cd9-d579-49d1-92c8-2b57870f5e7d)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Manage Developer Mode | Runs the script daily at 11 AM on devices in the Manage Developer Mode group. | `True` | Daily | `1 Day` | `11:00 AM` | `Never` | [Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9) | [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af) |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/manage-developer-mode.toml)

## Changelog

### 2026-06-17

- Initial version of the document
