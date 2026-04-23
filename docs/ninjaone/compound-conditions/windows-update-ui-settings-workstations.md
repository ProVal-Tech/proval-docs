---
id: '72550d20-2b73-43c7-982e-7d824ed90fe3'
slug: /72550d20-2b73-43c7-982e-7d824ed90fe3
title: 'Windows Update UI Settings - Workstations'
title_meta: 'Windows Update UI Settings - Workstations'
keywords: ['windows','updates','patching']
description: 'This compound conditions checks for the Windows agent where the `cPVAL Enable Windows Update Management` custom field is set at the `Organization`, `Locations`, or `Device` level.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-22
---

## Summary

This compound conditions executes the script [Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) once per day on workstations where the custom field [cPVAL Enable Windows Update Management](/docs/e1a4db82-eea6-4e2b-a687-9fc551d9c884) is configured.

## Details

- **Name:** `Windows Update UI Settings` 
- **Description:** `This compound conditions executes the script "Windows Updates - Enable or Disable Settings" once per day on workstations where the custom field "cPVAL Enable Windows Update Management" is configured.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
- [Solution - Windows Update UI Enable-Disable](/docs/a6da0735-ac80-40f8-8ad3-375ffa8d0e93)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/windows-update-ui-settings-workstations.toml)

## Changelog

### 2026-04-22

- Initial version of the document