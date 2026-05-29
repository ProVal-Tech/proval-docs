---
id: '1f27cc9b-0d7f-4ec6-a235-d3c318f3abb5'
slug: /1f27cc9b-0d7f-4ec6-a235-d3c318f3abb5
title: 'ThreatLocker Deployment - Windows'
title_meta: 'ThreatLocker Deployment - Windows'
keywords: ['threatlocker','windows','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for ThreatLocker on Windows servers where deployment is enabled'
tags: ['security','setup','windows']
draft: False
unlisted: false
last_update:
  date: 2026-05-29
---

## Summary

Triggers the [ThreatLocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows servers where deployment is enabled.

## Details

- **Name:** `ThreatLocker Depoyment - Windows`  
- **Description:** `Triggers the auto-deployment script for ThreatLocker on Windows servers where deployment is enabled.` 
- **Recommended Agent Policies:** `Windows Server [Default]`

## Dependencies

- [Automation - ThreatLocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527)  
- [cPVAL ThreatLocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [Solution - ThreatLocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/threatlocker-deployment-windows-servers.toml)

## Changelog

### 2026-05-29

- Initial version of the document
