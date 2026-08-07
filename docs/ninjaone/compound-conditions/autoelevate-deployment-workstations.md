---
id: '318ed257-0ffe-458b-a0c8-f79ed5eba00c'
slug: /318ed257-0ffe-458b-a0c8-f79ed5eba00c
title: 'AutoElevate Deployment Windows Workstation'
title_meta: 'AutoElevate Deployment Windows Workstation'
keywords: ['autoelevate','agent','deployment']
description: 'This compound condition triggers the auto-deployment script for Autoelevate agent deployment on windows workstations where deployment is enabled and the application is not installed.'
tags: ['security','application']
draft: false
unlisted: false
last_update:
  date: 2026-08-07
---

## Summary

This compound condition triggers the auto-deployment script for Autoelevate agent deployment on windows workstations where deployment is enabled and the application is not installed.

## Details

- **Name:** `AutoElevate Deployment - Workstations`
- **Description:** `Triggers the auto-deployment script on windows workstations where AutoElevate deployment is enabled.`
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policy: `Windows Workstation Policy`

## Dependencies

- [Automation - AutoElevate Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)
- [Custom Field - cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)
- [Solution - AutoElevate deployment](/docs/58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/autoelevate-deployment-workstations.toml)

## Changelog

### 2026-08-07

- Renamed Compound condition from `cpval-autoelevate-deployment-workstation` to `autoelevate-deployment-workstations`.

### 2025-12-04

- Initial version of the document
