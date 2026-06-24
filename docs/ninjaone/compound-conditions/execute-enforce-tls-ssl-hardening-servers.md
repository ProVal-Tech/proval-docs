---
id: '93609405-1ef4-4aaa-b421-4f86a7e51145'
slug: /93609405-1ef4-4aaa-b421-4f86a7e51145
title: 'Execute - Enforce TLS SSL Hardening - Servers'
title_meta: 'Execute - Enforce TLS SSL Hardening - Servers'
keywords: ['tls','ssl','disable']
description: 'Triggers `Enforce TLS SSL Hardening` script on opted windows servers.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-24
---

## Summary

Triggers [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576) script on windows servers where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Windows Servers`, `Windows Devices`.

## Details

- **Name:** `Execute - Enforce TLS SSL Hardening`
- **Description:** `Triggers 'Enforce TLS SSL Hardening' script on opted windows servers.`
- **Recommended Agent Policies:** `Windows Servers`

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/execute-enforce-tls-ssl-hardening-servers.toml)

## Changelog

### 2026-06-24

- Updated Custom Field Options in the configuration.

###  2026-06-18

- Initial version of the document