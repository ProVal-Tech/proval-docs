---
id: '03640b47-4b59-4f8e-b8cf-dc20841345ba'
slug: /03640b47-4b59-4f8e-b8cf-dc20841345ba
title: 'cPVAL Office Install Type'
title_meta: 'cPVAL Office Install Type'
keywords: ['microsoft','365','office']
description: 'Identifies whether Microsoft Office is a Full suite installation, Language Pack only, or a Partial installation showing individual Office applications detected on the device.'
tags: ['office365', 'software', 'update' , 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-05-21
---

## Summary

Identifies whether Microsoft Office is a Full suite installation, Language Pack only, or a Partial installation showing individual Office applications detected on the device.


## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Office Install Type | cpvalOfficeInstallType | Device | Text | False |  | Editable | Read_Write | Read_Write | Identifies whether Microsoft Office is a Full suite installation, Language Pack only, or a Partial installation showing individual Office applications detected on the device. | Displays the detected Office installation type, such as Full, Language Pack, or Partial (with installed applications listed) | Used to understand Office deployment completeness and identify missing or non-standard Office components. | Office Version |

## Dependencies

- [Solution - Get Office Version](/docs/19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04) 
- [Script - Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) 

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-office-install-type.toml)

## Sample Screenshot
![image](../../../static/img/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba/type.webp)

## Changelog

### 2026-05-21

- Initial version of the document
