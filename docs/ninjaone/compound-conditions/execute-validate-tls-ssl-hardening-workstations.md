---
id: '28f17281-2502-43a0-8d4d-5da2b06580f8'
slug: /28f17281-2502-43a0-8d4d-5da2b06580f8
title: 'Execute - Validate TLS SSL Hardening - Workstations'
title_meta: 'Execute - Validate TLS SSL Hardening - Workstations'
keywords: ['tls','ssl','disable']
description: 'Triggers `Validate TLS SSL Hardening`script on opted windows workstations.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-10
---

## Summary

Triggers [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d) script on windows workstations where [cPVAL TLS Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d) is either set to  `Validation (Both)`, `Validation (Workstations)`, `Enforce and Validation (Workstations)`,`Enforce and Validation (Both)`.

## Details

- **Name:** `Execute - Validate TLS SSL Hardening`
- **Description:** `Triggers 'Validate TLS SSL Hardening' script on opted windows workstations.`
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/execute-validate-tls-ssl-hardening-workstations.toml)

## Changelog

###  2026-06-10

- Initial version of the document