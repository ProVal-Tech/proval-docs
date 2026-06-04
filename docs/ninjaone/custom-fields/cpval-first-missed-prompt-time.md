---
id: 'd6add994-9648-4f4c-9888-b2c8416b0c9a'
slug: /d6add994-9648-4f4c-9888-b2c8416b0c9a
title: 'cPVAL First Missed Prompt Time'
title_meta: 'cPVAL First Missed Prompt Time'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Records the exact date/time the machine first missed a reboot prompt due to a locked screen or no logged-in user.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Summary

Records the exact date/time the machine first missed a reboot prompt due to a locked screen or no logged-in user.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Org Level Tab | Location Level Tab | Device Level Tab |
| ----- | ---- | ---------------- | -------- | ------------- | ---------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL First Missed Prompt Time | cpvalFirstMissedPromptTime | Device | Text | False | | Editable | Read_Write | Read_Write | Records the exact date/time the machine first missed a reboot prompt due to a locked screen or no logged-in user. | Captured the first time a prompt is skipped. Resets to blank upon a successful prompt or reboot. | Auto-managed by script. Do not edit manually. | Reboot Pending Prompt | Reboot Pending Prompt | Reboot Pending Prompt - Workstations |

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-first-missed-prompt-time.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/d6add994-9648-4f4c-9888-b2c8416b0c9a/image1.webp)

## Changelog

### 2026-06-03

- Initial version of the document
