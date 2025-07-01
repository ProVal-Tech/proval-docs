---
id: '52d28a7b-158c-4937-b33e-a23639f84aeb'
slug: /52d28a7b-158c-4937-b33e-a23639f84aeb
title: 'Set PageFile'
title_meta: 'Set PageFile'
keywords: ['virtual-memory', 'page-file', 'windows']
description: 'Configures the Windows page file settings on a specified drive, supporting both automatic and custom configurations.'
tags: ['disk', 'memory', 'windows']
draft: false
unlisted: false
---

## Overview

Configures the Windows page file settings on a specified drive, supporting both automatic and custom configurations. It supports two modes of operation:

1. **AutomaticManagedPagefile:** Enables Windows-managed page file settings, allowing the operating system to automatically determine the size and location of the page file.
2. **Custom:** Disables automatic management and applies user-defined initial and maximum page file sizes on a specified drive.

**NOTE:** This script requires administrative privileges and PowerShell 5 or higher.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Set PageFile`
![Image1](../../../static/img/docs/52d28a7b-158c-4937-b33e-a23639f84aeb/image1.webp)

Set the required arguments and click the `Run` button to run the script.

- **Run As:** `System`  
- **Preset Parameter:** `<Leave it Blank>`  
- **Mode:** `Custom` or `AutomaticManagedPagefile`  
- **DriveLetter:** `<Drive Letter to Set PageFile for, default value is C:>`  
- **InitialSizeMB:** `<Initial size of the page file in megabytes (MB). Used only in 'Custom' mode.>`  
- **MaximumSizeMB:**  `<Maximum size of the page file in megabytes (MB). Used only in 'Custom' mode.>`  
![Image2](../../../static/img/docs/52d28a7b-158c-4937-b33e-a23639f84aeb/image2.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| Mode | `Custom` | `Custom`, `AutomaticManagedPagefile` | True | `Custom` | Drop-Down | Specifies whether to use automatic or custom page file settings. Use 'AutomaticManagedPagefile' to let Windows manage the page file, or 'Custom' to specify your own size and location. |
| DriveLetter | `D:` | | False | `C:` | String/Text | Drive letter where the page file will be created (e.g., C:, D:). Defaults to the system drive if not specified. |
| InitialSizeMB | `8192` | | False | `4096` | Integer | Initial size of the page file in megabytes (MB). Used only in 'Custom' mode. Defaults to 4096 MB. |
| MaximumSizeMB | `16384` | | False | `16384` | Integer | Maximum size of the page file in megabytes (MB). Used only in 'Custom' mode. Defaults to 8192 MB. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/set-pagefile.ps1)

## Output

- Activity Details
