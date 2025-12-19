---
id: 'fe3a8ca4-3722-4eaf-895a-723f8d563395'
slug: /fe3a8ca4-3722-4eaf-895a-723f8d563395
title: 'cPVAL Last Prompted'
title_meta: 'cPVAL Last Prompted'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Stores the timestamp of the last reboot prompt sent to the device. Updated automatically by the script. Manual edits are not recommended.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Summary

Stores the timestamp of the last reboot prompt sent to the device. Updated automatically by the script. Manual edits are not recommended.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Org Level Tab | Location Level Tab | Device Level Tab |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL Last Prompted | cpvalLastPrompted | Device | Text | False | | Editable | Read_Write | Read_Write | Stores the timestamp of the last reboot prompt sent to the device. Updated automatically by the script. Manual edits are not recommended. | Displays when the last reboot prompt was triggered. This field is script-managed and should not be manually changed. | Used for tracking prompt history. Avoid manual updates, as they are maintained by automation. | | | Reboot Pending Prompt - Workstations |

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-last-prompted.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395/image1.webp)
