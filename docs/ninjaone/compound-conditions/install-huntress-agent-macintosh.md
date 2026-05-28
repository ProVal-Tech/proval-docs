---
id: '6e7c65c3-3a14-433e-9cbb-617674c1aff0'
slug: /6e7c65c3-3a14-433e-9cbb-617674c1aff0
title: 'Install Huntress Agent - Macintosh'
title_meta: 'Install Huntress Agent - Macintosh'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy', 'mac']
description: 'Triggers the auto-deployment script for the Huntress Agent on Macintosh machines where deployment is enabled.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Summary

Triggers the [Install Huntress Agent - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f) automation on Macintosh machines where deployment is enabled.

## Details

**Name:** `Install Huntress Agent - Macintosh`  
**Description:** `Triggers the auto-deployment script for the Huntress Agent on Macintosh machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Solution : Huntress Agent Deployment](/docs/e0ad73d2-fcab-43f0-9866-72a48623ef48)
- [Install Huntress Agent - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f)  
- [cPVAL Huntress Deployment](/docs/67554954-e8da-48af-bda9-13a6a37c8295)  
- [cPVAL Huntress Install - Exclude](/docs/bdb92684-f093-49f8-9568-09874f9f79d5)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-huntress-agent-macintosh.toml)

## Changelog

## 2026-05-27

- Updated the documents as per our new template.

### 2025-04-11

- Initial version of the document
