---
id: '9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f'
slug: /9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f
title: 'AutoElevate Deployment Windows Servers'
title_meta: 'AutoElevate Deployment Windows Servers'
keywords: ['autoelevate','agent','deployment']
description: 'This compound condition triggers the auto-deployment script for Autoelevate agent deployment on windows servers where deployment is enabled and the application is not installed.'
tags: ['security','application']
draft: false
unlisted: false
last_update:
  date: 2026-08-07
---

## Summary

This compound condition triggers the auto-deployment script for Autoelevate agent deployment on windows servers where deployment is enabled and the application is not installed.

## Details

- **Name:** `AutoElevate Deployment - Servers`
- **Description:** `Triggers the auto-deployment script on windows servers where AutoElevate deployment is enabled.`
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies: `Windows server Policy`

## Dependencies

- [Automation - AutoElevate Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)
- [Custom Field - cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)
- [Solution - AutoElevate deployment](/docs/58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/autoelevate-deployment-servers.toml)

## Changelog

### 2026-08-07

- Renamed Compound condition from `cpval-autoelevate-deployment-server` to `autoelevate-deployment-servers`.

### 2025-12-04

- Initial version of the document
