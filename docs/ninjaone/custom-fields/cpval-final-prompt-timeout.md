---
id: '02cc7b8d-28aa-46c6-936b-21786c56206e'
slug: /02cc7b8d-28aa-46c6-936b-21786c56206e
title: 'cPVAL Final Prompt Timeout'
title_meta: 'cPVAL Final Prompt Timeout'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Sets how long (in seconds) the final reboot prompt stays visible on the end machine. Default is 900 seconds (15 minutes). Can be configured or overridden at Client, Location, or Device level.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Summary

Sets how long (in seconds) the final reboot prompt stays visible on the end machine. Default is 900 seconds (15 minutes). Can be configured or overridden at Client, Location, or Device level.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value |  Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Org Level Tab | Location Level Tab | Device Level Tab |
| ----- | ---- | ---------------- |  -------- | ------------- | ---------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL Final Prompt Timeout | cpvalFinalPromptTimeout | Organization, Location, Device | Integer | False |  | Editable | Read_Write | Read_Write | Sets how long (in seconds) the final reboot prompt stays visible on the end machine. Default is 900 seconds (15 minutes). Can be configured or overridden at Client, Location, or Device level. | Enter timeout in seconds for the final reboot prompt. Default is 900 (15 minutes). Can be overridden at Location or Device level. | Controls how long the final reboot prompt remains active before closing. Overrides at Location or Device level allow flexibility. | Reboot Pending Prompt | Reboot Pending Prompt | Reboot Pending Prompt - Workstations |

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-final-prompt-timeout.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/02cc7b8d-28aa-46c6-936b-21786c56206e/image1.webp)
