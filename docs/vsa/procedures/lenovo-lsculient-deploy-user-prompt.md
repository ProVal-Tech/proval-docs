---
id: '0454bb04-e771-4443-9285-6a17f3f9fea9'
slug: /0454bb04-e771-4443-9285-6a17f3f9fea9
title: 'Lenovo LSUClient - Deploy - [User Prompt]'
title_meta: 'Lenovo LSUClient - Deploy - [User Prompt]'
keywords: ['lenovo', 'bios', 'updates', 'firmware', 'drivers', 'automation']
description: 'This document provides a guide on using the PowerShell module LSUClient to install available BIOS updates for Lenovo machines, including important warnings and parameters to consider during the process.'
tags: ['bios', 'drivers', 'firmware', 'installation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script uses the PowerShell module `LSUClient` to install available BIOS updates for Lenovo machines. The `-All` parameter can be used to install all available vendor updates, including BIOS, firmware, Applications and drivers.

**NOTE:** `The script prompts for variables during runtime, where we can pass arguments to either all, or install only firmware, only Lenovo updates, only drivers, or any specific driver as needed.`

## Dependencies

PowerShell 5.0

## Sample Run

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo-samplerun1.webp)

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo2.webp)

## Parameters

Valid parameters: The valid values are `'All', 'Application', 'BIOS', 'Driver', 'Firmware'`. We can use them as per below examples.

| Parameter         | Required  | Default              | Type      | Description                                                                 |
|-------------------|-----------|----------------------|-----------|-----------------------------------------------------------------------------|
| `Argument`        | True  | `-Type All`    | String    | Installs `ALL` updates. |
| `Argument`        | True  | `-Type Drivers`    | String    | Installs only `Drivers` updates. |
| `Argument`        | True  | `-Type BIOS`    | String    | Installs only `BIOS` updates.|
| `Argument`        | True  | `-Type Firmware`    | String    | Installs only `firmware` updates. |
| `Argument`        | True  | `-Type Application`    | String    | Installs only `Applciation`. |
| `Argument`        | True  | `-Type BIOS, Driver -NoReboot`    | String    | Installs both `BIOS, Driver` updates. |
| `Argument`        | True  | `-Id 'n3ch101w_bisbnk919kse', 'pcieeth06w_w11'`    | String    | When provided ID of the update, it installs that individual update. |
| `Argument`        | True  | `-Type BIOS,Driver,application,firmware -NoReboot`    | String    | Installs `BIOS, Driver, application, and firmware` updates |

## Output

Script Logs