---
id: 'b4d0f4a1-7891-4315-875e-01fc96b17d59'
slug: /b4d0f4a1-7891-4315-875e-01fc96b17d59
title: 'cPVAL ESU Status'
title_meta: 'cPVAL ESU Status'
keywords: ['ESU', 'License', 'Extended', 'Windows 10']
description: 'These custom fields built to store the ESU licensing and auditing status at different levels'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

These custom fields are built to store the ESU licensing and auditing status at different levels.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
|cPVAL ESU Status| cpvalEsuStatus| Device | Text | No | |Read Only | Read_Write | Read_Write |This custom field stores the endpoint's ESU status | Windows 10 ESU Active License Status| |
|cPVAL ESU Key| cpvalEsuKey| Device/Organization/Location | Text | No | |Editable | Read_Write | Read_Write |Provide the ESU license key for activation of Windows 10 extended use | | |
|cPVAL ESU Year| cpvalEsuYear| Device/Organization/Location | Drop-Down | No | |Editable | Read_Write | Read_Write |Select the license key year validation from 1, 2, or 3 options | | |

## Dependencies

[Solution - Ninja Win10 ESU Licensing and Auditing](/docs/f1ae37d6-7fa7-414c-8550-1ae9ea11b987)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-esu-status.toml)
