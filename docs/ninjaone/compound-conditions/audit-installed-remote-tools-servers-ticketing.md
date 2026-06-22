---
id: 'd19f2a89-9667-41df-93ce-797295aa542a'
slug: /d19f2a89-9667-41df-93ce-797295aa542a
title: 'Audit Installed Remote Tools(with Ticketing) - Workstation'
title_meta: 'Audit Installed Remote Tools(with Ticketing) - Workstation'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'Triggers the `Installed Remote Tools Audit` automation on Windows servers where deployment is enabled and creates tickets on failures.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-22
---

## Summary
Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows servers where deployment is enabled and creates tickets on failures.

## Details

- **Name:** `Audit Installed Remote Tools`
- **Description:** Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows servers where deployment is enabled and creates tickets on failures.
- **Recommended Agent Policies:** `Windows servers`

## Dependencies

- [Solution - Installed Remote Access Tool Audit](/docs/eae2fab9-4697-4e1e-ad8f-93f8a09d7056)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/audit-installed-remote-tools-servers-ticketing.toml)

## Changelog

### 2026-06-22

- Initial version of the document
