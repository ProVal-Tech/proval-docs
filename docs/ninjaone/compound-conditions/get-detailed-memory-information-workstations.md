---
id: '3e5b56c4-7ac8-48ef-8332-ce6c683ff492'
slug: /3e5b56c4-7ac8-48ef-8332-ce6c683ff492
title: 'Get Detailed Memory Information - Servers'
title_meta: 'Get Detailed Memory Information - Servers'
keywords: ['memory', 'RAM', 'servers', 'hardware inventory', 'NinjaOne']
description: 'Triggers Automation to collects detailed physical memory inventory information from Windows workstations and stores the summary and per-module details in NinjaOne custom fields.'
tags: ['NinjaOne', 'Servers', 'Hardware Inventory']
draft: true
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

Triggers [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) Automation to collects detailed physical memory inventory information from Windows workstations and stores the summary and per-module details in NinjaOne custom fields.

## Details

- **Name:** Get Detailed Memory Information - Servers
- **Description:** Collects detailed physical memory inventory information from Windows servers and stores the summary and per-module details in NinjaOne custom fields.
- **Recommended Agent Policies:** Windows Server policy

## Dependencies

- [Solution: Get Detailed Memory Information](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)
- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Custom Field: cPVAL Get Memory Details](/docs/639be1ed-c056-4006-ba62-cf5083e39fd0)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/get-detailed-memory-information-workstations.toml)

## Changelog

### 2026-10-23

- Initial version of the document
