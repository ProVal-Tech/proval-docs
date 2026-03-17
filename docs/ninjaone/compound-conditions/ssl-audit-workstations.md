---
id: 'd6082c07-16ba-4b32-8eee-c01384378ac7'
slug: /d6082c07-16ba-4b32-8eee-c01384378ac7
title: 'SSL Audit - Workstations'
title_meta: 'SSL Audit - Workstations'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This compound condition performs SSL Certificate Audit once per day on Windows Workstations where auditing is enabled from `cPVAL Enable SSL Cert Audit` custom field. If set to Disable, the audit will not be performed.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-16
---

## Summary
This compound condition performs SSL Certificate Audit once per day on Windows Workstations where auditing is enabled from [cPVAL Enable SSL Cert Audit](/docs/87e79b06-8bb4-4902-8a0c-0a626dfb11ab) custom field. If set to *Disable*, the audit will not be performed.

## Details

- **Name:** `SSL Audit - Workstations`
- **Description:** `This compound condition performs SSL Certificate Audit once per day on Windows Workstations where auditing is enabled from 'cPVAL Enable SSL Cert Audit' custom field. If set to 'Disable', the audit will not be performed.`
- **Recommended Agent Policies:**  `Windows Workstation Policy [Default]`

## Dependencies

- [Custom field - cPVAL Enable SSL Cert Audit](/docs/87e79b06-8bb4-4902-8a0c-0a626dfb11ab)
- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/ssl-audit-workstations.toml)

## Changelog

### 2026-02-16

- Initial version of the document
