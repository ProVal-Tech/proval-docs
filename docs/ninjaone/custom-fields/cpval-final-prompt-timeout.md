---
id: '02cc7b8d-28aa-46c6-936b-21786c56206e'
slug: /02cc7b8d-28aa-46c6-936b-21786c56206e
title: 'cPVAL Final Prompt Timeout'
title_meta: 'cPVAL Final Prompt Timeout'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Sets how long (in seconds) the final reboot prompt stays visible before forcing the reboot automatically.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Sets how long (in seconds) the final reboot prompt stays visible before forcing the reboot automatically.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Final Prompt Timeout Seconds` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Final Prompt Timeout` | `cpvalFinalPromptTimeout` | `900` | `Organization, Location, Device` | `Numeric` | `False` | `900` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Final Prompt Timeout Seconds`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-final-prompt-timeout.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
