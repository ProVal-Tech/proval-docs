---
id: '79d5020a-7487-42ad-9dc3-1cfd7d675be5'
slug: /79d5020a-7487-42ad-9dc3-1cfd7d675be5
title: 'Monitor SSL Cert Expiration - Servers'
title_meta: 'Monitor SSL Cert Expiration - Servers'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'Triggers the Script SSL Certificate Expiration Monitoring automation on Windows workstation'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-20 
---

## Summary
Triggers the [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) automation on Windows Servers where alerting is enabled and [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) is Set to `True` by [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5). It creates tickets if [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) detects any expired or soon-to-expire certificate that haven't already been alerted on.

## Details

- **Name:** `Monitor SSL Cert Expiration - Servers`
- **Description:** `Triggers the [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) automation on Windows Servers where alerting is enabled and [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) is Set to 'True' by [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5). It creates tickets if [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) detects any expired or soon-to-expire certificate that haven't already been alerted on.`
- **Recommended Agent Policies:** `Windows Servers`

## Dependencies

- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)
- [Ticket Template : SSL Cert Expiration Alerts](/docs/1333942f-f022-4795-956b-ae86f815a636)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/monitor-ssl-cert-expiration-servers.toml)

## Changelog

### 2026-07-20

- Initial version of the document
