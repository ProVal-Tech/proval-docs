---
id: 'b5472dc9-11af-4739-af78-7ef7478f6eab'
slug: /b5472dc9-11af-4739-af78-7ef7478f6eab
title: 'ConnectSecure Deployment - macOS'
title_meta: 'ConnectSecure Deployment - macOS'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'This is required for deploying the ConnectSecure to the Macintosh using automation'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
---

## Summary

Triggers the [CyberCNS ConnectSecure Mac - Install/Update](/docs/19378af5-7ee0-43b4-8051-58b280467a6c) automation on Macintosh machines where deployment is enabled.

## Details

- **Name:** `Connect Secure Deployment`
- **Description:** `Triggers the 'CyberCNS ConnectSecure Mac - Install/Update' automation on Macintosh machines where deployment is enabled.`
- **Recommended Agent Policies:** `Mac Policy (Default)` 

## Dependencies

- [cPVAL ConnectSecure Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)
- [Script - CyberCNS ConnectSecure Mac - Install/Update](/docs/19378af5-7ee0-43b4-8051-58b280467a6c)
- [Solution - Install ConnectSecure Windows/Mac](/docs/0e33b1a2-5539-4451-b49d-2ba9b7f904dd)

## Compound Condition Creation 

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/cpval-connect-secure-macintosh.toml)
