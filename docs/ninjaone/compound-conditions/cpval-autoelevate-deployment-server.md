---
id: '9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f'
slug: /9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f
title: 'AutoElevate Deployment Windows servers'
title_meta: 'AutoElevate Deployment Windows servers'
keywords: ['autoelevate','agent','deployment']
description: 'This field controls whether the AutoElevate deployment process should run on the selected devices. When set to Enable, the deployment script will execute and install configure the AutoElevate agent using the defined parameters (License Key, Organization Name, Location Name, Elevation Mode, and Blocker Mode). When set to Disable, the deployment will be skipped. Accepted values: Enable or Disable.'
tags: ['security','application']
draft: false
unlisted: false
---

## Summary

This field controls whether the AutoElevate deployment process should run on the selected devices. When set to Enable, the deployment script will execute and install configure the AutoElevate agent using the defined parameters (`License Key, Organization Name, Location Name, Elevation Mode, and Blocker Mode`). When set to Disable, the deployment will be skipped. Accepted values: `Enable` or `Disable`.

## Details

**Name:** `AutoElevate Deployment`
**Description:** `Triggers the auto-deployment script for the AutoElevate windows machines where deployment is enabled.`
**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Windows server Policy [Default]`

## Dependencies

- [Automation - AutoElevate Deployment](/docs/9dc318fa-ce35-47ae-9442-f867208cde93)
- [Custom Field - cPVAL AutoElevate Deployment](/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b)
- [Custom Field - Blocker Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)
- [Custom Field - Elevation Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)
- [Custom Field - Organization Name](/docs/f6050cf6-67c8-4563-888e-8f34651cf4bb)
- [Custom Field - Location Name](/docs/4bfe4881-3687-4a30-bf00-d85067d5c6d8)
- [Custom Field - License Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)
- [Compound Condition - AutoElevate deployment Windows Workstation ](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c)
- [Solution - Enable or Disable FastBoot](/docs/0d0fda4d-0f91-4093-bb04-025117299d28)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/cpval-autoelevate-deployment-server.toml)
