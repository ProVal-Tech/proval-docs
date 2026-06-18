---
id: '52a43eef-d4d7-4f91-b8c1-cb6e786ddcce'
slug: /52a43eef-d4d7-4f91-b8c1-cb6e786ddcce
title: 'Execute - Enforce TLS SSL Hardening - Workstations'
title_meta: 'Execute - Enforce TLS SSL Hardening - Workstations'
keywords: ['tls','ssl','disable']
description: 'Triggers `Enforce TLS SSL Hardening`script on opted windows workstations.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-18
---

## Summary

Triggers [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576) script on windows workstations where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Enforce and Validation (Workstations)`,`Enforce and Validation (Both)`.

## Details

- **Name:** `Execute - Enforce TLS SSL Hardening`
- **Description:** `Triggers 'Enforce TLS SSL Hardening' script on opted windows workstations.`
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/execute-enforce-tls-ssl-hardening-workstations.toml)

## Changelog

###  2026-06-18

- Initial version of the document