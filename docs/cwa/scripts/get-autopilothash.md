---
id: '9171549a-070a-4346-be90-393416713806'
slug: /9171549a-070a-4346-be90-393416713806
title: 'Get-AutopilotHash'
title_meta: 'Get-AutopilotHash'
keywords: ['autopilot', 'hash', 'device', 'registration', 'edf']
description: 'This script retrieves the Hardware Hash necessary for Autopilot device registration and stores it in the Computer EDF labeled "Autopilot Hash". It can be executed as part of an autofix script or independently, and it includes user parameters for initial setup.'
tags: ['setup']
draft: false
unlisted: false
---

## Summary

This script retrieves the Hardware Hash for Autopilot device registration. It collects the Hardware Hash and stores it in the Computer EDF labeled "Autopilot Hash".

## Sample Run

It is intended to run as an autofix script with [CWA - Internal Monitor - ProVal - Production - Get - Autopilot Hash](/docs/3add591b-445e-440d-a7b3-cc85b2ea0674), but it can also be run independently.

![Sample Run](../../../static/img/Get-AutopilotHash/image_1.png)

## EDFs

| Name          | Level   | Type  | Description                                                |
|---------------|---------|-------|------------------------------------------------------------|
| Autopilot Hash| Computer| Text  | Script stores the Hardware Hash of a device under this EDF |

## User Parameters

| Name             | Example | Required                                               | Description                                                                                             |
|------------------|---------|------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Set_Environment   | 1       | Must be set to 1 for first-time implementation       | Running the script with the user parameter `Set_Environment` as `1` will import the EDFs needed for the script. |

## Output

- Script Logs


