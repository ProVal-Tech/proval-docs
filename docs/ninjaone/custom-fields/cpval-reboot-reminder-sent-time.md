---
id: '0181a174-2874-47d1-a18f-009c1aeb7024'
slug: /0181a174-2874-47d1-a18f-009c1aeb7024
title: 'cPVAL Reboot Reminder Sent Time'
title_meta: 'cPVAL Reboot Reminder Sent Time'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Automation-managed field that records when the pre-reboot reminder was displayed and the restart countdown was started.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Summary

This custom field is written and maintained by the Reboot Pending Prompt automation. It exists so the solution can track a restart that a user has scheduled, and it is available at the Device level only.

Automation-managed field that records when the pre-reboot reminder was displayed and the restart countdown was started.

**Configuration:** This field has no configuration hierarchy and no script runtime variable fallback. It is not intended to be set or changed by a technician.

The value is stored in `YYYY-MM-DD HH:MM:SS` format. While it holds a value, the device is held out of the prompt cycle so a second reminder cannot be displayed into a restart that is already counting down.

The field is cleared automatically once the device restarts. If the device has not restarted within 60 minutes, the countdown is treated as cancelled, the value is cleared, and the device returns to the normal prompt cycle.

A blank value means no restart is currently pending on the device.

>**⚠️ Important:** Do not edit or clear this field manually.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Reminder Sent Time` | `cpvalRebootReminderSentTime` | `2026-09-09 14:15:00` | `Device` | `Text` | `False` | `N/A` | N/A | `No` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This field is blank until the automation populates it. A blank value is the normal state for a device with no scheduled restart.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-reminder-sent-time.toml)

## Changelog

### 2026-09-09

- Initial version of the document
