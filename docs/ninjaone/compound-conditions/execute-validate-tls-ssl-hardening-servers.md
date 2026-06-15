---
id: '79c1901b-3e55-42e3-8152-360605a4dbce'
slug: /79c1901b-3e55-42e3-8152-360605a4dbce
title: 'Execute - Validate TLS SSL Hardening - Servers'
title_meta: 'Execute - Validate TLS SSL Hardening - Servers'
keywords: ['tls','ssl','disable']
description: 'Triggers `Validate TLS SSL Hardening`script on opted windows Servers.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Summary

Triggers [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d)  on windows Servers where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Validation (Both)`, `Validation (Servers)`, `Enforce and Validation (Servers)`,`Enforce and Validation (Both)`.

## Details

- **Name:** `Execute - Validate TLS SSL Hardening`
- **Description:** `Triggers 'Validate TLS SSL Hardening' script on opted windows Servers.`
- **Recommended Agent Policies:** `Windows Servers`

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/execute-validate-tls-ssl-hardening-servers.toml)

## Changelog

###  2026-06-15

- Initial version of the document