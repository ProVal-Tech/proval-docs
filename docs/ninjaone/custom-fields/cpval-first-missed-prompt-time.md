---
id: 'd6add994-9648-4f4c-9888-b2c8416b0c9a'
slug: /d6add994-9648-4f4c-9888-b2c8416b0c9a
title: 'cPVAL First Missed Prompt Time'
title_meta: 'cPVAL First Missed Prompt Time'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Records the exact date/time the machine first missed a reboot prompt due to a locked screen or no logged-in user.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-13
---

## Summary

This custom field is automatically managed by the Reboot Pending Prompt automation scripts to track the state of the reboot cycle.

Records the exact date/time the machine first missed a reboot prompt due to a locked screen or no logged-in user.

It is not intended for manual configuration.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Automatically managed by the automation script)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL First Missed Prompt Time` | `cpvalFirstMissedPromptTime` | `2024-05-20 14:30:00` | `Device` | `Text` | `False` | `` | N/A | `No` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This is a script-managed tracking field. Its value is automatically updated by the solution and should not be manually edited.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-first-missed-prompt-time.toml)

## Changelog

### 2026-07-13

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
