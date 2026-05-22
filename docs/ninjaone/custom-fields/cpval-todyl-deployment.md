---
id: '7f24e5c5-4609-4f82-a932-5e34f63b6cc3'
slug: /7f24e5c5-4609-4f82-a932-5e34f63b6cc3
title: 'cPVAL Todyl Deployment'
title_meta: 'cPVAL Todyl Deployment'
keywords: ['todyl','agent','windows','deployment']
description: 'Custom Field for install/unintall todyl solution. '
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-20
---

## Summary
Custom Field to install/unintall todyl solution. Select OS to enable auto-deployment of Todyl SGN Connect agent. Select Uninstall to uninstall Todyl if its already installed on the machines.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Todyl Deployment | cpvalTodylDeployment | Organization/Location/Device | drop-down | `Disabled`, `Windows`, `Windows Servers`, `Windows Workstations`, `Uninstall` | `Disabled` | Editable | Read/Write| Read/Write | Select OS to enable auto-deployment of Todyl SGN Connect agent. Select Uninstall to uninstall Todyl if its already installed on the machines.| Select OS to enable auto-deployment of Todyl SGN Connect agent. Select Uninstall to uninstall Todyl if its already installed on the machines. | Select OS to enable auto-deployment of Todyl SGN Connect agent. Select Uninstall to uninstall Todyl if its already installed on the machines. | Todyl Deployment. |

## Dependencies

- [Solution: Todyl Agent Manager](/docs/01e0e3c8-adc5-4035-84d5-9266e5af0760)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-todyl-deployment.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3/image1.webp)

## Changelog

### 2026-05-20

- Initial version of the document

