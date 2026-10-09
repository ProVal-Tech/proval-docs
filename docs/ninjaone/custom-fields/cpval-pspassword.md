---
id: '7542dfd2-1e05-4203-8234-a703e70b6748'
slug: /7542dfd2-1e05-4203-8234-a703e70b6748
title: 'cPVAL CS Password'
title_meta: 'cPVAL CS Password'
keywords: ['crowdstrike', 'uninstallation', 'windows', 'ninjaone', 'security']
description: 'Stores the CrowdStrike Falcon Sensor uninstall password used for authenticated sensor removal.'
tags: ['windows', 'auditing', 'uninstallation', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Summary

Stores the CrowdStrike Falcon Sensor uninstall password used for authenticated sensor removal.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL CS Password | cpvalcspassword | -- | `Device`, `Location`, `Organization` | Text | False | --- | -- |  Yes | Crowdstrike |

## Dependencies

- [Automation - Uninstall CrowdStrike](/docs/3d721829-3986-4700-8eb5-5b1f746d460a)
- [Solution - Uninstall-Crowdstrike-Ninjaone](/docs/96ec2315-d8e2-4793-8db9-8d3f73803945)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-pspassword.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/32e82fc8-8550-43ae-bd58-6abe3bfb693a/customfield.webp)

## Changelog

### 2026-10-09

Initial version of the script.