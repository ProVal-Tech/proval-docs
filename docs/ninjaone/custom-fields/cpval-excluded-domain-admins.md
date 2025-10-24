---
id: '32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0'
slug: /32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0
title: 'cPval Excluded Domain Admins'
title_meta: 'cPval Excluded Domain Admins'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description: 'Stores the usernames to exclude from generating the new domain admin detected tickets.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false

---
## Summary

Stores the usernames to exclude from generating the new domain admin detected tickets. Multiple usernames can be added by separating them with a comma like AutomateTestAccount,FlyingBatman,FallingBatman

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
|cPval Excluded Domain Admins| cpvalExcludedDomainAdmins | Device | Text | No | |Read Only | Read_Write | Read_Write | Add the usernames to exclude from generating the new domain admin detected tickets. Multiple usernames can be added by separating them with a comma like AutomateTestAccount,FlyingBatman,FallingBatman | | |

## Dependencies

- [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a)
- [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)
- [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)


## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-cumulative-update-audit-status.toml)
