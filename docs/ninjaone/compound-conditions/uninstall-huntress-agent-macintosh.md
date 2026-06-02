---
id: 'e9e8925c-4ece-4e7e-8c0e-3e388fd4d9c7'
slug: /e9e8925c-4ece-4e7e-8c0e-3e388fd4d9c7
title: 'Uninstall Huntress Agent - Macintosh'
title_meta: 'Uninstall Huntress Agent - Macintosh'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy', 'mac']
description: 'Triggers the Uninstall Huntress Agent - Macintosh automation on Macintosh machines where huntress agent is installed and uninstallation is enabled.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-06-02
---

## Summary

Triggers the [Uninstall Huntress Agent - Macintosh](/docs/4a215450-d390-4d65-b4f9-03c144d36bc9) automation on Macintosh machines where huntress agent is installed and uninstallation is enabled.

## Details

**Name:** `Uninstall Huntress Agent - Macintosh`  
**Description:** `Triggers the auto-uninstallation script for Mac Machines where huntress agent is installed and uninstallation is enabled.`  
**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Solution : Huntress Agent Deployment](/docs/e0ad73d2-fcab-43f0-9866-72a48623ef48)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/uninstall-huntress-agent-macintosh.toml)


## Changelog

### 2026-06-02

- Initial version of the document