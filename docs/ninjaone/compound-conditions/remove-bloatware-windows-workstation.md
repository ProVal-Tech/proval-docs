---
id: 'b6723ac1-0617-4be9-958f-385c77b52bc5'
slug: /b6723ac1-0617-4be9-958f-385c77b52bc5
title: 'Remove Bloatware'
title_meta: 'Remove Bloatware'
keywords: ['bloatware', 'pua', 'remove-pua', 'remove-bloatware', 'uninstallation']
description: 'This condition triggers the Remove Bloatware script on Windows workstations where bloatware listed in the cPVAL Bloatware to Remove field is present and removal is enabled via the cPVAL Remove Bloatware field.'
tags: ['windows', 'setup', 'application', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This condition triggers the [Remove Bloatware](/docs/e921882d-f1f2-492a-8cd0-58d37eba5d35) script on Windows workstations where bloatware listed in the [cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548) field is present and removal is enabled via the [cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef) field.

## Details

**Name:** `Remove Bloatware`  
**Description:** `This condition triggers the Remove Bloatware script on Windows workstations where bloatware listed in the cPVAL Bloatware to Remove field is present and removal is enabled via the cPVAL Remove Bloatware field.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef)
- [Custom Field - cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548)
- [Automation - Find Bloatware](/docs/1c79c2ef-4053-4956-85be-f9c0d87c37ed)
- [Automation - Remove Bloatware](/docs/e921882d-f1f2-492a-8cd0-58d37eba5d35)
- [Solution - Remove Bloatware](/docs/9912c1d2-27b8-449a-8d54-d5e24b436721)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/remove-bloatware-windows-workstation.toml)
