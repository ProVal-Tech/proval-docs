---
id: '080cb5cd-270d-42ee-aa69-05b88adcb35c'
slug: /080cb5cd-270d-42ee-aa69-05b88adcb35c
title: 'Manage Time Zone'
title_meta: 'Manage Time Zone'
keywords: ['time', 'time-zone', 'windows']
description: 'Gets or sets the Windows time zone using a NinjaOne custom field or runtime variables, with automatic detection and IANA-to-Windows mapping if ''Default'' is specified.'
tags: ['timezone', 'windows']
draft: false
unlisted: false
---

## Overview

Gets or sets the Windows time zone using a NinjaOne custom field or runtime variables, with automatic detection and IANA-to-Windows mapping if 'Default' is specified.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Manage Time Zone`
![Image1](../../../static/img/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c/image1.webp)

Set the required arguments and click the `Run` button to run the script.

- **Run As:** `System`  
- **Preset Parameter:** `<Leave it Blank>`  
- **Action:** `Get` or `Set`  
- **TimeZone:** `Default` or `<TimeZone to set>`  
![Image2](../../../static/img/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c/image2.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

- [Custom Field: cPVAL Time Zone To Set](/docs/23bc744a-aef7-40dd-bfc6-058138a4d302)
- [Solution: Time Zone Management](/docs/3641dd0d-82d8-4137-b987-0b6c0d8238da)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| Action | Get | `Get`, `Set` | False | `Get` | Drop-Down | Specifies the action to perform. |
| Time Zone | Eastern Standard Time | | False | `Default` | String | The Windows time zone ID to set (e.g., 'Pacific Standard Time'). If left blank, the script sets the Windows time zone automatically based on the device's public IP address. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/manage-time-zone.ps1)

## Output

- Activity Details  
- Custom Field
