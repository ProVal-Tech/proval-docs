---
id: 'b181197e-2971-4df6-b485-e5d8818978d8'
slug: /b181197e-2971-4df6-b485-e5d8818978d8
title: 'Manage Windows Run Dialog - Servers'
title_meta: 'Manage Windows Run Dialog - Servers'
keywords: ['run-dialog', 'win+r', 'norun', 'compound condition', 'servers']
description: 'Runs the Manage Windows Run Dialog automation on Windows servers when cPVAL Windows_Run_Dialog Action is set to Enable or Disable.'
tags: ['security', 'configuration', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-20
---

## Summary

This compound condition runs the [Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858) automation on Windows servers where [cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795) is set to `Enable` or `Disable`. Servers where the field is `Not Set` or empty are left alone.

The automation's parameters are left empty, so it reads the action from that field and the users to leave unchanged from [cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86). It then enables or disables the Run dialog (Windows key + R) for every other user profile on the server, including administrator accounts. Add the accounts that need the Run dialog, such as IT accounts, to the exclusions before you choose `Disable`.

The condition triggers once the device has been online for 10 minutes. While the field stays set, the automation runs again every 24 hours, so the setting is reapplied to any profile where it was changed. The condition resets after 12 hours, or as soon as the field is no longer `Enable` or `Disable`. It sends no notifications and creates no tickets.

## Details

- **Name:** `Manage Windows Run Dialog - Servers`
- **Description:** `Enables or disables the Windows Run dialog (Win+R) for every user on Windows servers, based on cPVAL Windows_Run_Dialog Action.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Custom Field: cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795)
- [Custom Field: cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86)
- [Automation: Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858)
- [Solution: Manage Windows Run Dialog - NinjaOne](/docs/8668290e-01bb-4501-be78-f2c2b626f3b7)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/manage-windows-run-dialog-servers.toml)

## Changelog

### 2026-11-20

- Initial version of the document
