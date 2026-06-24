---
id: 'fcff5bd0-198e-4b40-a877-61efa4bec69e'
slug: /fcff5bd0-198e-4b40-a877-61efa4bec69e
title: 'Audit Installed Remote Tools (with Ticketing) - Workstation'
title_meta: 'Audit Installed Remote Tools (with Ticketing) - Workstation'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'Triggers the `Installed Remote Tools Audit` automation on Windows workstations where deployment is enabled and creates tickets on failures.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-24
---

## Summary
Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows workstations where deployment is enabled and creates tickets if `Windows (with Ticketing)`, `Windows Workstations (with Ticketing)` is selected at [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651) custom Field.

## Details

- **Name:** `Audit Installed Remote Tools (with Ticketing) - Workstation`
- **Description:** Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows workstations where deployment is enabled and creates tickets if `Windows (with Ticketing)`, `Windows Workstations (with Ticketing)` is selected at [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651) custom Field.
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

- [Solution - Installed Remote Access Tool Audit](/docs/eae2fab9-4697-4e1e-ad8f-93f8a09d7056)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/audit-installed-remote-tools-workstations-ticketing.toml)

## Changelog

### 2026-06-24

- Initial version of the document
