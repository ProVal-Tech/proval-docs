---
id: 'fded67bb-c3a3-40bb-acb1-2baa0464de45'
slug: /fded67bb-c3a3-40bb-acb1-2baa0464de45
title: 'cPVAL Times Prompted'
title_meta: 'cPVAL Times Prompted'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Tracks the number of reboot prompts sent to the device. Updated automatically by the automation script.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This custom field is automatically managed by the Reboot Pending Prompt automation scripts to track the state of the reboot cycle.

Tracks the number of reboot prompts sent to the device. Updated automatically by the automation script.

It is not intended for manual configuration.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Automatically managed by the automation script)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Times Prompted` | `cpvalTimesPrompted` | `2` | `Device` | `Numeric` | `False` | `0` | N/A | `No` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This is a script-managed tracking field. Its value is automatically updated by the solution and should not be manually edited.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-times-prompted.toml)

## Changelog

### 2026-07-20

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
