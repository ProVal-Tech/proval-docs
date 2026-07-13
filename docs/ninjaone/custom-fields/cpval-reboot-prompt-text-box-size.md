---
id: '0b87e4d5-6548-4603-b741-77db2e81b8f3'
slug: /0b87e4d5-6548-4603-b741-77db2e81b8f3
title: 'cPVAL Reboot Prompt Text Box Size'
title_meta: 'cPVAL Reboot Prompt Text Box Size'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Specifies the size of the message text box area in WIDTHxHEIGHT format.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

Specifies the size of the message text box area in WIDTHxHEIGHT format.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`N/A` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot Prompt Text Box Size` | `cpvalRebootPromptTextBoxSize` | `500x200` | `Organization, Location, Device` | `Text` | `False` | `` | N/A | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`N/A`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-prompt-text-box-size.toml)

## Changelog

### 2026-07-13

- Initial version of the document
