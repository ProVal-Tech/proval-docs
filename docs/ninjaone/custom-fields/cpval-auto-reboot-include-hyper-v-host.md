---
id: 'e351778e-b498-48ba-a674-7e8f4d783b15'
slug: /e351778e-b498-48ba-a674-7e8f4d783b15
title: 'cPVAL Auto Reboot Include Hyper-V Host'
title_meta: 'cPVAL Auto Reboot Include Hyper-V Host'
keywords: ['reboot', 'hyper-v', 'auto-reboot', 'server', 'host']
description: 'Includes Hyper-V hosts in the Auto Reboot Management schedule. Hyper-V hosts are excluded by default to protect running virtual machines.'
tags: ['custom-fields', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

Includes Hyper-V hosts in the [Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7) schedule. Hyper-V hosts are excluded by default, because restarting a host also stops every virtual machine running on it.

- `Enabled` restarts Hyper-V hosts on the server schedule.
- `Disabled`, or a blank value at every level, keeps them excluded. Set `Disabled` at a lower level to exclude them again.

Hyper-V hosts are detected by the Hyper-V Virtual Machine Management (`vmms`) service. The field applies to servers only.

:::note

- Set the field at the organization level for a whole client, and override it at a location or on a device where needed. The most specific value wins.
- A blank value inherits from the level above.
- A change takes effect at the next run of the [Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b) automation, within an hour.

:::

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Auto Reboot Include Hyper-V Host | cpvalAutoRebootIncludeHyperVHost | `Enabled` | `Organization`, `Location`, `Device` | Drop-down | No | | `Enabled`, `Disabled` | Yes | <ul><li>`Auto Reboot Management` (Organization and Location)</li><li>`Auto Reboot Management - Servers`</li></ul> |

## Dependencies

- [Automation: Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b)
- [Custom Field: cPVAL Auto Reboot](/docs/cab41cb1-87d8-4d37-bbe2-3faa67516831)
- [Solution: Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-auto-reboot-include-hyper-v-host.toml)

## Sample Screenshot

![cPVAL Auto Reboot Include Hyper-V Host](../../../static/img/docs/e351778e-b498-48ba-a674-7e8f4d783b15/image1.webp)

## Changelog

### 2026-11-11

- Initial version of the document
