---
id: '29e44495-0c4b-425c-bb1f-118dab2633e2'
slug: /29e44495-0c4b-425c-bb1f-118dab2633e2
title: 'cPVAL Feature Update Configuration'
title_meta: 'cPVAL Feature Update Configuration'
keywords: ['registry','feature','check','deferral']
description: 'This Custom Fields Controls the Configuration of Feature update deferral on the machine based on the selected operating system. Choose Disabled to skip applying this setting to the current Client, Location, or Computer.'
tags: ['updates','registry','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-03-06
---

## Summary

This Custom Fields Controls the Configuration of Feature update deferral on the machine based on the selected operating system. Choose `Disabled` to skip applying this setting to the current Client, Location, or Computer.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Feature Update Configuration | cpvalFeatureUpdateConfiguration | `Device`, `Location`, `Organization` | `DropDown` | false | `Disabled`, `Windows`, `Windows Servers`, `Windows Workstations` | Editable | Read/Write | Read/Write | This Custom Fields Controls the Configuration of Feature update deferral on the machine based on the selected operating system. Choose Disabled to skip applying this setting to the current Client, Location, or Computer. | Use this dropdown to specify the OS where Deferral setting Should be configured. Selecting Disabled will retain the current settings for the selected entity. | This setting controls whether Dererral update setting is configured based on the selected operating system. Choose Disabled to skip applying this setting to the current Client, Location, or Computer. | Device Standards |

## Dependencies

- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)
- [Solution: Update Windows Deferral Settings](/docs/56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1)


## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-feature-update-configuration.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/29e44495-0c4b-425c-bb1f-118dab2633e2/configuration.webp)

## Changelog

### 2026-03-06

- Initial version of the document
