---
id: '8d3fbb67-9f18-426e-b08d-c010d655a94a'
slug: /8d3fbb67-9f18-426e-b08d-c010d655a94a
title: 'cPVAL Autopilot Hash'
title_meta: 'cPVAL Autopilot Hash'
keywords: ['autopilot','custom-fields','auditing']
description: 'This field stores the Windows Autopilot hardware hash value.'
tags: ['autopilot','custom-fields','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-02-24
---

## Summary

This custom field is used to store the Windows Autopilot hardware hash value. This data is retreived by the automation [Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5).

## Details

| Label                | Field Name         | Definition Scope | Type        | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description                                                                                | Tool Tip                                                                          | Footer Text                                                    | Custom Field Tab Name |
| -------------------- | ------------------ | ---------------- | ----------- | -------- | ------------- | --------------------- | --------------------- | -------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------- | -------------------------------------------------------------- | --------------------- |
| cPVAL Autopilot Hash | cpvalAutopilotHash | `Device`         | `Multiline` | Yes      | —             | Editable              | Read/Write            | Read/Write     | Stores the Windows Autopilot hardware hash value for device registration and provisioning. | Used to store the Windows Autopilot hardware hash required for device enrollment. | This field contains the Windows Autopilot hardware hash value. | `Autopilot Hash`      |

## Dependencies

- [Automation - Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5)
- [Solution - Get - AutoPilot Hash - NinjaOne](/docs/d5b749b5-eda4-43d2-8679-eb88f51a3527)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-autopilot-hash.toml)

## Sample Screenshot

![Home Edition Status](../../../static/img/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a/autopilot-hash-cf.webp)

## Changelog

### 2026-02-20

- Initial version of the document
