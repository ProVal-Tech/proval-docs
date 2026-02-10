---
id: 'd7ba7616-f11d-4961-90fb-9e7cf9ed6f28'
slug: /d7ba7616-f11d-4961-90fb-9e7cf9ed6f28
title: 'Threatlocker Deployment - Windows'
title_meta: 'Threatlocker Deployment - Windows'
keywords: ['Threatlocker','windows','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Threatlocker on Windows machines where deployment is enabled'
tags: ['security','setup','windows']
draft: False
unlisted: false
---

## Summary

Triggers the [Threatlocker Deployment'](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows machines where deployment is enabled.

## Details

**Name:** `Threatlocker Depoyment - Windows`  
**Description:** `Triggers the auto-deployment script for Threatlocker on Windows machines where deployment is enabled.` 

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Windows Workstation [Default]`

## Dependencies

- [Automation - Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527)  
- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2) 
- [cPVAL Threatlocker Deployment - Exclude](/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da) 
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/threatlocker-deployment-windows.toml)