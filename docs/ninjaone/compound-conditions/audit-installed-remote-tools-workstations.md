---
id: '05f4af3f-1f26-4080-aec5-fc9bbc0df5fc'
slug: /05f4af3f-1f26-4080-aec5-fc9bbc0df5fc
title: 'Audit Installed Remote Tools - Workstation'
title_meta: 'Audit Installed Remote Tools - Workstation'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'Triggers the `Installed Remote Tools Audit` automation on Windows workstations where deployment is enabled.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-16
---

## Summary
Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows workstations where deployment is enabled.

## Details

- **Name:** `Audit Installed Remote Tools`
- **Description:** Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows workstations where deployment is enabled.
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

- [Solution - Installed Remote Access Tool Audit](/docs/eae2fab9-4697-4e1e-ad8f-93f8a09d7056)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/audit-installed-remote-tools-workstations.toml)

## Changelog

### 2026-06-16

- Initial version of the document
