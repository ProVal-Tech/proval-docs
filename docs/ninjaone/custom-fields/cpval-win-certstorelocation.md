---
id: '73a3849d-464c-4bf1-ae15-a93a9bd54370'
slug: /73a3849d-464c-4bf1-ae15-a93a9bd54370
title: 'cPVAL Win CertStoreLocation'
title_meta: 'cPVAL Win CertStoreLocation'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Custom Field to add a particular certificate store on a Windows system to import the certificate.'
tags: ['installation', 'security', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary
Custom Field to add a particular certificate store on a Windows system to import the certificate. It could be something like `Cert:/CurrentUser/Root`, `Cert:/LocalMachine/My`, etc. If nothing is mentioned in the parameter, it will use the default store location, i.e., Cert:/LocalMachine/Root.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Custom Field Tab Name |
| ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| cPVAL Win CertStoreLocation | cpvalWinCertstorelocation |  `Organization`, `Location`, `Device`  | Text | False | | Read Only | Read/Write | Read/Write | Install Certificate |

## Dependencies

- [Solution - Install Certificates - Windows/Mac](/docs/12034de3-aa3a-4f6c-89da-a6f229e6fbec)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-win-certstorelocation.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370/image1.webp)

## Changelog

### 2026-09-28

- Initial version of the document