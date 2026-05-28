---
id: 'ec5c78f9-036c-42fc-9975-446636e8df91'
slug: /ec5c78f9-036c-42fc-9975-446636e8df91
title: 'Duo Uninstallation - Macintosh'
title_meta: 'Duo Uninstallation - Macintosh'
keywords: ['duo', 'mfa', 'security', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script to uninstall Duo on Macintosh machines where uninstallation is enabled'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

Triggers the [DUO Uninstall - Macintosh](/docs/2df7433a-7c8f-45de-95a6-7444f67da354) automation on Macintosh machines where uninstallation is enabled.

## Details

- **Name:** `Duo Uninstallation - Macintosh`  
- **Description:** `Triggers the auto-deployment script to uninstall Duo on Macintosh machines where uninstallation is enabled.`  
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:
  - `Mac Server [Default]`
  - `Mac [Default]`

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)


## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/duo-uninstallation-macintosh.toml)

## Changelog

### 2026-05-28

- Initial version of the document
