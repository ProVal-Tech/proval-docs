---
id: '7886b0b8-adb7-4ead-be73-f3174078ac7c'
slug: /7886b0b8-adb7-4ead-be73-f3174078ac7c
title: 'Restart Service'
title_meta: 'Restart Service'
keywords: [
    'service',
    'restart'
]
description: 'Restart one or more specified Windows services.'
tags: [
    'windows'
]
draft: false
unlisted: false
---

## Overview

This automation restarts one or more specified Windows services on a target device. It is useful for resolving issues related to service malfunctions or applying configuration changes that require a service restart.

## Dependencies

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| ServiceNames | 'Spooler','W32Time' | Any valid Windows service name(s), comma-separated | Yes | N/A | String | The names of the Windows services to restart. Multiple service names should be separated by commas. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/service-restart.ps1)

## Output

- Activity Details
