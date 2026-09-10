---
id: 'b5ebd2f7-43ab-414e-876f-25d843fcb7bd'
slug: /b5ebd2f7-43ab-414e-876f-25d843fcb7bd
title: 'cPVAL Reboot Schedule Max Hours'
title_meta: 'cPVAL Reboot Schedule Max Hours'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Sets the maximum number of hours ahead a user may schedule their pending reboot on the final prompt. Set to 0 to disable the scheduler and the reminder entirely.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Sets the maximum number of hours ahead a user may schedule their pending reboot on the final prompt. Set to 0 to disable the scheduler and the reminder entirely.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Reboot Schedule Max Hours` - acts as the ultimate fallback default)

When this field is set to a value greater than 0, the final prompt presents a date and time picker instead of a single acknowledgement button, allowing the user to choose when the restart happens, up to this many hours ahead. When it is 0 or left unconfigured, the solution behaves exactly as it did before: the final prompt shows a single button and the restart follows the configured final prompt delay. This field is therefore the master switch for the reboot scheduler.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Schedule Max Hours` | `cpvalRebootScheduleMaxHours` | `48` | `Organization, Location, Device` | `Numeric` | `False` | `0` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Reboot Schedule Max Hours`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-schedule-max-hours.toml)

## Changelog

### 2026-09-09

- Initial version of the document
