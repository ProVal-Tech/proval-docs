---
id: 'acd50145-b46f-4168-af13-b4512061d240'
slug: /acd50145-b46f-4168-af13-b4512061d240
title: 'cPVAL CSE Deployment'
title_meta: 'cPVAL CSE InviteCode'
keywords: ['sonicwall-cse', 'install-banyan-app', 'sonicwall-cloud-security-edge-app']
description: 'Determines whether the SonicWall CSE deployment should be executed based on the configured deployment criteria.'
tags: ['application', 'installation', 'vpn', 'custom-field']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Summary

Determines whether the SonicWall CSE deployment should be executed based on the configured deployment criteria.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL CSE Deployment | cpvalCseDeployment | `Device`, `organization`, `Location` | `Drop-Down`| True | `Disabled`, `Windows`, `Windows Workstations`, `Windows Servers` | Editable | `Read/Write` | `Read/Write` | Determines whether the SonicWall CSE deployment should be executed based on the configured deployment criteria. | Returns True when the device meets the requirements for SonicWall CSE deployment. | Used in compound conditions to control SonicWall CSE deployment targeting. | CSE SonicWall Deployment |

## Dependencies

- [Solution - CSE SonicWall Deployment - NinjaOne](/docs/ac43f3f2-821f-4103-91c7-783e33f4aa0f)
- [Compound Condition - CSE SonicWall Deployment - Servers](/docs/0e96e9ab-436d-4d90-9bd5-59713edee157)
- [Compound Condition - CSE SonicWall Deployment - Workstations](/docs/ac43f3f2-821f-4103-91c7-783e33f4aa0f)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-cse-deployment.toml)

## Sample Screenshot

![SampleRun1](../../../static/img/docs/acd50145-b46f-4168-af13-b4512061d240/cc-deployment.webp)

## Changelog

### 2026-06-08

- Initial version of the document