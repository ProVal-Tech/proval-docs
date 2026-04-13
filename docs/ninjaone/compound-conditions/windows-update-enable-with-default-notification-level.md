---
id: '72550d20-2b73-43c7-982e-7d824ed90fe3'
slug: /72550d20-2b73-43c7-982e-7d824ed90fe3
title: 'Windows Update Setting Enable'
title_meta: 'Windows Update Setting Enable'
keywords: ['windows','updates','patching']
description: 'This compound conditions checks for the Windows agent where the Windows Update UI is set to enabled and its state recorded is not equals to enable.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Summary

This compound conditions checks for the Windows agent where the Windows Update UI is set to enabled and its state recorded is not equals to enable.

## Details

- **Name:*Windows Update Setting Enable* 
- **Description:*This compound conditions checks for the Windows agent where the Windows Update UI is set to enabled and its state recorded is not equals to enable.* 
- **Recommended Agent Policies:*Windows Update Enable with Default Notification level, Windows Update Enable with Default Notification level Server*

## Dependencies

[Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/windows-update-enable-with-default-notification-level.toml)

## FAQ

- Can same logic will be used for the disable condition applied by changing the [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007) custom field not equals to `Enable` and [cPVAL Windows Update Settings UI Audit](/docs/a2670f69-d6b0-4dad-a60b-24e0b2d311f1) not equals to `Enable`.
- Yes

- Can same policy needed to be used
- Yes

## Changelog

### 2026-04-13

- Audit version created

### 2026-04-08

- Initial version of the document