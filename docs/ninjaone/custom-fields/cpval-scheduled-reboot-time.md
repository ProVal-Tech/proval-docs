---
id: 'e5cebd02-17e2-4e64-9ace-c62d8541f52c'
slug: /e5cebd02-17e2-4e64-9ace-c62d8541f52c
title: 'cPVAL Scheduled Reboot Time'
title_meta: 'cPVAL Scheduled Reboot Time'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Automation-managed field that stores the date and time the user selected for their reboot on the final prompt.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Summary

This custom field is written and maintained by the Reboot Pending Prompt automation. It exists so the solution can track a restart that a user has scheduled, and it is available at the Device level only.

Automation-managed field that stores the date and time the user selected for their reboot on the final prompt.

**Configuration:** This field has no configuration hierarchy and no script runtime variable fallback. It is not intended to be set or changed by a technician.

The value is stored in `YYYY-MM-DD HH:MM:SS` format. It is written by the autofix automation when a user schedules their restart, and it is read by the detection automation, which stops detecting the device while the value holds a future time. The field is cleared automatically once the reminder is sent.

A blank value means no restart is currently scheduled for the device.

>**⚠️ Important:** Do not edit or clear this field manually. Clearing it cancels a restart the user has already been promised and returns the device to the prompt cycle.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Scheduled Reboot Time` | `cpvalScheduledRebootTime` | `2026-09-09 14:30:00` | `Device` | `Text` | `False` | `N/A` | N/A | `No` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This field is blank until the automation populates it. A blank value is the normal state for a device with no scheduled restart.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-scheduled-reboot-time.toml)

## Changelog

### 2026-09-09

- Initial version of the document
