---
id: 'd7ba7616-f11d-4961-90fb-9e7cf9ed6f28'
slug: /d7ba7616-f11d-4961-90fb-9e7cf9ed6f28
title: 'ThreatLocker Deployment - Workstations'
title_meta: 'ThreatLocker Deployment - Workstations'
keywords: ['threatlocker','windows','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for ThreatLocker on Windows workstations where deployment is enabled'
tags: ['security','setup','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-02
---

## Summary

Triggers the [ThreatLocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows workstations where deployment is enabled.

## Details

- **Name:** `ThreatLocker Deployment - Workstations`  
- **Description:** `Triggers the auto-deployment script for ThreatLocker on Windows workstations where deployment is enabled.` 
- **Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Automation - ThreatLocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527)  
- [cPVAL ThreatLocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2)
- [Solution - ThreatLocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/threatlocker-deployment-windows-workstations.toml)

## Changelog

### 2026-06-02

- Renamed the document from `ThreatLocker Deployment - Windows` to `ThreatLocker Deployment - Workstations`. 
- Separated workstations and servers compound conditions because servers use different Custom fields for deployment.

### 2025-08-14

- Initial version of the document
