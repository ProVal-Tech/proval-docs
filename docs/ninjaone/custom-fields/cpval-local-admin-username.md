---
id: 'e1b7982c-35bc-43b4-870f-2f27f8ed582e'
slug: /e1b7982c-35bc-43b4-870f-2f27f8ed582e
title: 'cPVAL Local Admin Username'
title_meta: 'cPVAL Local Admin Username'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Enter the username for the local admin account to be created. This name will be used when setting up the account as part of the Local Admin Process solution.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Enter the username for the local admin account to be created. This name will be used when setting up the account as part of the Local Admin Process solution.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Example | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Local Admin Username | cpvalLocalAdminUsername | <ul><li>Organization</li><li>Location</li><li>Device</li></ul> | Text | True (Alternatively can be provided from the primary script's runtime variable `Local Admin Username`). | | yourAdmin | Editable | Read_Write | Read_Write | Enter the username for the local admin account to be created. This name will be used when setting up the account as part of the Local Admin Process solution. | Provide the username for the local admin account that will be created automatically. | Specify the username for the local admin account. This is required for initial setup. | <ul><li>Local Admin Process</li><li>Local Admin Process - Workstations</li><li>Local Admin Process - Servers</li></ul> |

## Dependencies

- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-local-admin-username.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e/image1.webp)
