---
id: 'e54c319a-a8e9-4d58-9a67-6c310289320f'
slug: /e54c319a-a8e9-4d58-9a67-6c310289320f
title: 'cPVAL ESU Year'
title_meta: 'cPVAL ESU Year'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'Stores the ESU license key for activation of Windows 10 extended use.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

To store the ESU license key year validation from the available option. The number stored in this Custom Field is used by the [Windows 10 ESU License Upgrade](/docs/ba4df182-e419-4377-819f-ef55c34b0380) task if the runtime variable `ESU Year` is not set.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
|cPVAL ESU Year| cpvalEsuYear| Device/Organization/Location | Drop-Down | No | |Editable | Read_Write | Read_Write | Select the license key year validation from options 1, 2, or 3. | Select the license key year validation from options 1, 2, or 3. | Select the license key year validation from options 1, 2, or 3. | ESU |

## Dependencies

- [Solution - Ninja Win10 ESU Licensing and Auditing](/docs/f1ae37d6-7fa7-414c-8550-1ae9ea11b987)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-esu-year.toml)

## Sample Screenshot

![Sample](../../../static/img/docs/2731179e-384e-4fda-907a-365368ebf742/image7.webp)
