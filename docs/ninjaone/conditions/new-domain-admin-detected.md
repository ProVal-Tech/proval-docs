---
id: 'b300f17d-63ee-4c31-b29b-a9fb92a69a89'
slug: /b300f17d-63ee-4c31-b29b-a9fb92a69a89
title: 'New Domain Admin Detected'
title_meta: 'New Domain Admin Detected'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description: 'Runs the New Domain Admin Detected automation every 04 hours on Infrastructure masters'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary
Runs the [New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a) automation every 04 hours on Infrastructure masters and creates a ticket if a new domain admin is detected.

## Details

- **Name:**  `New Domain Admin Detected`
- **Description:**  `Runs the New Domain Admin Detected automation every 04 hours on Infrastructure masters`
- **Recommended Agent Policies:**   `Windows Server - Active Directory`

## Dependencies
- [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a)
- [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)
- [Solution : New Domain Admin Detected](/docs/ffbbe3fe-f579-4521-a95a-1eb772d93ac7)


## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/new-domain-admin-detected.toml)

