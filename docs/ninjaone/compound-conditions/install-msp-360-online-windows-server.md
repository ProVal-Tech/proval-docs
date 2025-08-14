---
id: '29f5ffd2-507f-4595-92eb-7d8956f30c88'
slug: /29f5ffd2-507f-4595-92eb-7d8956f30c88
title: 'Install MSP360 Online Backup - Windows Server'
title_meta: 'Install MSP360 Online Backup - Windows Server'
keywords: ['backup', 'msp360', 'automation', 'windows']
description: 'This compound condition is designed to execute the "Install MSP360 Online Backup" script on Windows servers where the "Online Backup" application is not installed and deployment is enabled via the "cPVAL Deploy MSP360" custom field.'
tags: ['backup', 'application', 'software']
draft: false
unlisted: false
---

## Summary

This compound condition is designed to execute the [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b) script on Windows servers where the 'Online Backup' application is not installed and deployment is enabled via the [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7) custom field.

## Details

**Name:** `Install MSP360 Online Backup - Windows Server`  
**Description:** `This compound condition is designed to execute the 'Install MSP360 Online Backup' script on Windows servers where the 'Online Backup' application is not installed and deployment is enabled via the 'cPVAL Deploy MSP360' custom field.`  
**Recommended Agent Policies:** `Windows Server [Default]`

## Dependencies

- [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7)
- [cPVAL MSP 360 Url](/docs/7e18083b-6a0e-49da-8a08-cfe9c7fa3378)
- [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b)
- [MSP360 Online Backup Deployment](2f783bba-4022-43d3-8bb4-a768f68fe8c2)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-msp-360-online-windows-server.toml)
