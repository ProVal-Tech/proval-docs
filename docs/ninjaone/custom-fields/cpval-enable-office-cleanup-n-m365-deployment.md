---
id: 'd39593cb-e6d1-4a2d-b2b0-6ef1e2148a15'
slug: /d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15
title: 'cPVAL Enable Office Cleanup and M365 Deployment'
title_meta: 'cPVAL Enable Office Cleanup and M365 Deployment'
keywords:  ["Microsoft", "Office", "C2R", '365', 'install', 'xml', 'configuration']
description: 'Custom field to enable/disable the office cleanup and M365 Deployment. '
tags: ['application', 'setup', 'software', 'windows','microsoft365','office','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-30-04
---

## Summary
Custom field to enable/disable the office cleanup and M365 Deployment. 

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Enable Office Cleanup and M365 Deployment | cpvalEnableOfficeCleanupAndM365Deployment | Device/Location/Organization | Drop Down | false | - | Editable | Read_Write | Read_Write | Select `Enable` to remove Microsoft Office versions and install Microsoft 365 on windows machines. Choose Disable to solution. Device > Location > Organization in precedence. | Select `Enable` to remove Microsoft Office versions and install Microsoft 365 on windows machines. Choose Disable to solution. Device > Location > Organization in precedence. | Select `Enable` to remove Microsoft Office versions and install Microsoft 365 on windows machines. Choose Disable to solution. Device > Location > Organization in precedence.| Microsoft 365 |

## Dependencies

- [Solution: Office Cleanup and M365 Deployment](/docs/f5efe485-4c55-4fe0-88db-05c06305b101)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-enable-office-cleanup-n-m365-deployment.toml)

## Sample Screenshot

![SampleScreenshot](../../../static/img/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15/image1.webp)

## Changelog

### 2026-30-04

- Initial version of the document