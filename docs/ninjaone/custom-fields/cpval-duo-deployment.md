---
id: '22469c4c-79f2-4a87-9650-f418f4327e07'
slug: /22469c4c-79f2-4a87-9650-f418f4327e07
title: 'cPVAL DUO Deployment'
title_meta: 'cPVAL DUO Deployment'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'Select the required platform to enable Duo to auto-deploy.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-25
---

## Summary

Select the required platform to enable Duo to auto-deploy.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL DUO Deployment | cpvalDuoDeployment | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled`, `Uninstall` | `Disabled` | False | Editable | Read/Write | Read/Write | Select the required platform to enable Duo to auto-deploy. Select Uninstall to Uninstall Duo on both mac and windows machines if its already installed. | Select the required platform to enable Duo to auto-deploy. Select Uninstall to Uninstall Duo on both mac and windows machines if its already installed. | DUO Deployment | DUO | 

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-deployment.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/22469c4c-79f2-4a87-9650-f418f4327e07/image1.webp)

## Changelog

### 2026-05-25

* Added an uninstall option to the custom field, allowing the same field to be used for both installation and uninstallation actions.
* Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
