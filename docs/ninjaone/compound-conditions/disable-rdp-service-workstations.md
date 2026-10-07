---
id: '7a05c718-053d-4823-8fcc-b3f44dd2c8f1'
slug: /7a05c718-053d-4823-8fcc-b3f44dd2c8f1
title: 'Disable RDP Service - Workstations'
title_meta: 'Disable RDP Service - Workstations'
keywords: ['rdp', 'windows','disable']
description: 'Triggers Disable Remote Desktop Protocol Service automation on Windows workstations where service disablement is enabled through the cPVAL Disable RDP Service Custom Field'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary

Triggers the [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062) on Windows workstations where service disablement is enabled through the [Custom Field - cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f).

## Details

- **Name:** `Disable RDP Service - Workstations`
- **Description:** `Triggers 'Disable Remote Desktop Protocol Service' automation on Windows workstations where service disablement is enabled through the 'cPVAL Disable RDP Service' Custom Field`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Disable RDP Service](/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f)
- [Automation - Disable Remote Desktop Protocol Service](/docs/09494701-2d52-4b62-87d7-d9fb02035062)
- [Solution - Disable RDP Service](/docs/4e49b064-d81d-47ac-8711-78261a494f5b)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-rdp-service-workstations.toml)

## Changelog

### 2026-10-07

- Initial version of the document
