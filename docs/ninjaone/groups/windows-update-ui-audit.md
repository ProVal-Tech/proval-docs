---
id: '90702d57-0604-4f19-a439-0e2eb001e6f9'
slug: /90702d57-0604-4f19-a439-0e2eb001e6f9
title: 'Windows Update UI Audit'
title_meta: 'Windows Update UI Audit'
keywords: ['windows','updates','patching']
description: 'This group contains the devices with the status of the "Windows State UI" and also shows the custom field "Windows Update Button" status to show if the CF state is set to Enabled or Disabled for it.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This group contains the devices with the status of the "Windows State UI" and also shows the custom field "Windows Update Button" status to show if the CF state is set to Enabled or Disabled for it.

## Dependencies

[Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
[cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/windows-update-ui-audit.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/90702d57-0604-4f19-a439-0e2eb001e6f9/image.webp)

## Changelog

### 2026-04-16

- Removed unnecessary auditing solution, that contains multiple groups, custom fields, and complicated compound conditions.
- Added this new custom field to enable the solution based on the OS selection just like the ignite service plan patching for the Windows workstations, and Windows Servers.

### 2026-04-13

- Audit version created

### 2026-04-08

- Initial version of the document