---
id: 'a3bdf78e-b4fd-499e-9e30-3eb49f6653cd'
slug: /a3bdf78e-b4fd-499e-9e30-3eb49f6653cd
title: 'cPVAL Zorus Uninstallation Password'
title_meta: 'cPVAL Zorus Uninstallation Password'
keywords: ['Zorus','Agent','Windows','Deployment']
description: 'Zorus agent uninstallation password'
tags: ['windows']
draft: false
unlisted: false
---

## Summary
 Zorus agent allows you to require a password to uninstall it. If you wish to utilize this feature set this variable to your desired password. Use this feature only if you have a secure way to store/remember the desired password.


## Details

| Label                               | Field Name                       | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description                                                                                                                                                                                     | Tool Tip | Footer Text | Custom Field Tab Name |
| ----------------------------------- | -------------------------------- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL Zorus Uninstallation Password | cpvalZorusUninstallationPassword | Organization     | Text | Yes      | -             | Editable              | Read/Write            | Read/Write     | Zorus agent uninstallation password. To utilize this feature set this variable to your desired password. Only use this feature if you have a secure way to store/remember the desired password. | -        | -           | Zorus Deployment      |

## Dependencies
- [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-zorus-uninstallation-password.toml)
