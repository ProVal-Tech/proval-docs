---
id: 'd131c730-502b-4f00-8461-ecef6766c161'
slug: /d131c730-502b-4f00-8461-ecef6766c161
title: 'cPVAL Windows KEK Certificate'
title_meta: 'cPVAL Windows KEK Certificate'
keywords: ['secure','secure-boot','audit']
description: 'This custom field displays the status of the Windows Key Exchange Key (KEK) certificate.'
tags: ['security','custom-fields','secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This custom field displays the status of the Windows Key Exchange Key (KEK) certificate.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cpvalWindowsKekCertificate | cPVAL Windows KEK Certificate | `Device` | `Text` | False | -- | `Editable` | `Read/Write` | `Read/Write` | This custom field displays the status of the Windows Key Exchange Key (KEK) certificate. | Shows whether the KEK certificate is installed and valid for secure boot updates. | Important for secure boot updates and key management. | SecureBoot Audit |

## Dependencies

[Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9)
[Solution - Secure Boot Compliance Audit](/docs/b037020a-1af5-4ecb-bb6b-62d59c123937)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-kek-certificate.toml)

## Sample Screenshot

![cPVAl Secure Boot Status](../../../static/img/docs/d131c730-502b-4f00-8461-ecef6766c161/kek.webp)

## Changelog

s
