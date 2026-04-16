---
id: '9955c0ad-6ca2-4087-9c83-0feec6fda845'
slug: /9955c0ad-6ca2-4087-9c83-0feec6fda845
title: 'Remove Power Plan'
title_meta: 'Remove Power Plan'
keywords: ['power-plan', 'remove-power-plan', 'power-plan-immybot', 'power-profile-removal']
description: 'This task checks your device for a specific power plan and removes it if found, while leaving all other power plans.'
tags: ['performance', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-16
---

## Description

This task removes one specific power plan from your computer.

It works in three simple steps:

1. It checks which power plans are currently on your device.
2. It confirms whether the selected plan is still present.
3. If it is present, it removes that plan and reports the result.

## Dependencies

- [Get-PowerPlan](/docs/4d7993ab-1fa8-4b96-9f19-f503737ea015)
- [Remove-PowerPlan](/docs/ffac4670-f9ec-4896-8338-78c92669ee53)

## Parameters

| Name | Example | Type | Mandatory | Description |
| ---- | ------- | ---- | --------- | ----------- |
| PowerPlan | High performance | String | Yes | Name of the Windows power plan to remove. The task checks for this plan in Test mode and removes it in Set mode by passing it to Remove-PowerPlan with the Name argument. |

## Task Configuration

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/remove-power-plan.toml)

## Changelog

### 2026-04-16

- Initial version of the document
