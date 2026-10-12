---
id: 'f44c5231-75d9-4067-8460-aee0e3900700'
slug: /f44c5231-75d9-4067-8460-aee0e3900700
title: 'Enable Defender - Server'
title_meta: 'Enable Defender - Server'
keywords: ['antivirus', 'windows', 'security', 'defender']
description: 'This compound condition is used to run automation to enable Defender on the Windows server if the custom field `cpvalEnableDefenderOnly` or `cpvalEnableDefenderWithTicketOnFailure` is set to ''Windows'' or ''Windows Server'''
tags: ['antivirus', 'windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Summary

This compound condition is used to run automation to enable Defender on the Windows server if the custom field [cPVAL Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae) is set to `Windows` or `Windows Server`.

## Details

- **Name:** `Enable Defender - Server`
- **Description:** `This compound condition is used to run automation to enable Defender on the Windows server if the custom field 'cPVAL Enable Defender Only' is set to Windows or Windows Server`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Solution - Enable Defender](/docs/265e1888-ce5f-4d44-a5c4-6a64d578eb98)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/enable-defender-server.toml)

## Changelog

### 2026-10-12

- Initial version of the document
