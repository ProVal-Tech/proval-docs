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
This custom field is used to exclude the device from the Remote Desktop Protocol (RDP) access check. Set this value `Excluded` when the RDP status validation should be skipped for a specific device.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Exclude RDP Access Check | cpvalExcludeRdpAccessCheck | `Device` | Text | false | -- |  Editable | `Read/Write` | `Read/Write` | Controls whether the device should be excluded from the RDP access check. Use this field to bypass RDP status validation for selected devices. | This is used to exclude any machine from RDP check Enabled | This is used to exclude any machine from RDP check Enabled | RDP Check |

## Dependencies

- [Automation - RDP Access Check](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) 

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/rdp-access-check-servers.toml)


## Sample Screenshot

![ cPVAL Exclude RDP Access Check ](../../../static/img/docs/98bae338-07b5-482a-81e1-1b19582122c8/rdp-cf.webp)

## Changelog

### 2026-07-20

- Initial version of the document
