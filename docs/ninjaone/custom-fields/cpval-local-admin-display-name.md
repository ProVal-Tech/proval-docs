---
id: '40b4ecfd-059e-4734-b652-377781bed1b2'
slug: /40b4ecfd-059e-4734-b652-377781bed1b2
title: 'cPVAL Local Admin Display Name'
title_meta: 'cPVAL Local Admin Display Name'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Enter the display name for the local admin account. If left blank, the username will be used as the display name by default.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Enter the display name for the local admin account. If left blank, the username will be used as the display name by default.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Example | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Local Admin Display Name | cpvalLocalAdminDisplayName | <ul><li>Organization</li><li>Location</li><li>Device</li></ul> | Text | False | | Your Admin | Editable | Read_Write | Read_Write | Enter the display name for the local admin account. If left blank, the username will be used as the display name by default. | Provide a display name for the local admin. If not set, the username will be used. | Display name for the local admin account. Defaults to the username if empty. | <ul><li>Local Admin Process</li><li>Local Admin Process - Workstations</li><li>Local Admin Process - Servers</li></ul> |

## Dependencies

- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-local-admin-display-name.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/40b4ecfd-059e-4734-b652-377781bed1b2/image1.webp)
