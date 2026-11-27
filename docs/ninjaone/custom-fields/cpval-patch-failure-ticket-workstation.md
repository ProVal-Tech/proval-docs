---
id: '4e93e558-3a43-4d58-b60b-e6391fb79e46'
slug: /4e93e558-3a43-4d58-b60b-e6391fb79e46
title: 'cPVAL Patch Failure Ticket Workstation'
title_meta: 'cPVAL Patch Failure Ticket Workstation'
keywords: ['patching', 'patch-failure', 'ticket', 'connectwise-manage', 'workstation']
description: 'Sets the number of consecutive failed patch windows at which a ConnectWise Manage ticket is created for workstations.'
tags: ['custom-fields', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Sets the number of consecutive failed patch windows at which a ConnectWise Manage ticket is created for workstations. When [cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c) reaches this number, the [Patch Failure Monitoring - Ticket [Windows Workstations]](/docs/d4488df1-2292-4886-ab7a-46207ec6f856) compound condition creates a ticket with the [Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14) template, listing the failed patch windows and updates and when the repair ran.

| Value | Result |
| ----- | ------ |
| Blank | Inherits from the level above. Blank at every level means no ticket. |
| `0` | No ticket at this level, even if a level above sets a threshold. |
| `1` or more | A ticket is created once the count reaches this number. |

Keep the value above the autofix threshold in [cPVAL Patch Failure Autofix Workstation](/docs/04f87a60-2857-4253-bca8-f4addd2f71fe). A value equal to or lower than the autofix threshold is treated as the autofix threshold + 1, so the repair always runs first. For example, an autofix threshold of `2` with a ticket threshold of `1` creates the ticket at `3`. To get a ticket without the repair, set the autofix threshold to `0`.

:::note

- The field applies to workstations only and is ignored on servers.
- The ticket closes when a successful patch window resets the count.
- A change takes effect at the next check of the ticket compound condition, within an hour.

:::

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Patch Failure Ticket Workstation | cpvalPatchFailureTicketWorkstation | `2` | `System`, `Organization`, `Location`, `Device` | Integer | No | |  | Yes | <ul><li>`Patch Failure Monitoring` (System)</li><li>`Patch Failure Monitoring` (Organization and Location)</li><li>`Patch Failure Monitoring - Workstations`</li></ul> |

## Dependencies

- [Automation: Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18)
- [Compound Condition: Patch Failure Monitoring - Ticket [Windows Workstations]](/docs/d4488df1-2292-4886-ab7a-46207ec6f856)
- [Ticket Template: Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14)
- [Custom Field: cPVAL Patch Failure Autofix Workstation](/docs/04f87a60-2857-4253-bca8-f4addd2f71fe)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-patch-failure-ticket-workstation.toml)

## Sample Screenshot

![cPVAL Patch Failure Ticket Workstation](../../../static/img/docs/4e93e558-3a43-4d58-b60b-e6391fb79e46/image1.webp)

## Changelog

### 2026-11-23

- Initial version of the document
