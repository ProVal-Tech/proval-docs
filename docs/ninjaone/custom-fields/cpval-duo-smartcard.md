---
id: 'f0c8a089-0c1b-4056-8375-c3601acc968d'
slug: /f0c8a089-0c1b-4056-8375-c3601acc968d
title: 'cPVAL DUO SMARTCARD'
title_meta: 'cPVAL DUO SMARTCARD'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name | 
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----- | 
| cPVAL DUO SMARTCARD | cpvalDuoSmartcard | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval. | Select the platform to enable DUO SmartCard | DUO SMARTCARD | DUO |

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)


## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-smartcard.toml)

## Sample Screenshot

![Image5](../../../static/img/docs/f0c8a089-0c1b-4056-8375-c3601acc968d/image5.webp)

## Changelog

### 2026-05-28

- Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
