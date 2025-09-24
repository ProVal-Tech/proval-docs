---
id: '0b21bc06-3e82-4d45-939a-cf2d2425251c'
slug: /0b21bc06-3e82-4d45-939a-cf2d2425251c
title: 'Configure Taskbar Outlook Chrome Only'
title_meta: 'Configure Taskbar Outlook Chrome Only'
keywords: ['chrome', 'outlook', 'taskbar', 'pin-chrome', 'pin-outlook', 'taskbar-pin']
description: 'This condition triggers the Pin Chrome and Outlook to Taskbar script on Windows workstations where Chrome and Outlook are either not pinned to the taskbar or are pinned alongside other applications. The pinning action is controlled by the cPVAL Configure Taskbar Outlook Chrome Only custom field.'
tags: ['windows', 'setup', 'application']
draft: false
unlisted: false
---

## Summary

This condition triggers the [Pin Chrome and Outlook to Taskbar](/docs/0229b8df-4fd3-4b30-923c-34ff7f656f8e) script on Windows workstations where Chrome and Outlook are either not pinned to the taskbar or are pinned alongside other applications. The pinning action is controlled by the [cPVAL Configure Taskbar Outlook Chrome Only](/docs/6c8e4e35-3db7-4ff0-8d3c-ec8d0b04e82f) custom field.

## Details

**Name:** `Configure Taskbar Outlook Chrome Only`  
**Description:** `This condition triggers the Pin Chrome and Outlook to Taskbar script on Windows workstations where Chrome and Outlook are either not pinned to the taskbar or are pinned alongside other applications. The pinning action is controlled by the cPVAL Configure Taskbar Outlook Chrome Only custom field.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Configure Taskbar Outlook Chrome Only](/docs/6c8e4e35-3db7-4ff0-8d3c-ec8d0b04e82f)
- [Automation - Check Taskbar Pin Chrome and Outlook](/docs/36b9d578-a66a-49db-8b42-6c5507ae8c79)
- [Automation - Pin Chrome and Outlook to Taskbar](/docs/0229b8df-4fd3-4b30-923c-34ff7f656f8e)
- [Solution - Configure Taskbar Outlook Chrome Only](/docs/8efbc9f2-0812-40c2-8583-a563049c7762)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/configure-taskbar-outlook-chrome-only.toml)
