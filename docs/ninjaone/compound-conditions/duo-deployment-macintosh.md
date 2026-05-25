---
id: 'efef6d5d-b853-46a5-8b7b-3d248a55e7a0'
slug: /efef6d5d-b853-46a5-8b7b-3d248a55e7a0
title: 'Duo Deployment - Macintosh'
title_meta: 'Duo Deployment - Macintosh'
keywords: ['duo', 'mfa', 'security', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Duo on Macintosh machines where deployment is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2025-05-07
---

## Summary

Triggers the [Duo Deployment - Macintosh](/docs/059819a5-8b95-40d1-ac89-b33858e864a0) automation on Macintosh machines where deployment is enabled.

## Details

**Name:** `Duo Deployment - Macintosh`  
**Description:** `Triggers the auto-deployment script for Duo on Macintosh machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/duo-deployment-macintosh.toml)

## Changelog

### 2026-05-25

* Updated the documentation to align with the new documentation format and standards.

### 2026-05-25

- Initial version of the document
