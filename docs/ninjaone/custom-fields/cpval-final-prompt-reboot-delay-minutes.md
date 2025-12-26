---
id: '58e81186-a952-40e6-8f06-ad485c52ef2a'
slug: /58e81186-a952-40e6-8f06-ad485c52ef2a
title: 'cPVAL Final Prompt Reboot Delay Minutes'
title_meta: 'cPVAL Final Prompt Reboot Delay Minutes'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Specifies how many minutes to delay the forced reboot after the final prompt. Default applies if not set. Can be configured or overridden at Client, Location, or Device level.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Summary

Specifies how many minutes to delay the forced reboot after the final prompt. Default applies if not set. Can be configured or overridden at Client, Location, or Device level.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value |  Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Org Level Tab | Location Level Tab | Device Level Tab |
| ----- | ---- | ---------------- |  -------- | ------------- | ---------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL Final Prompt Reboot Delay Minutes | cpvalFinalPromptRebootDelayMinutes | Organization, Location, Device | Integer | False |  | Editable | Read_Write | Read_Write | Specifies how many minutes to delay the forced reboot after the final prompt. Default applies if not set. Can be configured or overridden at Client, Location, or Device level. | Enter delay in minutes before enforcing reboot after the last prompt. Can be overridden at Location or Device level. | Controls the grace period after the final prompt before reboot occurs. Overrides at Location or Device level allow flexibility. | Reboot Pending Prompt | Reboot Pending Prompt | Reboot Pending Prompt - Workstations |

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-final-prompt-reboot-delay-minutes.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/58e81186-a952-40e6-8f06-ad485c52ef2a/image1.webp)
