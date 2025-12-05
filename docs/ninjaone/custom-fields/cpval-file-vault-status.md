---
id: 'b0fa9851-d256-45b6-ac64-38f6e6b0d30f'
slug: /b0fa9851-d256-45b6-ac64-38f6e6b0d30f
title: 'cPVAL FileVault Status'
title_meta: 'cPVAL FileVault Status'
keywords: ['security','mac']
description: 'This custom field stores the FileVault status on macOS devices fetched by the automation "Check FileVault Status" to indicate whether it is enabled or not.'
tags: ['macos', 'custom-fields']
draft: false
unlisted: false
---

## Summary

This custom field stores the FileVault status on macOS devices fetched by the automation [Check FileVault Status](/docs/14fdee94-c1d6-4519-850e-89b4ae34b411) to indicate whether it is enabled or not.

Note: `This is only compatible for Mac OS devices.`

## Details

| Label     | Field Name      | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description  | Tool Tip | Footer Text | Custom Field Tab Name |
| ----------------------------------- | -------------------------------- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL FileVault Status | cpvalFilevaultStatus | `Device`     | Text | No      | -             | Editable       | Read/Write            | Read/Write     | This custom field stores the FileVault status on macOS devices fetched by the automation "Check FileVault Status" to indicate whether it is enabled or not.  | This shows FileVault status.  | This shows FileVault status.  |`FileVault` |

## Dependencies

- [Automation - Check FileVault Status](/docs/14fdee94-c1d6-4519-850e-89b4ae34b411)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-filevault-status.toml)

## Sample screenshot

![FileVault status](../../../static/img/docs/b0fa9851-d256-45b6-ac64-38f6e6b0d30f/filevault.webp)