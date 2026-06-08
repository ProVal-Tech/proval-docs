---
id: 'c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2'
slug: /c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2
title: 'cPVAL ThreatLocker Deployment'
title_meta: 'cPVAL ThreatLocker Deployment'
keywords: ['threatlocker','windows','mac','deployment']
description: 'Enables ThreatLocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level.'
tags: ['security','setup','windows','macos']
draft: false
unlisted: false
last_update:
  date: 2026-06-02
---

## Summary

Enables ThreatLocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ---- |
| cPVAL ThreatLocker Deployment | cpvalThreatLockerDeployment | Organization | drop-down | `All`, `Windows`, `Windows and Macintosh`, `Disabled`, `windows workstations`, `windows servers and Macs`, `windows workstations and macs`, `windows servers`, `macs`, `Uninstall` | `Disabled` | False | Editable | Read/Write | Read/Write | Select OS to enable auto-deployment of ThreatLocker. Select 'Uninstall' to uninstall ThreatLocker if it is already installed on the machines.| Select OS to enable auto-deployment of ThreatLocker. Select 'Uninstall' to uninstall ThreatLocker if its already installed on the machines. | ThreatLocker | ThreatLocker |

## Dependencies

- [Solution - ThreatLocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)  

### Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-threatlocker-deployment.toml)

## Sample Screenshot

![Step1](../../../static/img/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2/TL-deployment.webp)

## Changelog

### 2026-06-02

- Added `Uninstall` option in the custom field.

### 2025-05-27

- Initial version of the document
