---
id: 'b9c741fb-911c-410e-b0d4-754f4436fa60'
slug: /b9c741fb-911c-410e-b0d4-754f4436fa60
title: 'Disable UPnP Service - Servers'
title_meta: 'Disable UPnP Service - Servers'
keywords: ['upnp', 'windows','disable']
description: 'Triggers Disable UPnP Device Host Service automation on Windows Servers where service disablement is enabled through the cPVAL Disable UPnP Service Custom Field.'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Summary

Triggers the [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e) on Windows Servers where UPnP service disablement is enabled through the [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba) and the service is set to `Automatic`.

## Details

- **Name:** `Disable UPnP Service - Servers`
- **Description:** `Triggers 'Disable UPnP Device Host Service' automation on Windows Servers where service disablement is enabled through the 'cPVAL Disable UPnP Service' Custom Field`  
- **Recommended Agent Policy:** `Windows Server [Default]`

## Dependencies

- [Custom Field - cPVAL Disable UPnP Service](/docs/216608bc-7f31-44c3-9fc6-6f5be20f99ba)
- [Automation - Disable UPnP Device Host Service](/docs/d593cb7a-17b2-4b6a-82be-09518e1a591e)
- [Solution - Disable UPnP Service](/docs/70d10692-83c6-4c25-b546-9beadaba5468)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-upnp-service-Servers.toml)

## Changelog

### 2026-10-09

- Initial version of the document
