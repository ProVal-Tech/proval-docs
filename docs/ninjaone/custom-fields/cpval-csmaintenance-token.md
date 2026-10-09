---
id: '32e82fc8-8550-43ae-bd58-6abe3bfb693a'
slug: /32e82fc8-8550-43ae-bd58-6abe3bfb693a
title: 'cPVAL CS Maintenance token'
title_meta: 'cPVAL CS Maintenance token'
keywords: ['crowdstrike', 'uninstallation', 'windows', 'ninjaone', 'security']
description: 'Stores the CrowdStrike Falcon Sensor Maintenance Token used for authenticated sensor uninstallation.'
tags: ['windows', 'auditing', 'uninstallation', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Summary

Stores the CrowdStrike Falcon Sensor Maintenance Token used for authenticated sensor uninstallation.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL CS Maintenance token | cpvalcsmaintenancetoken | -- | `Device`, `Location`, `Organization` | Text | False | --- | -- |  Yes | Crowdstrike |

## Dependencies

- [Automation - Uninstall CrowdStrike](/docs/3d721829-3986-4700-8eb5-5b1f746d460a)
- [Solution - Uninstall-Crowdstrike-Ninjaone](/docs/96ec2315-d8e2-4793-8db9-8d3f73803945)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-csmaintenance-token.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/32e82fc8-8550-43ae-bd58-6abe3bfb693a/customfield.webp)

## Changelog

### 2026-10-09

Initial version of the script.
