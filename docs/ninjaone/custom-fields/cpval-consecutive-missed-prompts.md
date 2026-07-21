---
id: 'e61fd6fa-cf42-4315-831f-d4a150bc53d6'
slug: /e61fd6fa-cf42-4315-831f-d4a150bc53d6
title: 'cPVAL Consecutive Missed Prompts'
title_meta: 'cPVAL Consecutive Missed Prompts'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt']
description: 'Counts consecutive detection cycles where a prompt was missed. Resets to 0 on success or reboot.'
tags: ['reboot', 'notifications', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This custom field is automatically managed by the Reboot Pending Prompt automation scripts to track the state of the reboot cycle.

Counts consecutive detection cycles where a prompt was missed. Resets to 0 on success or reboot.

It is not intended for manual configuration.

**Configuration Hierarchy (Highest to Lowest Priority):**

1. **Device Level** (Automatically managed by the automation script)

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Consecutive Missed Prompts` | `cpvalConsecutiveMissedPrompts` | `2` | `Device` | `Numeric` | `False` | `0` | N/A | `No` | <ul><li>**Device:**</li><ul><li>**Windows Desktops and Laptops:** `Reboot Pending Prompt - Workstations`</li><li>**Mac Desktops and Laptops:** `Reboot Pending Prompt - Mac`</li></ul></ul> |

>**💡 Note on Default Behavior:** This is a script-managed tracking field. Its value is automatically updated by the solution and should not be manually edited.

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-consecutive-missed-prompts.toml)

## Changelog

### 2026-07-20

- Added support for macOS devices

### 2025-12-19

- Initial version of the document
