---
id: '95088908-fbea-4007-8914-f5b49d797dfe'
slug: /95088908-fbea-4007-8914-f5b49d797dfe
title: 'FastBoot Config Windows Server'
title_meta: 'FastBoot Config Windows Server'
keywords: ['fastboot', 'fast-startup', 'device-standard']
description: 'This condition ensures that the Enable or Disable Fast Boot [PVAL] script runs on Windows servers where the configuration does not match the desired value, and the mechanism is enabled through the cPVAL FastBoot Config Deployment custom field.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Summary

This condition ensures that the [Enable or Disable Fast Boot [PVAL]](/docs/9aa78588-bc01-4aab-95bd-29b5640975a2) script runs on Windows servers where the configuration does not match the desired value, and the mechanism is enabled through the [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) custom field.

## Details

- **Name:** `FastBoot Config`  
- **Description:** `This condition ensures that the Enable or Disable Fast Boot [PVAL] script runs on Windows servers where the configuration does not match the desired value, and the mechanism is enabled through the cPVAL FastBoot Config Deployment custom field.`  
- **Recommended Agent Policies:** `Windows Server [Default]`

## Dependencies
- [Automation - Get Fast Boot and Hibernation Status](/docs/9dc318fa-ce35-47ae-9442-f867208cde93)
- [Automation - Enable or Disable Fast Boot [PVAL]](/docs/9aa78588-bc01-4aab-95bd-29b5640975a2)
- [Custom Field - cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78)
- [Custom Field - cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012)
- [Compound Condition - FastBoot Config Windows Workstations](/docs/3ac6bda9-175b-4585-b252-b7456a440cdd)
- [Solution - Enable or Disable FastBoot](/docs/0d0fda4d-0f91-4093-bb04-025117299d28)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)


## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/fastboot-config-windows-servers.toml)
