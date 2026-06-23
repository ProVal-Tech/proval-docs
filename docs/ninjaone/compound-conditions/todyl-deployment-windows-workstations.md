---
id: '737b576e-d7ac-48ec-ae04-14d7aa5f6d45'
slug: /737b576e-d7ac-48ec-ae04-14d7aa5f6d45
title: 'Todyl Deployment [Windows Workstations]'
title_meta: 'Todyl Deployment [Windows Workstations]'
keywords: ['todyl', 'todyl-agent', 'sgn-connect', 'deployment', 'windows']
description: 'Triggers the `Todyl Deployment [Windows]` automation on Windows workstations where deployment is enabled.'
tags: ['installation', 'security', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-06-22
---

## Summary

Triggers the [Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) automation on Windows workstations where deployment is enabled from [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3) custom field.

## Details

- **Name:** `Todyl Deployment [Windows Workstations]`
- **Description:** `Triggers the 'Todyl Deployment [Windows]' automation on Windows workstations where deployment is enabled.`
- **Recommended Agent Policies:**  `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3)
- [Custom Field: cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369)
- [Custom Field: cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0)
- [Automation: Todyl Deployment [Windows]](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629)
- [Solution: Todyl Agent Manager](/docs/01e0e3c8-adc5-4035-84d5-9266e5af0760)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/todyl-deployment-windows-workstations.toml)

## Changelog

### 2026-06-22

- Bug fixes and Formatting

### 2026-05-20

- Initial version of the document

