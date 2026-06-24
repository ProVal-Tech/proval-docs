---
id: '175e9426-65df-4a50-a0d6-e134fa9d9651'
slug: /175e9426-65df-4a50-a0d6-e134fa9d9651
title: 'cPVAL Enable Remote Tools Detection'
title_meta: 'cPVAL Enable Remote Tools Detection'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'Select the required platform to start detecting Unauthorized remote tools.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-24
---

## Summary

Select the required OS to start detecting Unauthorized remote tools. `With Ticketing` options will generate tickets if Unauthorized tools are detected.

## Details

| Label | Field Name | Definition Scope | Type | Available Options | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- |
|cPVAL Enable Remote Tools Detection|cpvalEnableRemoteToolsDetection|`Organization`, `Location`, `Device` | Drop-down | `Disable`, `Windows`, `Windows Workstations`, `Windows Servers`, `Windows (with Ticketing)`, `Windows Workstations (with Ticketing)`,`Windows Servers (with Ticketing)`| - | False | Editable | Read/Write | Read/Write |  Remote Access Tools |

## Dependencies

- [Solution - Installed Remote Access Tool Audit](/docs/eae2fab9-4697-4e1e-ad8f-93f8a09d7056)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-enable-remote-tools-detection.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/175e9426-65df-4a50-a0d6-e134fa9d9651/image1.webp)

## Changelog

### 2026-06-24

- Initial version of the document