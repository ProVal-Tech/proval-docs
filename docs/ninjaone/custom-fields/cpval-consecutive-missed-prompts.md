---
id: 'e61fd6fa-cf42-4315-831f-d4a150bc53d6'
slug: /e61fd6fa-cf42-4315-831f-d4a150bc53d6
title: 'cPVAL Consecutive Missed Prompts'
title_meta: 'cPVAL Consecutive Missed Prompts'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Counts consecutive detection cycles where a prompt was missed due to a locked screen or no logged-in user.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Summary

Counts consecutive detection cycles where a prompt was missed due to a locked screen or no logged-in user.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Org Level Tab | Location Level Tab | Device Level Tab |
| ----- | ---- | ---------------- | -------- | ------------- | ---------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- | ----------- |
| cPVAL Consecutive Missed Prompts | cpvalConsecutiveMissedPrompts | Device | Integer | False | | Editable | Read_Write | Read_Write | Counts consecutive detection cycles where a prompt was missed due to a locked screen or no logged-in user. | Increments when skipped. Weekends do NOT count if 'Skip Weekends' is enabled. Resets when unlocked. | Auto-managed. Resets to 0 on success or reboot. | Reboot Pending Prompt | Reboot Pending Prompt | Reboot Pending Prompt - Workstations |

## Dependencies

- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-consecutive-missed-prompts.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/e61fd6fa-cf42-4315-831f-d4a150bc53d6/image1.webp)

## Changelog

### 2026-06-03

- Initial version of the document
