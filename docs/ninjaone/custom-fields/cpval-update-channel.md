---
id: '203a58a8-4041-4d8a-bbfc-c7f0f6b3531f'
slug: /203a58a8-4041-4d8a-bbfc-c7f0f6b3531f
title: 'cPVAL Update Channel'
title_meta: 'cPVAL Update Channel'
keywords: ['microsoft','update','channel','registry','custom','field']
description: 'Select Channel Type from the drop-down menu for that particular computer.'
tags: ['registry','update','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-05-08
---

## Summary

Select the `Update Channel` from the drop-down menu to set for the computer. Available options are: 
- Current Channel
- Monthly Enterprise Channel
- Semi-Annual Enterprise Channel
- Beta Channel
- None

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Update Channel | cpvalEndpointUpdateChannel | Organization/Device/Location | Drop-down | False | | `Editable` | `Read/Write` | `Read/Write`| Select the Update Channel from the drop-down menu to set for the computer. Available options are: Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, Beta Channel, None. | Select Channel Type from the drop-down menu. | Select Channel Type from the drop-down menu. | Set Update Channel |

## Dependencies

- [Solution - Microsoft 365 - Click-to-Run - Set Update Channel](/docs/2b379cba-388e-4980-834b-f7f6654efe3b)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/microsoft-365-click-to-run-set-update-channel.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/203a58a8-4041-4d8a-bbfc-c7f0f6b3531f/update%20channel.webp)

## Changelog

### 2026-05-08

- Initial version of the document
