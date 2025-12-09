---
id: '03094753-93f5-41da-8a0a-d948b1165b88'
slug: /03094753-93f5-41da-8a0a-d948b1165b88
title: 'cPVAL Elevation_Mode'
title_meta: 'cPVAL Elevation_Mode'
keywords: ['agent','windows','security']
description: 'Elevation Mode is a configuration parameter used during the AutoElevate agent deployment. It determines how privilege elevation requests are handled on the device once the agent is installed'
tags:  ['security','application','custom-fields']
draft: false
unlisted: false
---

## Summary

Elevation Mode is a configuration parameter used during the AutoElevate agent deployment. It determines how privilege elevation requests are handled on the device once the agent is installed.

## Details

| Label                          | Field Name                 | Definition Scope | Type | Required | Available Options | Default Value | Technician Permission | Automation Permission | API Permission | Description                             | Tool Tip | Footer Text | Custom Field Tab Name |
| ------------------------------ | -------------------------- | ----------------| ----  | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | --------------------------------------- | -------- | ----------- | --------------------- |
| cPVAL Elevation Mode | cpvalElevationMode | `Organization`, `Location`, `Device`     | Drop-down | No     | `Audit` , `Live`, `Policy`      | Live |Editable              | Read/Write            | Read/Write     | Elevation Mode is a configuration parameter used during the AutoElevate agent deployment. It determines how privilege elevation requests are handled on the device once the agent is installed | Elevation Mode is a configuration parameter used during the AutoElevate agent deployment.      | It determines how privilege elevation requests are handled on the device once the agent is installed.     | AutoElevate     |

## Dependencies

- [AutoElevate Agent Deployment](/docs/45b83c20-5a25-4321-a253-5239633ecbd4)
- [Solution Document - AutoElevate Deployment - NinjaOne](/docs/58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-elevation-mode.toml)

## Sample Screenshot

![Elevation Mode](../../../static/img/docs/03094753-93f5-41da-8a0a-d948b1165b88/Elevation-mode.webp)