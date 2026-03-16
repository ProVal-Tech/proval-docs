---
id: 'b5472dc9-11af-4739-af78-7ef7478f6eab'
slug: /b5472dc9-11af-4739-af78-7ef7478f6eab
title: 'Connect Secure Deployment [Macintosh]'
title_meta: 'Connect Secure Deployment [Macintosh]'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'Initiates the Deploy ConnectSecure Agent [Macintosh] automation on Mac computers where deployment is enabled but the agent is not yet installed.'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-03-16
---

## Summary

Initiates the [Deploy ConnectSecure Agent [Macintosh]](/docs/19378af5-7ee0-43b4-8051-58b280467a6c) automation on Mac computers where deployment is enabled but the agent is not yet installed.

## Details

- **Name:** `ConnectSecure Vulnerability Scan Agent Deployment`
- **Description:** `Initiates the Deploy ConnectSecure Agent [Macintosh] automation on Mac computers where deployment is enabled but the agent is not yet installed.`
- **Recommended Agent Policies:** `Mac Policy [Default]`

## Dependencies

- [Custom Field - cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)
- [Automation - Deploy ConnectSecure Agent [Macintosh]](/docs/19378af5-7ee0-43b4-8051-58b280467a6c)
- [Solution - ConnectSecure Agent Deployment](/docs/0e33b1a2-5539-4451-b49d-2ba9b7f904dd)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/connect-secure-deployment-macintosh.toml)

## Changelog

### 2026-03-16

- Updated the condition to reference the new custom field and its associated automation.

### 2025-12-10

- Initial version of the document
