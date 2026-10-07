---
id: '76daa3ea-f62f-44bf-948b-4ad02a33270f'
slug: /76daa3ea-f62f-44bf-948b-4ad02a33270f
title: 'cPVAL Disable RDP Service'
title_meta: 'cPVAL Disable RDP Service'
keywords: ['rdp', 'windows','disable']
description: 'Custom Field to choose the operating system to disable the Remote Desktop Protocol Service.'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary

Custom Field to choose the operating system to disable the Remote Desktop Protocol Service.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Options | Technician Permission | Automation Permission | API Permission |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | ------------- | --------------------- | --------------------- | -------------- | ----------- |
| cPVAL Disable RDP Service | cpvalDisableRdpService | `Organization`, `Location`, `Device` | Drop-down | False | | <ul><li>Disable</li><li>Windows Workstations</li><li>Windows Servers</li><li>Windows</li></ul> | Editable | Read_Write | Read_Write | Windows Services |

## Dependencies

- [Solution - Disable RDP Service](/docs/4e49b064-d81d-47ac-8711-78261a494f5b)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-disable-rdp-service.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f/image1.webp)

## Changelog

### 2026-10-07

- Initial version of the document
