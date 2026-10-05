---
id: '1e92329a-e461-4299-a762-2fd19bf48e40'
slug: /1e92329a-e461-4299-a762-2fd19bf48e40
title: 'Enable UAC and Set Level'
title_meta: 'Enable UAC and Set Level'
keywords: ['uac', 'setting', 'windows']
description: 'Configures the Windows User Account Control (UAC) level based on the selected setting.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-05
---

## Overview
Configures the Windows User Account Control (UAC) level based on the selected setting.

## Sample Run

![Image1](../../../static/img/docs/1e92329a-e461-4299-a762-2fd19bf48e40/image1.webp)

## Dependencies

- [Solution - Enable UAC Settings](/docs/01c2c7d9-7ce9-4e09-981b-b18e55ed2cbf)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| UAC Setting  | `Never Notify when apps or users make changes`  | <ul><li>Not Configured</li><li>Never Notify when apps or users make changes</li><li>Notify When Apps make Changes - Dim Desktop</li><li>Always Notify when Apps and Users make Changes</li><li>Notify When Apps make Changes - Do Not Dim Desktop</li></ul> | `False` | Drop Down | Select the UAC setting to configure on the machine. | 


## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/enable-uac-and-set-level.ps1)

## Output

- Activity Details

## Changelog

### 2026-10-05

- Initial version of the document