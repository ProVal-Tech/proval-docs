---
id: '0cb57dd0-6349-4544-a146-f822e6dccceb'
slug: /0cb57dd0-6349-4544-a146-f822e6dccceb
title: 'cPVAL DeferFeatureUpdatesPeriodInDays'
title_meta: 'cPVAL DeferFeatureUpdatesPeriodInDays'
keywords: ['registry','feature','check','deferral','updates']
description: 'Specifies the number of days to defer Windows feature updates. Accepts values between 0 and 365 days.'
tags: ['updates','registry','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-03-06
---

## Summary

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL DeferFeatureUpdatesPeriodInDays | cpvalDeferfeatureupdatesperiodindays | `Device`, `Location`, `Organization` | `Integer` | false | -- | Editable | Read/Write | Read/Write | Specifies the number of days to defer Windows feature updates. Accepts values between 0 and 365 days. | Enter a value between 0 and 365. Setting 0 means no deferral. Any value above 0 delays feature updates by the specified number of days after release. | Enter a value between 0 and 365. Setting 0 means no deferral. Any value above 0 delays feature updates by the specified number of days after release. | Device Standards |

## Dependencies

- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)
- [Solution: Update Windows Deferral Settings](/docs/56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1)
- [Automation: update windows deferral settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-defer-feature-updates-period-in-days.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/0cb57dd0-6349-4544-a146-f822e6dccceb/deferdays.webp)

## Changelog

### 2026-03-06

- Initial version of the document
