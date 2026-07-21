---
id: '58e81186-a952-40e6-8f06-ad485c52ef2a'
slug: /58e81186-a952-40e6-8f06-ad485c52ef2a
title: 'cPVAL Final Prompt Reboot Delay Minutes'
title_meta: 'cPVAL Final Prompt Reboot Delay Minutes'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Specifies the grace period (in minutes) after the user acknowledges the final prompt before the system actually restarts.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Specifies the grace period (in minutes) after the user acknowledges the final prompt before the system actually restarts.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Final Reboot Delay Minutes` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Final Prompt Reboot Delay Minutes` | `cpvalFinalPromptRebootDelayMinutes` | `5` | `Organization, Location, Device` | `Numeric` | `False` | `5` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Final Reboot Delay Minutes`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-final-prompt-reboot-delay-minutes.toml)

## Changelog

### 2026-07-20

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
