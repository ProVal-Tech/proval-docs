---
id: '003a7133-7521-4490-a403-a12e143dc4e3'
slug: /003a7133-7521-4490-a403-a12e143dc4e3
title: 'Enable WSL Uninstallation'
title_meta: 'Enable WSL Uninstallation'
keywords: ['vulnerability', 'cve', 'wsl']
description: 'Custom field to select the target windows operating system for WSL Uninstallation'
tags: ['vulnerability', 'cve']
draft: false
unlisted: false
last_update:
  date: 2026-09-16
---

## Summary

Custom field to select the target windows operating system for WSL Uninstallation.

## Dependencies

- [Solution - CVE-2025-24084 - WSL Uninstall](/docs/cc418b50-c30e-4319-950e-ffa6347dd74e)  

## Details

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| Enable WSL Uninstallation | Custom field to select the target windows operating system for WSL Uninstallation. |  Company | Dropdown | String | `Disabled`, `All`, `Workstations`, `Servers` | Select the windows operating system for WSL Uninstallation.<br /> Disabled : Select disable to disable the solution on client machines.<br /> All : Uninstalls WSL on both windows servers and workstations machines.<br />Workstations : Select uninstallation on just windows workstations.<br /> Servers : Select uninstallation on just windows servers. | - | `Yes` |

## Completed Custom Field

![Image](../../../static/img/docs/003a7133-7521-4490-a403-a12e143dc4e3/image1.webp)

## Changelog

### 2026-09-16

- Initial version of the document
