---
id: 'e38129a0-21bf-45fc-b6da-528312973aa0'
slug: /e38129a0-21bf-45fc-b6da-528312973aa0
title: 'SSL Audit - Servers'
title_meta: 'SSL Audit - Servers'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This compound condition performs SSL Certificate Audit once per day on Windows servers where auditing is enabled from `cPVAL Enable SSL Cert Audit` custom field. If set to Disable, the audit will not be performed.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary
This compound condition performs SSL Certificate Audit once per day on Windows servers where auditing is enabled from 'cPVAL Enable SSL Cert Audit' custom field. If set to Disable, the audit will not be performed.

## Details

- **Name:** `SSL Audit - Servers`
- **Description:** `This compound condition performs SSL Certificate Audit once per day on Windows servers where auditing is enabled from 'cPVAL Enable SSL Cert Audit' custom field. If set to Disable, the audit will not be performed.`
- **Recommended Agent Policies:**  `Windows Server Policy [Default]`

## Dependencies
- [Custom field - cPVAL Enable SSL Cert Audit](/docs/87e79b06-8bb4-4902-8a0c-0a626dfb11ab)
- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/ssl-audit-servers.toml)
