---
id: '6771a3e9-b9e9-4347-afb7-68c5fc5cf740'
slug: /6771a3e9-b9e9-4347-afb7-68c5fc5cf740
title: 'cPVAL MAC Certificate Download URL'
title_meta: 'cPVAL MAC Certificate Download URL'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Custom Field to add direct download URL of the certificate.'
tags: ['installation', 'security', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary

Custom Field to add direct download URL of the certificate. Something like this: https://example.com/certficates/DNSFilter.cer 

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Custom Field Tab Name |
| ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| cPVAL MAC Certificate Download URL | cpvalMacCertificateDownloadUrl |  `Organization`, `Location`, `Device`  | Text | False | | Read Only | Read/Write | Read/Write | Install Certificate |

## Dependencies

- [Solution - Install Certificates - Windows/Mac](/docs/12034de3-aa3a-4f6c-89da-a6f229e6fbec)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-mac-certificate-download-url.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740/image1.webp)

## Changelog

### 2026-09-28

- Initial version of the document