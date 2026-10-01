---
id: 'd63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750'
slug: /d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750
title: 'cPVAL Enable Browser Manage'
title_meta: 'cPVAL Enable Browser Manage'
keywords: ['homepage', 'browsers', 'configuration', 'set', 'remove', 'replace']
description: 'Custom Field to select the operating system to manage the Browser homepage for the machines.'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-10-01
---

## Summary
Custom Field to select the operating system to manage the Browser homepage for the machines.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Options | Technician Permission | Automation Permission | API Permission | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | ------------- | --------------------- | --------------------- | -------------- | ----------- |
| cPVAL Enable Browser Manage | cpvalEnableBrowserManage | `Organization`, `Location`, `Device` | Drop-down | False | | <ul><li>Disabled</li><li>Windows Workstations</li><li>Windows Server</li><li>Windows</li></ul> | Editable | Read_Write | Read_Write | Manage Browser HomePage |

## Dependencies

- [Solution - Browser - HomePage - Manage](/docs/3197b1ea-9250-4373-9d21-6124a0b72ec6)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-enable-browser-manage.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750/image1.webp)

## Changelog

### 2026-10-01

- Initial version of the document
