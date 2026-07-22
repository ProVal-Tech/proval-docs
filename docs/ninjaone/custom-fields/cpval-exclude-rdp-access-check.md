---
id: '98bae338-07b5-482a-81e1-1b19582122c8'
slug: /98bae338-07b5-482a-81e1-1b19582122c8
title: 'cPVAL Exclude RDP Access Check'
title_meta: 'cPVAL Exclude RDP Access Check'
keywords: ['rdp', 'remote-desktop', 'security', 'disable']
description: 'This custom field is used to exclude the device from the Remote Desktop Protocol (RDP) access check. Set this value `Excluded` when the RDP status validation should be skipped for a specific device.'
tags: ['windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary
This custom field is used to exclude the device from the Remote Desktop Protocol (RDP) access check. Set this value `Excluded` when the RDP status validation should be skipped for a specific device or location.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Exclude RDP Access Check | cpvalExcludeRdpAccessCheck | `Device`, `Location` | Text | false | -- |  Editable | `Read/Write` | `Read/Write` | Controls whether the device should be excluded from the RDP access check. Use this field to bypass RDP status validation for selected devices. | This is used to exclude any machine from RDP check Enabled | This is used to exclude any machine from RDP check Enabled | RDP Check |

## Dependencies

- [Solution - RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8) 
- [Compound Conditions - RDP Access Check - servers](/docs/36261bfe-2318-45de-bc24-ffd62a2422a4)
- [Compound Conditions - RDP Access Check - Workstations](/docs/f7b08fe4-9eb4-4716-a9ea-84bedfa2f838)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-exclude-rdp-access-check.toml)


## Sample Screenshot

![ cPVAL Exclude RDP Access Check ](../../../static/img/docs/98bae338-07b5-482a-81e1-1b19582122c8/exclude-rdp.webp)

## Changelog

### 2026-07-20

- Initial version of the document
