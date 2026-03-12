---
id: '1d87004f-2ab3-4dd3-9f62-472172678982'
slug: /1d87004f-2ab3-4dd3-9f62-472172678982
title: 'cPVAL Secure Boot Status'
title_meta: 'cPVAL Secure Boot Status'
keywords: ['secure','secure-boot','audit']
description: 'This custom field shows whether Secure Boot is enabled on the device.'
tags: ['security','custom-fields','Secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This custom field shows whether Secure Boot is enabled or not on the device.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Secure Boot Status | cpvalSecureBootStatus | `Device` | `Text` | False | -- | `Editable` | `Read/Write` | `Read/Write` | This custom field shows whether Secure Boot is enabled on the device. | Displays if Secure Boot is currently active. | Required for compliance and device security posture. | SecureBoot Audit |

## Dependencies

[Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9)
[Solution - Secure Boot Compliance Audit](/docs/b037020a-1af5-4ecb-bb6b-62d59c123937)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-secure-boot-status.toml)

## Sample Screenshot

![cPVAl Secure Boot Status](../../../static/img/docs/1d87004f-2ab3-4dd3-9f62-472172678982/secureboot.webp)

## Changelog

Initial Version
