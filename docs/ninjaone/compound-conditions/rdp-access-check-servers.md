---
id: '36261bfe-2318-45de-bc24-ffd62a2422a4'
slug: /36261bfe-2318-45de-bc24-ffd62a2422a4
title: 'RDP Access Check - servers'
title_meta: 'RDP Access Check - servers'
keywords: ['rdp', 'remote-desktop', 'security', 'disable']
description: 'This compound condition executes the RDP Access Check script to identify whether RDP access is enabled. If RDP is enabled, a ticket is created.'
tags: ['windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This compound condition is used to execute the script only when it needs to verify whether Remote Desktop Protocol (RDP) is enabled or disabled on the windows Servers.

## Details

**Name:**  `RDP Access Check - Servers`
**Description:**  `This compound condition executes the RDP Access Check script to identify whether RDP access is enabled. If RDP is enabled, a ticket is created.`
**Recommended Agent Policies:** `Windows Servers Policy`

## Dependencies

- [Automation - RDP Access Check](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e)
- [Solution - RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8)
- [Custom Field - cPVAL Exclude RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/rdp-access-check-servers.toml)

## Changelog

### 2026-07-20

- Initial version of the document.