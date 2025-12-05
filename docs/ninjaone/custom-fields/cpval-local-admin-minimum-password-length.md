---
id: '354d5885-8a36-4478-884e-cb14fcdad4d8'
slug: /354d5885-8a36-4478-884e-cb14fcdad4d8
title: 'cPVAL Local Admin Minimum Password Length'
title_meta: 'cPVAL Local Admin Minimum Password Length'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Set the minimum password length for the local admin account. Applies only to auto-rotation. Not used when a default password is set. Default value: 14 characters.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Set the minimum password length for the local admin account. Applies only to auto-rotation. Not used when a default password is set. Default value: 14 characters.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Example | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Local Admin Minimum Password Length | cpvalLocalAdminMinimumPasswordLength | <ul><li>Organization</li><li>Location</li><li>Device</li></ul> | Integer | False | 14 | 12 | Editable | Read_Write | Read_Write | Set the minimum password length for the local admin account. Applies only to auto-rotation. Not used when a default password is set. Default value: 14 characters. | Minimum password length for auto-rotation. Default is 14. Ignored if a default password is provided. | Defines minimum length for auto-rotated passwords. Default: 14. Not applicable when using a default password. | <ul><li>Local Admin Process</li><li>Local Admin Process - Workstations</li><li>Local Admin Process - Servers</li></ul> |

## Dependencies

- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-local-admin-minimum-password-length.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/354d5885-8a36-4478-884e-cb14fcdad4d8/image1.webp)
