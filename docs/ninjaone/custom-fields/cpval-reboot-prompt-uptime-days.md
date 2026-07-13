---
id: 'd38a1b1a-1620-456a-a341-2770520a8f33'
slug: /d38a1b1a-1620-456a-a341-2770520a8f33
title: 'cPVAL Reboot Prompt Uptime Days'
title_meta: 'cPVAL Reboot Prompt Uptime Days'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Defines the number of uptime days that must pass before prompting for a reboot. Setting to 0 disables this trigger.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Defines the number of uptime days that must pass before prompting for a reboot. Setting to 0 disables this trigger.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`N/A` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Prompt Uptime Days` | `cpvalRebootPromptUptimeDays` | `14` | `Organization, Location, Device` | `Numeric` | `False` | `0` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`N/A`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-prompt-uptime-days.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
