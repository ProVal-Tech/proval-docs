---
id: '4e517727-01c3-4357-81c2-43eea78e45ed'
slug: /4e517727-01c3-4357-81c2-43eea78e45ed
title: 'Uninstall Threatlocker - Windows'
title_meta: 'Uninstall Threatlocker - Windows'
keywords: ['threatlocker','windows','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for ThreatLocker on Windows machines where deployment is enabled'
tags: ['security','setup','windows']
draft: False
unlisted: false
last_update:
  date: 2026-05-29
---

## Summary

Triggers the [Uninstall Threatlocker](/docs/74fed1e5-d84f-4435-adc5-661cff43129c) automation on Windows machines where uninstallation is enabled.

## Details

- **Name:** `ThreatLocker Depoyment - Windows`  
- **Description:** `Triggers the auto-deployment script for ThreatLocker on Windows machines where uninstallation is enabled.` 
- **Recommended Agent Policies:** `Windows Workstation [Default]`, `Windows Server [Default]`

## Dependencies

- [Solution - ThreatLocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/threatlocker-deployment-windows-machines.toml)

## Changelog

### 2026-05-29

- Initial version of the document
