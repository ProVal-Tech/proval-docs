---
id: 'f93e2bb8-905f-4032-98c5-4d943f0e6580'
slug: /f93e2bb8-905f-4032-98c5-4d943f0e6580
title: 'cPVAL Max Missed Prompts Before Force'
title_meta: 'cPVAL Max Missed Prompts Before Force'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Max consecutive missed prompts (due to locked screen or no user) allowed before forcing a reboot. Set to 0 to disable.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Max consecutive missed prompts (due to locked screen or no user) allowed before forcing a reboot. Set to 0 to disable.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Max Missed Prompts Before Force` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Max Missed Prompts Before Force` | `cpvalMaxMissedPromptsBeforeForce` | `3` | `Organization, Location, Device` | `Numeric` | `False` | `0` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Max Missed Prompts Before Force`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-max-missed-prompts-before-force.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
