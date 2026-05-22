---
id: '4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3'
slug: /4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3
title: 'cPVAL Zorus Deployment'
title_meta: 'cPVAL Zorus Deployment'
keywords: ['zorus','agent','windows','deployment']
description: 'Custom Field to install/uninstall Zorus Agent.'
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-21
---

## Summary

Custom Field to install/uninstall Zorus Agent. Select OS to enable auto-deployment of Zorus agent. Select `Uninstall` to uninstall Zorus if it is already installed on the machines.

## Details

| Label | Field Name | Definition Scope | Type | Required | Dropdown options |Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- |-----| --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
|cPVAL Zorus Deployment|cpvalZorusDeployment| Organization/Location/Device | drop-down | True(For Auto Deployment or Removal) | `Disabled`, `Windows`, `Windows Servers`, `Windows Workstations`, `Uninstall` | `Disabled` | Editable | Read/Write| Read/Write | Select OS to enable auto-deployment of Zorus agent. Select Uninstall to uninstall Zorus if its already installed on the machines.|Select OS to enable auto-deployment of Zorus agent. Select 'Uninstall' to uninstall Zorus if its already installed on the machines.|Select OS to enable auto-deployment of Zorus agent. Select 'Uninstall' to uninstall Zorus if its already installed on the machines.| Zorus Deployment |

## Dependencies

- [Solution: Zorus Agent Manager](/docs/3b1dee7b-3bbb-4122-b33c-da6caa2a2d56)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-zorus-deployment.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3/image1.webp)

## Changelog

### 2026-05-21

- Initial version of the document