---
id: 'f7b08fe4-9eb4-4716-a9ea-84bedfa2f838'
slug: /f7b08fe4-9eb4-4716-a9ea-84bedfa2f838
title: 'RDP Access Check - Workstations'
title_meta: 'RDP Access Check - Workstations'
keywords: ['rdp', 'remote-desktop', 'security', 'disable']
description: 'This compound condition executes the RDP Access Check script to identify whether RDP access is enabled. If RDP is enabled, a ticket is created.'
tags: ['windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Summary

This compound condition is used to execute the script only when it needs to verify whether Remote Desktop Protocol (RDP) is enabled or disabled on the windows workstations.

## Details

**Name:**  `RDP Access Check - Workstations`
**Description:**  `This compound condition executes the RDP Access Check script to identify whether RDP access is enabled. If RDP is enabled, a ticket is created.`
**Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Automation - RDP Access Check](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e)
- [Solution - RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8)
- [Custom Field - cPVAL Exclude RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/rdp-access-check-workstations.toml)

## Changelog

### 2026-07-20

- Initial version of the document.