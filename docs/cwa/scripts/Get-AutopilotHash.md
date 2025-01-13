---
id: 'cwa-autopilot-hash'
title: 'Get Autopilot Hash for Device Registration'
title_meta: 'Get Autopilot Hash for Device Registration'
keywords: ['autopilot', 'hash', 'device', 'registration', 'edf']
description: 'This script retrieves the Hardware Hash necessary for Autopilot device registration and stores it in the Computer EDF labeled "Autopilot Hash". It can be executed as part of an autofix script or independently, and it includes user parameters for initial setup.'
tags: ['computer', 'edf', 'hardware', 'registration', 'script', 'setup']
draft: false
unlisted: false
---
## Summary

This Script gets the Hardware Hash for Autopilot device registration. It collects the Hardware hash and stores it in the Computer EDF "Autopilot Hash".

## Sample Run

It is intended to run as an autofix Script with [CWA - Internal Monitor - ProVal - Production - Get - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245349) but could also be run independently.

![Sample Run](..\..\..\static\img\Get-AutopilotHash\image_1.png)

## EDFs

| Name         | Level   | Type  | Description                                                |
|--------------|---------|-------|------------------------------------------------------------|
| Autopilot Hash | Computer | Text  | Script stores the Hardware Hash of a device under this EDF |

## User Parameters

| Name             | Example | Required                                               | Description                                                                                             |
|------------------|---------|------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Set_Environment   | 1       | Need to set to 1 for first-time implementation       | Running the script with the user parameter `Set_Environment` as `1` will import the EDFs needed for the script. |

## Output

- Script Logs


