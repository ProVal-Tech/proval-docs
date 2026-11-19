---
id: 'e29452fd-ef57-4a5d-9d40-8a79b95da4aa'
slug: /e29452fd-ef57-4a5d-9d40-8a79b95da4aa
title: 'Get Detailed Memory Information'
title_meta: 'Get Detailed Memory Information'
keywords: ['memory', 'ram', 'hardware', 'inventory', 'audit', 'ninjaone', 'wysiwyg', 'custom-field', 'windows']
description: 'This is used to trigger the script Get Detailed Memory Information on both servers and workstations.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-11-19
---

## Summary

 Executes the [Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) weekly on both servers and workstations to audit the detail.

## Dependencies

- [Automation - Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Solution - Get Detailed Memory Information - NinjaOne](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Get Detailed Memory Information| This is used to run the script Get Detailed Memory Information on both servers and workstations. | `Yes` | `Monthly` | `1` | `12/01/2026` | `Never` | `Windows Machines` | `Get Detailed Memory Information` |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/get-detailed-memory-information.toml)

## Changelog

### 2026-11-19

- Initial version of the document.