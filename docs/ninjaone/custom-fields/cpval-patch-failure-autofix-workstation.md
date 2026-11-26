---
id: '04f87a60-2857-4253-bca8-f4addd2f71fe'
slug: /04f87a60-2857-4253-bca8-f4addd2f71fe
title: 'cPVAL Patch Failure Autofix Workstation'
title_meta: 'cPVAL Patch Failure Autofix Workstation'
keywords: ['patching', 'patch-failure', 'autofix', 'repair-windows-update', 'workstation']
description: 'Sets the number of consecutive failed patch windows at which workstations get the Repair Windows Update autofix.'
tags: ['custom-fields', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Sets the number of consecutive failed patch windows at which workstations get [Repair Windows Update](/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887) automatically. When [cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c) reaches this number, the [Patch Failure Monitoring - Autofix [Windows Workstations]](/docs/6da0c83e-d6bd-4b4a-985b-6b7b6b2d7774) compound condition runs the repair once per failed patch window, until the count reaches the ticket threshold in [cPVAL Patch Failure Ticket Workstation](/docs/4e93e558-3a43-4d58-b60b-e6391fb79e46).

| Value | Result |
| ----- | ------ |
| Blank | Inherits from the level above. Blank at every level means no repair. |
| `0` | No repair at this level, even if a level above sets a threshold. |
| `1` or more | The repair runs once the count reaches this number. For example, `1` repairs the device after its first failed patch window. |

:::note

- The field applies to workstations only and is ignored on servers.
- The repair runs [Repair Windows Update](/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887) with no options. It resets the Windows Update components and scans for updates again, without SFC, DISM or a restart.
- A change takes effect at the next check of the autofix compound condition, within an hour.

:::

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Patch Failure Autofix Workstation | cpvalPatchFailureAutofixWorkstation | `1` | `System`, `Organization`, `Location`, `Device` | Integer | No | |  | Yes | <ul><li>`Patch Failure Monitoring` (System)</li><li>`Patch Failure Monitoring` (Organization and Location)</li><li>`Patch Failure Monitoring - Workstations`</li></ul> |

## Dependencies

- [Automation: Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18)
- [Automation: Repair Windows Update](/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887)
- [Compound Condition: Patch Failure Monitoring - Autofix [Windows Workstations]](/docs/6da0c83e-d6bd-4b4a-985b-6b7b6b2d7774)
- [Custom Field: cPVAL Patch Failure Ticket Workstation](/docs/4e93e558-3a43-4d58-b60b-e6391fb79e46)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-patch-failure-autofix-workstation.toml)

## Sample Screenshot

![cPVAL Patch Failure Autofix Workstation](../../../static/img/docs/04f87a60-2857-4253-bca8-f4addd2f71fe/image1.webp)

## Changelog

### 2026-11-23

- Initial version of the document
