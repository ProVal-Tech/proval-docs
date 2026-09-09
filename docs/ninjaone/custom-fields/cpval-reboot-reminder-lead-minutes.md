---
id: '0ee089f7-57f0-4f99-a896-bd366b9ff08c'
slug: /0ee089f7-57f0-4f99-a896-bd366b9ff08c
title: 'cPVAL Reboot Reminder Lead Minutes'
title_meta: 'cPVAL Reboot Reminder Lead Minutes'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Specifies how many minutes ahead of a scheduled reboot the pre-reboot reminder is displayed and the restart countdown begins.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Specifies how many minutes ahead of a scheduled reboot the pre-reboot reminder is displayed and the restart countdown begins.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Reboot Reminder Lead Minutes` - acts as the ultimate fallback default)

This field only applies when the reboot scheduler is enabled through `cPVAL Reboot Schedule Max Hours`. The reminder is displayed by the detection cycle rather than by a local timer, so it appears somewhere inside this window rather than at an exact offset. The message always states the real restart time and the actual minutes remaining, resolved at the moment it is shown.

>**⚠️ Important:** This value must be set to the same number on both the detection and the autofix automation for a given platform. The detection automation uses it to decide when a scheduled reboot is due for its reminder, and the autofix automation uses it to size the restart countdown. A mismatch makes the two disagree.

>**⚠️ Important:** Keep this value well below 60 minutes. A restart that is still pending after 60 minutes is treated as cancelled and the stored schedule is cleared, so an unusually long lead window can clear a restart that is still valid.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Reminder Lead Minutes` | `cpvalRebootReminderLeadMinutes` | `15` | `Organization, Location, Device` | `Numeric` | `False` | `15` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Reboot Reminder Lead Minutes`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-reminder-lead-minutes.toml)

## Changelog

### 2026-09-09

- Initial version of the document
