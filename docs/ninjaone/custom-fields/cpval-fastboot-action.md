---
id: 'b9461be5-6fe8-4ce9-900f-4aa929fe2d78'
slug: /b9461be5-6fe8-4ce9-900f-4aa929fe2d78
title: 'cPVAL FastBoot Action'
title_meta: 'cPVAL FastBoot Action'
keywords: ['fastboot', 'fast-startup', 'device-standard']
description: 'This Custom Fields Controls the Configuration of Fastboot on the machine. This field works only when cPVAL FastBoot Config Deployment is set to a valid option.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Summary

This Custom Fields Controls the Configuration of Fastboot on the machine. This field works only when cPVAL FastBoot Config Deployment is set to a valid option.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- |
| cPVAL FastBoot Action | cpvalFastbootAction | `Organization`, `Location`, `Device` | Drop-down | False | | `Enable Fast Boot and Hibernation`, `Disable Fast Boot`, `Disable Fast Boot and Hibernation` | Editable | Read_Write | Read_Write | Select how Fast Boot and Hibernation should be configured on this device. These settings control whether the system uses hibernation-based startup optimization and whether hibernation remains available to the user. | Choose whether to enable or disable Fast Boot and Hibernation features. | Choose whether to enable or disable Fast Boot and Hibernation features. | Device Standards |

## Dependencies
- [Automation - Get Fast Boot and Hibernation Status](/docs/9dc318fa-ce35-47ae-9442-f867208cde93)
- [Automation - Enable or Disable Fast Boot [PVAL]](/docs/9aa78588-bc01-4aab-95bd-29b5640975a2)
- [Custom Field - cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012)
- [Compound Condition - FastBoot Config Windows Workstations](/docs/3ac6bda9-175b-4585-b252-b7456a440cdd)
- [Compound Condition - FastBoot Config Windows Server](/docs/95088908-fbea-4007-8914-f5b49d797dfe)
- [Solution - Enable or Disable FastBoot](/docs/0d0fda4d-0f91-4093-bb04-025117299d28)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-fastboot-action.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/9850d788-d044-4faa-b709-953b6e01a012/image1.webp)
