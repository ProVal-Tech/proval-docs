---
id: 'c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562'
slug: /c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562
title: 'cPVAL Reboot if Not Logged In'
title_meta: 'cPVAL Reboot if Not Logged In'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'When enabled, allows the system to reboot immediately without showing a prompt if no user is currently logged in.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This custom field allows administrators to configure how the Reboot Pending Prompt solution behaves.

When enabled, allows the system to reboot immediately without showing a prompt if no user is currently logged in.

This setting is highly flexible and can be configured globally at the Organization level, and easily overridden at the Location or individual Device level as needed.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Overrides all lower levels)
2. **Location Level**
3. **Organization Level**
4. **Script Runtime Variable** (`Reboot If Not Logged In` - acts as the ultimate fallback default)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Reboot if Not Logged In` | `cpvalRebootIfNotLoggedIn` | `Enable` | `Organization, Location, Device` | `Dropdown` | `False` | `Disable` | Enable`, `Disable | `Yes` | <ul><li>**Organization:** `Reboot Pending Prompt`</li><li>**Location:** `Reboot Pending Prompt`</li><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** If this custom field is left blank or unconfigured at all levels, the system will automatically fall back to the default value defined in the automation script's runtime variables *`Reboot If Not Logged In`*.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-reboot-if-not-logged-in.toml)

## Changelog

### 2026-07-20

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
