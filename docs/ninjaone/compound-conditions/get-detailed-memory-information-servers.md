---
id: '62d1b964-0aca-4406-bfd7-c6f446418029'
slug: /62d1b964-0aca-4406-bfd7-c6f446418029
title: 'Get Detailed Memory Information - Workstations'
title_meta: 'Get Detailed Memory Information - Workstations'
keywords: ['memory', 'RAM', 'workstations', 'hardware inventory', 'NinjaOne']
description: 'Triggers Automation to collects detailed physical memory inventory information from Windows workstations and stores the summary and per-module details in NinjaOne custom fields.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

Triggers [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) Automation to collects detailed physical memory inventory information from Windows workstations and stores the summary and per-module details in NinjaOne custom fields.
:::

## Details

- **Name:** Get Detailed Memory Information - Workstations
- **Description:** Triggers [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) Automation to collects detailed physical memory inventory information from Windows workstations and stores the summary and per-module details in NinjaOne custom fields.
- **Recommended Agent Policies:** Windows workstation policy

## Dependencies

- [Solution: Get Detailed Memory Information](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)
- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Custom Field: cPVAL Get Memory Details](/docs/639be1ed-c056-4006-ba62-cf5083e39fd0)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/get-detailed-memory-information-servers.toml )

## Changelog

### 2026-10-23

- Initial version of the document
