---
id: '1333942f-f022-4795-956b-ae86f815a636'
slug: /1333942f-f022-4795-956b-ae86f815a636
title: 'SSL Cert Expiration Alerts'
title_meta: 'SSL Cert Expiration Alerts'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: ''
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-20 
---

## Overview

This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [Compound Condition : Monitor SSL Cert Expiration - Workstations](/docs/8c096a91-90f6-4c25-a5dc-745598b19e11) and [Compound Condition : Monitor SSL Cert Expiration - Servers](/docs/79d5020a-7487-42ad-9dc3-1cfd7d675be5) condition.

## Requirement

Ensure that the ConnectWise Manage app is enabled and connected.  
![Requirement](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/requirement.webp)

## Dependencies

- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)

## Template Creation

[CW Manage Ticket Template Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/cw-manage-ticket-templates/ssl-cert-expiration-alerts.toml)

## Changelog

### 2026-07-20

- Initial version of the document