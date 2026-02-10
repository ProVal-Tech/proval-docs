---
id: '73470264-63c3-43d1-a727-1e813cfe768d'
slug: /73470264-63c3-43d1-a727-1e813cfe768d
title: 'Threatlocker Deployment - MAC'
title_meta: 'Threatlocker Deployment - MAC'
keywords: ['Threatlocker','MAC','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Threatlocker on Macintosh machines where deployment is enabled'
tags: ['security','setup','macos']
draft: false
unlisted: false
---

## Summary

Triggers the [Threatlocker Deployment [MAC]](/docs/11444307-4a3f-4388-b5c5-096a50725b4e) automation on macintosh machines where deployment is enabled.

## Details

**Name:** `Threatlocker Deployment - MAC`  
**Description:** `Triggers the auto-deployment script for Threatlocker on Macintosh machines where deployment is enabled.` 

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Threatlocker Deployment [MAC]](/docs/11444307-4a3f-4388-b5c5-096a50725b4e)
- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/threatlocker-deployment-macs.toml)