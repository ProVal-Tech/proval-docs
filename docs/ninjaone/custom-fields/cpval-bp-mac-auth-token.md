---
id: '7537a07a-9dda-4302-8ef4-b66ae94df2b8'
slug: /7537a07a-9dda-4302-8ef4-b66ae94df2b8
title: 'cPVAL BP Mac Auth Token'
title_meta: 'cPVAL BP Mac Auth Token'
keywords: ['token','mac','security']
description: 'Holds the Blackpoint macOS authorization token for agent deployment.'
tags: ['security','custom-fields','macos']
draft: false
unlisted: false
---

## Summary

Stores the Blackpoint MacOS Authorization Token, which is required for automated deployment and authentication of the Blackpoint agent on macOS devices.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL BP Mac Auth Token | cpvalBpMacAuthToken | `Device`, `organization`, `Location` | Multi-line | True | -- | Editable | Read/Write | Read/Write | Stores the Blackpoint MacOS Authorization Token, which is required for automated deployment and authentication of the Blackpoint agent on macOS devices. | Stores the Blackpoint MacOS Authorization Token, which is required for automated deployment and authentication of the Blackpoint agent on macOS devices. | Provide the Blackpoint macOS authorization token for agent deployment. | BlackPoint |

## Dependencies

- [Automation - BlackPoint SnapAgent Installer - MacOS](/docs/22a99cac-7acf-4251-a790-41a3b651f183)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-bp-mac-auth-token.toml)



## Sample Screenshot

![Companyexe](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/token-mac.webp)
