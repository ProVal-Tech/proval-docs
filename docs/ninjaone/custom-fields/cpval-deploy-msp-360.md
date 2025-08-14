---
id: '294f2f3e-1091-45b0-b764-b16ae054fad7'
slug: /294f2f3e-1091-45b0-b764-b16ae054fad7
title: 'cPVAL Deploy MSP 360'
title_meta: 'cPVAL Deploy MSP 360'
keywords: ['msp360', 'online-backup', 'installation', 'application']
description: 'Select Operating System to deploy MSP 360 Online Backup Agent.'
tags: ['backup', 'application', 'software']
draft: false
unlisted: false
---

## Summary

To choose the operating system(s) for deploying the MSP 360 Online Backup Agent.

**Notes:**

- Selecting `Windows Servers and Windows Workstations` will automatically deploy the agent to both server and workstation devices of the client or location.
- The `Disabled` option can be set at the Location or Device level to prevent deployment on those targets.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Drop-down Options | Device Custom Field Tab Name | Organization Custom Field Tab Name | Location Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL Deploy MSP 360 | cpvalDeployMsp360 | <ul><li>Device</li><li>Location</li><li>Organization</li></ul> | Drop-down | false |  | `Editable` | `Read/Write` | `Read/Write` | Select Operating System to deploy MSP 360 Online Backup Agent. | Select Operating System to deploy MSP 360 Online Backup Agent. | Deploy MSP 360 | <ul><li>Disabled</li><li>Windows Servers</li><li>Windows Workstations</li><li>Windows Servers and Windows Workstations</li></ul> | Default fields | MSP 360 Online Backup | MSP 360 Online Backup |

## Dependencies

- [MSP360 Online Backup Deployment](2f783bba-4022-43d3-8bb4-a768f68fe8c2)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-deploy-msp-360.toml)
