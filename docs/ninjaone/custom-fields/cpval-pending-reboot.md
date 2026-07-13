---
id: '31558959-f3a5-4f4f-9388-6e7512972b01'
slug: /31558959-f3a5-4f4f-9388-6e7512972b01
title: 'cPVAL Pending Reboot'
title_meta: 'cPVAL Pending Reboot'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Manual override checkbox to force a reboot prompt cycle on a specific device, regardless of Windows pending reboot status.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field allows administrators or end-users to manually force a reboot prompt cycle on a specific device, regardless of its current reboot status. It acts as a manual override at the Device level.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Manual override)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Pending Reboot` | `cpvalPendingReboot` | `True` | `Device` | `Checkbox` | `False` | `False` | N/A | `Yes` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This field is intended for manual intervention. Checking this box will immediately trigger the reboot prompt workflow for this specific device.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-pending-reboot.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
