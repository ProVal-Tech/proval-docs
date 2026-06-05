---
id: '6c947f3c-a994-49dc-a7a2-9f7d240a8692'
slug: /6c947f3c-a994-49dc-a7a2-9f7d240a8692
title: 'SentinelOne Uninstall - Workstation'
title_meta: 'SentinelOne Uninstall - Workstation'
keywords: ['sentinelone', 'antivirus', 'S1']
description: 'This performs the Sentinel uninstallation to the Windows or windows workstations where the sentinel deployment custom field is set to `Uninstall` and SentinelOne is installed.'
tags: ['antivirus', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Summary

This performs the Sentinel uninstallation to the Windows or windows workstations where the sentinel deployment custom field is set to `Uninstall` and SentinelOne is installed.

## Details

- **Name:** `SentinelOne Uninstall`
- **Description:** `This performs the Sentinel uninstallation to the windows Workstation where the sentinel deployment custom field is set to "Uninstall" and SentinelOne is installed.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Solution - SentinelOne Automation](/docs/0e01e6d8-e332-4a72-aa56-e2386b214ab0)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/sentinelone-deployment-uninstall-workstation.toml)


## Changelog

### 2026-06-03

- Initial version of the document
