---
id: 'd0e9c568-145f-4ee5-b545-ff4bbb022f84'
slug: /d0e9c568-145f-4ee5-b545-ff4bbb022f84
title: 'AD - Enable AD Recycle Bin'
title_meta: 'AD - Enable AD Recycle Bin'
keywords: ['active-directory', 'recycle', 'bin', 'domain', 'controllers']
description: 'Executes Automation: Active Directory - Enable AD Recycle Bin on Windows domain controllers where Custom Field: cPVAL Enable AD Recycle Bin is set to Enable and Custom Field: cPVAL AD Recycle Bin State is not set to Enable, to enable the Active Directory Recycle Bin on the server.'
tags: ['active-directory']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Summary

Executes  [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f) on Windows domain controllers where [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) is set to Enable and [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) is not set to Enable, to enable the Active Directory Recycle Bin on the Domain server.


## Details

- **Name:** `AD - Enable AD Recycle Bin`
- **Description:** `Executes Automation: Active Directory - Enable AD Recycle Bin on Windows domain controllers where Custom Field: cPVAL Enable AD Recycle Bin is set to Enable and Custom Field: cPVAL AD Recycle Bin State is not set to Enable, to enable the Active Directory Recycle Bin on the server.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

* [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f)
* [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e)
* [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20)
* [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)
* [Solution - AD Recycle Bin](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/ad-enable-ad-recycle-bin.toml)

## Changelog

### 2026-10-29

- Initial version of the document
