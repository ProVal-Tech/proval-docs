---
id: 'ce025e63-334f-4008-8942-f0bbe73aef18'
slug: /ce025e63-334f-4008-8942-f0bbe73aef18
title: 'Uninstall Huntress Agent - Windows'
title_meta: 'Uninstall Huntress Agent - Windows'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-uninstallation script for Windows machines where huntress agent is installed and uninstallation is enabled.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-06-02
---

## Summary
Triggers the [Huntress Agent Manager - Windows](/docs/518bff20-44d4-4206-9336-bb6922d959da) automation on Windows machines where huntress agent is installed and uninstallation is enabled.

## Details

- **Name:** `Uninstall Huntress Agent - Windows`
- **Description:** `Triggers the auto-uninstallation script for Windows machines where huntress agent is installed and uninstallation is enabled.`  
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:
  - `Windows Server [Default]`
  - `Windows Workstation [Default]`

## Dependencies

- [Solution : Huntress Agent Deployment](/docs/e0ad73d2-fcab-43f0-9866-72a48623ef48)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/uninstall-huntress-agent-windows.toml)

## Changelog

### 2026-06-02

- Initial version of the document