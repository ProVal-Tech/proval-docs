---
id: '73daf0e3-7d35-415b-ab69-386ddd7377e0'
slug: /73daf0e3-7d35-415b-ab69-386ddd7377e0
title: 'Install Huntress Agent - Windows'
title_meta: 'Install Huntress Agent - Windows'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for the Huntress Agent on Windows machines where deployment is enabled.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Summary

Triggers the [Huntress Agent Manager - Windows](/docs/518bff20-44d4-4206-9336-bb6922d959da) automation on Windows machines where deployment is enabled.

## Details

**Name:** `Install Huntress Agent - Windows`  
**Description:** `Triggers the auto-deployment script for the Huntress Agent on Windows machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Windows Server [Default]`
- `Windows Workstation [Default]`

## Dependencies

- [Solution : Huntress Agent Deployment](/docs/e0ad73d2-fcab-43f0-9866-72a48623ef48)
- [Install Huntress Agent - Windows](/docs/518bff20-44d4-4206-9336-bb6922d959da)  
- [cPVAL Huntress Deployment](/docs/67554954-e8da-48af-bda9-13a6a37c8295)  
- [cPVAL Huntress Install - Exclude](/docs/bdb92684-f093-49f8-9568-09874f9f79d5)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-huntress-agent-windows.toml)

## Changelog

## 2026-05-27

- Updated the documents as per our new template.

### 2025-04-11

- Initial version of the document
