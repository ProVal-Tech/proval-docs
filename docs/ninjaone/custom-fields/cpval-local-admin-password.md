---
id: '922e9ee1-9e5f-41cb-b397-62379f9ce9fc'
slug: /922e9ee1-9e5f-41cb-b397-62379f9ce9fc
title: 'cPVAL Local Admin Password'
title_meta: 'cPVAL Local Admin Password'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Stores the password for the local admin account created by the Local Admin Process. This value is used for authentication and should be kept secure.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Stores the password for the local admin account created by the Local Admin Process. This value is used for authentication and should be kept secure.

> **Note:** *End user should not make any changes to this field manually.*

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Example | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Local Admin Password | cpvalLocalAdminPassword | <ul><li>Device</li></ul> | Secure | False | | | Editable | Read_Write | Read_Write | Stores the password for the local admin account created by the Local Admin Process. This value is used for authentication and should be kept secure. | Password for the local admin account. Ensure it is stored securely. | This field holds the local admin account password. Keep it confidential. | <ul><li>Local Admin Process - Workstations</li><li>Local Admin Process - Servers</li></ul> |

## Dependencies

- [Automation: Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b)
- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-local-admin-password.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc/image1.webp)
