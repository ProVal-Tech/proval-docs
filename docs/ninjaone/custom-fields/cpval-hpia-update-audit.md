---
id: 'd13a9112-7ddc-4808-926d-4f24c44b7f42'
slug: /d13a9112-7ddc-4808-926d-4f24c44b7f42
title: 'cPVAL HPIA Update Audit'
title_meta: 'cPVAL HPIA Update Audit'
keywords: ['hp','hpia','hp-image-assistant','image-assistant','drivers','firmware','driver-updates','bios']
description: 'Custom Field to enable automatic deployment of the HP Image Assistant scanning on HP Windows machines.'
tags: ['hp','firmware','bios','drivers']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Summary
Custom Field to enable automatic deployment of the HP Image Assistant scanning on HP Windows machines.

## Details

| Label | Field Name | Definition Scope | Type |Option Value | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----- | ---- |
|cPVAL HPIA Update Audit|cpvalHpiaUpdateAudit|Organization/Location/Computer|Drop-Down| `Enable`, `Disable` | True | - | Editable | Read/Write | Read/Write | Custom Field is required to be selected for the automated deployment of the HP Image Assistant scanning on the HP Windows machines. | Custom Field is required to be selected for the automated deployment of the HP Image Assistant scanning on the HP Windows machines.| HP Image Assistant | HP Image Assistant |

## Dependencies

- [Solution - HP Image Assistant](/docs/4c4053fb-301c-4c77-8e7f-97ed2f00b391)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-hpia-update-audit.toml)

## Sample Screenshot

![Image](../../../static/img/docs/d13a9112-7ddc-4808-926d-4f24c44b7f42/image1.webp)

## Changelog

### 2026-06-03

- Initial version of the document
