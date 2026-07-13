---
id: '12775f61-616e-4157-9f47-4623433bf68d'
slug: /12775f61-616e-4157-9f47-4623433bf68d
title: 'cPVAL Reboot Prompt Suppress Time Window'
title_meta: 'cPVAL Reboot Prompt Suppress Time Window'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Specify a 24-hour time range (HHmm-HHmm) to suppress prompts (e.g., 1800-0900 blocks prompts from 6:00 PM to 9:00 AM).'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Specify a 24-hour time range (HHmm-HHmm) to suppress prompts (e.g., 1800-0900 blocks prompts from 6:00 PM to 9:00 AM).

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Suppress Time Window` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Prompt Suppress Time Window` | `cpvalRebootPromptSuppressTimeWindow` | `1800-0900` | `Organization, Location, Device` | `Text` | `False` | `` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Suppress Time Window`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-prompt-suppress-time-window.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
