---
id: 'f7519fa5-6ffd-49a1-aab2-d63e3d1c1d3e'
slug: /f7519fa5-6ffd-49a1-aab2-d63e3d1c1d3e
title: 'cPVAL DUO WRAPSMARTCARD'
title_meta: 'cPVAL DUO WRAPSMARTCARD'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name | 
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | -------- | 
| cPVAL DUO WRAPSMARTCARD | cpvalDuoWrapsmartcard | Organization | drop-down | `Windows`, `Windows Workstations`, `Windows Servers`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward. | Select the platform to require Duo after smart card primary logon | DUO WRAPSMARTCARD | DUO |

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)


## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-wrapsmartcard.toml)

## Sample Screenshot

![Image5](../../../static/img/docs/f7519fa5-6ffd-49a1-aab2-d63e3d1c1d3e/image5.webp)

## Changelog

### 2026-05-28

* Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
