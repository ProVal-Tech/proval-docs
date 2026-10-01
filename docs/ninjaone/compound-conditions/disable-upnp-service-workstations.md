---
id: 'de590749-0673-456b-b8c8-65d7eaf1cc0f'
slug: /de590749-0673-456b-b8c8-65d7eaf1cc0f
title: 'Disable UPnP Service - Workstations'
title_meta: 'Disable UPnP Service - Workstations'
keywords: ['upnp', 'windows','disable']
description: 'Triggers Disable UPnP Device Host Service automation on Windows workstations where service disablement is enabled through the cPVAL Disable UPnP Service Custom Field.'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-01
---

## Summary

Triggers the [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) on Windows workstations where UPnP service disablement is enabled through the [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba)

## Details

- **Name:** `Disable UPnP Service - Workstations`
- **Description:** `Triggers 'Disable UPnP Device Host Service' automation on Windows workstations where service disablement is enabled through the 'cPVAL Disable UPnP Service' Custom Field`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba)
- [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e)
- [Solution - Disable UPnP Service](/docs/70d10692-83c6-4c25-b546-9beadaba5468)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-upnp-service-workstations.toml)

## Changelog

### 2026-10-01

- Initial version of the document
