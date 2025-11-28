---
id: '0454bb04-e771-4443-9285-6a17f3f9fea9'
slug: /0454bb04-e771-4443-9285-6a17f3f9fea9
title: 'Lenovo LSUClient - Deploy - [Used Prompt]'
title_meta: 'Lenovo LSUClient - Deploy - [Used Prompt]'
keywords: ['lenovo', 'bios', 'updates', 'firmware', 'drivers', 'automation']
description: 'This document provides a guide on using the PowerShell module LSUClient to install available BIOS updates for Lenovo machines, including important warnings and parameters to consider during the process.'
tags: ['bios', 'drivers', 'firmware', 'installation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script uses the PowerShell module `LSUClient` to install available BIOS updates for Lenovo machines. The `-All` parameter can be used to install all available vendor updates, including BIOS, firmware, Applications and drivers.

## Note

`The script prompts for variables during runtime, and we can also pass arguments to install only firmware, only Dell updates, only drivers, or any specific driver as needed.`

## Dependencies

PowerShell 5.0

## Sample Run

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo-samplerun1.webp)

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo2.webp)

## Parameters

Valid parameters: The valid values are `'All', 'Application', 'BIOS', 'Driver', 'Firmware'`. We can use them as per below examples.

| Parameter         | Required  | Default              | Type      | Description                                                                 |
|-------------------|-----------|----------------------|-----------|-----------------------------------------------------------------------------|
| `Argument`        | True  | `-Type All`    | String    | Used these parameters can install `ALL` updates. |
| `Argument`        | True  | `-Type Drivers`    | String    | HUsed these parameters can install `Drivers` updates. |
| `Argument`        | True  | `-Type BIOS`    | String    | Used these parameters can install `BIOS` updates.|
| `Argument`        | True  | `-Type Firmware`    | String    | Used these parameters can install `firmware` updates. |
| `Argument`        | True  | `-Type Application`    | String    | Used these parameters can install `Applciation`. |
| `Argument`        | True  | `-Type BIOS,Driver -NoReboot`    | String    | Used these parameters can install `BIOS,Driver` updates. |
| `Argument`        | True  | `-Id 'n3ch101w_bisbnk919kse', 'pcieeth06w_w11'`    | String    | Used these parameters can install particular updates |
| `Argument`        | True  | `-Type BIOS,Driver,application,firmware -NoReboot`    | String    | Used these parameters can install `BIOS,Driver,application,firmware` updates |

## Output

Script Logs