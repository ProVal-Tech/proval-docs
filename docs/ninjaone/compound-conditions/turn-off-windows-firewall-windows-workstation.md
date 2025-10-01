---
id: 'cd5cfdc6-69b2-41bd-be00-3e00547f284b'
slug: /cd5cfdc6-69b2-41bd-be00-3e00547f284b
title: 'Turn off Windows Firewall Windows Workstation'
title_meta: 'Turn off Windows Firewall Windows Workstation'
keywords: ['disable-windows-firewall', 'windows-firewall', 'security', 'network', 'device-standard']
description: 'This condition ensures that the Disable Windows Firewall script runs on Windows workstations where the Windows Firewall is enabled for any profile, and the disabling mechanism is enabled through the cPVAL Turn off Windows Firewall custom field.'
tags: ['networking', 'security', 'firewall']
draft: false
unlisted: false
---

## Summary

This condition ensures that the [Disable Windows Firewall](/docs/f13721f2-1a61-4ae8-bec3-1e008927dfac) script runs on Windows workstations where the Windows Firewall is enabled for any profile, and the disabling mechanism is enabled through the [cPVAL Turn off Windows Firewall](/docs/48a340ed-d4aa-4949-9862-89e0737c5c95) custom field.

## Details

**Name:** `Turn off Windows Firewall`  
**Description:** `This condition ensures that the Disable Windows Firewall script runs on Windows workstations where the Windows Firewall is enabled for any profile, and the disabling mechanism is enabled through the cPVAL Turn off Windows Firewall custom field.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Turn off Windows Firewall](/docs/48a340ed-d4aa-4949-9862-89e0737c5c95)
- [Automation - Get Windows Firewall Status](/docs/835251c6-1c07-4e24-9806-6071107fa8d3)
- [Automation - Disable Windows Firewall](/docs/f13721f2-1a61-4ae8-bec3-1e008927dfac)
- [Solution - Turn off Windows Firewall](/docs/202f2907-e8e5-4d65-9823-e70749cef708)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/turn-off-windows-firewall-windows-workstation.toml)
