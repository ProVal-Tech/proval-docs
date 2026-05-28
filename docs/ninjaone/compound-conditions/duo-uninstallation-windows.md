---
id: 'e4b6e7a2-bf4e-4479-af9e-3f5ad0c6c879'
slug: /e4b6e7a2-bf4e-4479-af9e-3f5ad0c6c879
title: 'Duo Uninstallation - Windows'
title_meta: 'Duo Uninstallation - Windows'
keywords: ['duo', 'mfa', 'security', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Duo uninstallation where uninstallation is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

Triggers the [Duo Uninstall - Windows](/docs/0d48ed98-7619-4319-9a7f-2152bbfa3cb2) automation on Windows workstations and servers where uninstallation is enabled.

## Details

- **Name:** `Duo Uninstallation - Windows`  
- **Description:** `Triggers the auto-deployment script for Duo uninstallation where uninstallation is enabled.`  
- **Recommended Agent Policy:** `Windows Workstation [Default] / Windows Servers [Default]`

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/duo-uninstallation-windows.toml)

## Changelog

### 2026-05-28

- Initial version of the document
