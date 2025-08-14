---
id: '9f4d1394-8444-44e3-a4a1-97d6b7c71f92'
slug: /9f4d1394-8444-44e3-a4a1-97d6b7c71f92
title: 'Install MSP360 Online Backup - Windows Workstation'
title_meta: 'Install MSP360 Online Backup - Windows Workstation'
keywords: ['backup', 'msp360', 'automation', 'windows']
description: 'This compound condition is designed to execute the "Install MSP360 Online Backup" script on Windows workstations where the "Online Backup" application is not installed and deployment is enabled via the "cPVAL Deploy MSP360" custom field.'
tags: ['backup', 'automation', 'windows']
draft: false
unlisted: false
---

## Summary

This compound condition is designed to execute the [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b) script on Windows workstations where the 'Online Backup' application is not installed and deployment is enabled via the [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7) custom field.

## Details

**Name:** `Install MSP360 Online Backup - Windows Workstation`  
**Description:** `This compound condition is designed to execute the 'Install MSP360 Online Backup' script on Windows workstations where the 'Online Backup' application is not installed and deployment is enabled via the 'cPVAL Deploy MSP360' custom field.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [cPVAL Deploy MSP 360](/docs/294f2f3e-1091-45b0-b764-b16ae054fad7)
- [cPVAL MSP 360 Url](/docs/7e18083b-6a0e-49da-8a08-cfe9c7fa3378)
- [Install MSP360 Online Backup](/docs/104e0456-6bb4-4e65-b0c0-0f8b6c0a4d8b)
- [MSP360 Online Backup Deployment](2f783bba-4022-43d3-8bb4-a768f68fe8c2)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-msp-360-online-windows-workstation.toml)
