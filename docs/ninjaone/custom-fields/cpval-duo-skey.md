---
id: '868d35d1-fe4e-4e65-b7a5-7661d0d33405'
slug: /868d35d1-fe4e-4e65-b7a5-7661d0d33405
title: 'cPVAL DUO SKEY'
title_meta: 'cPVAL DUO SKEY'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'This is a sensitive piece of information, akin to a password, used in conjunction with the IKEY. The SKEY is used to sign communication between your application and Duo’s service securely.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-25
---

## Summary

This is a sensitive piece of information, akin to a password, used in conjunction with the IKEY. The SKEY is used to sign communication between your application and Duo’s service securely.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ------ | 
| cPVAL DUO SKEY | cpvalDuoSkey | Organization | Text | False | Editable | Read/Write | Read/Write | This is a sensitive piece of information, akin to a password, used in conjunction with the IKEY. The SKEY is used to sign communication between your application and Duo’s service securely. | Provide the secret key from the Duo Admin Panel. | DUO SKEY | DUO |


## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-skey.toml)

## Sample Screenshot

![Image3](../../../static/img/docs/868d35d1-fe4e-4e65-b7a5-7661d0d33405/image3.webp)

## Changelog

### 2026-05-25

* Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
