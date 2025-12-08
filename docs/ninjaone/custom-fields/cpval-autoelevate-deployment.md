---
id: 'fddfde6b-c93e-4471-aafe-2d6bc65c7e4b'
slug: /fddfde6b-c93e-4471-aafe-2d6bc65c7e4b
title: 'cPVAL AutoElevate Deployment'
title_meta: 'cPVAL AutoElevate Deployment'
keywords: ['agent','windows','deployment']
description: 'This field controls whether the AutoElevate deployment process should run on the selected devices. When set to Enable, the deployment script will execute and install configure the AutoElevate agent using the defined parameters (License Key, Elevation Mode, and Blocker Mode). When set to Disable, the deployment will be skipped. Accepted values: Enable or Disable.'
tags: ['security','application','custom-fields']
draft: false
unlisted: false
---

## Summary

This field controls whether the AutoElevate deployment process should run on the selected devices. When set to Enable, the deployment script will execute and install configure the AutoElevate agent using the defined parameters (`License Key, Elevation Mode, and Blocker Mode`). When set to Disable, the deployment will be skipped. Accepted values: `Enable` or `Disable`.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL AutoElevate Deployment | cpvalAutoelevateDeployment | `Organization`, `Location`, `Device`     | `Drop-Down` | Yes     | `Enabled`,`Disabled`            | Editable              | Read/Write            | Read/Write     | This Custom Field is utilized during the AutoElevate deployment process within compound execution conditions. It controls whether the agent installation proceeds based on the configured deployment logic.      | AutoElevate deployment condition field.     | Used for compound conditions in AutoElevate deployment.    | AutoElevate     |

## Dependencies

- [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)
- [Compound Condition - AutoElevate deployment Windows Workstation](/docs/318ed257-0ffe-458b-a0c8-f79ed5eba00c)
- [Compound Condition - AutoElevate deployment Windows server](/docs/9f1ddbe4-b1bb-43d2-ac71-072de6b60d3f)
- [Solution Document - AutoElevate Deployment - NinjaOne](/docs/58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-autoelevate-deployment.toml)

## Sample Screenshot

![Lisence Key](../../../static/img/docs/fddfde6b-c93e-4471-aafe-2d6bc65c7e4b/AE%20deploy.webp)
