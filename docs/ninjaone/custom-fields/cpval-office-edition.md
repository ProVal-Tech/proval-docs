---
id: '4fad4211-7766-4d7a-af20-8d00123d2fa1'
slug: /4fad4211-7766-4d7a-af20-8d00123d2fa1
title: 'cPVAL Office Edition'
title_meta: 'cPVAL Office Edition'
keywords: ['microsoft','365','edition','office']
description: 'Office version installed on the machine fetched by `Get Office Version` script.'
tags: ['office365', 'software', 'update', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Summary

Stores the Office Edition on the machine fetched by [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) script.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Office Edition | cpvalOfficeedition | Device | Text | False |  | Editable | Read_Write | Read_Write | Office version detected on the device using the `Get Office Bitness` script. | Office version detected using the `Get Office Bitness` script. | Office version detected on the device using the `Get Office Bitness` script. | Office Version |

## Dependencies
- [Solution - Get Office Version](/docs/19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04) 
- [Script - Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) 

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-office-edition.toml)

## Sample Screenshot
![image](../../../static/img/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1/edition.webp)

## Changelog

### 2026-05-12

- Initial version of the document
