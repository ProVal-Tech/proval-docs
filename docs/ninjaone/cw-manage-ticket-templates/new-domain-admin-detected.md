---
id: '355a03b6-61f8-45c4-92f9-43f13b5dd7ac'
slug: /355a03b6-61f8-45c4-92f9-43f13b5dd7ac
title: 'New Domain Admin Detected'
title_meta: 'New Domain Admin Detected'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description: 'Runs the New Domain Admin Detected automation every 04 hours on Infrastructure masters'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---
---

## Overview
This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89) condition.

## Requirement

Ensure that the ConnectWise Manage app is enabled and connected.  
![Requirement](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/requirement.webp)

## Dependencies
- [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a)
- [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)
- [cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0)

## Template Creation

[CW Manage Ticket Template Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/cw-manage-ticket-templates/new-domain-admin-detected.toml)
