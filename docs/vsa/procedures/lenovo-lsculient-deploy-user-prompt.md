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

## Note: `If an argument contains double quotes ("), they must be escaped by using them twice (""silent""). Otherwise, the command will not execute correctly.`

## Dependencies

[Install-LenovoUpdates](/docs/3640e534-d089-4304-89ba-68d3bc113978)

## Sample Run

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo-samplerun1.webp)

![SampleRun1](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/lenovo2.webp)

## Parameters

Valid parameters: The valid values are `'All', 'Application', 'BIOS', 'Driver', 'Firmware'`. We can use them as per below examples.

| Parameter         | Required  | Excample            | Type      | Description                                                                 |
|-------------------|-----------|----------------------|-----------|----------------------------------------------------------------------------|
| `Argument`        | false |  ---    |    | Leave scan and and it will give the available updates details. |
| `Argument`        | True  | `-Type All`    | String    | Installs `ALL` updates. |

### Examples

1. **Default scan operation**: If executing the script without any arguments it will only scan.

   ![blank argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/blank.webp)

2. **Apply driver updates silently**: To perform an update action (for example, silent install of    recommended driver updates):

   `-Type Drivers`

   ![driver argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/driver%20update.webp)

3. **Apply Firmware updates silently**:To perform an update action (for example, silent install of recommended firmware updates):

   `-Type Firmware`

   ![Firmware argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/firmware.webp)

4. **Apply All updates silently** :To perform an update action (for example, silent install of all available updates):

    `-Type All`

    ![All argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/all.webp)

5. **Apply BIOS,Driver,application,firmware updates silently** :To perform an update action (for example, silent install of BIOS,Driver,application,firmware -NoRebootavailable updates):

    `-Type BIOS,Driver,application,firmware -NoReboot`

    ![BIOS Driver application firmware argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/driver,application,bios,firmware.webp)

6. **Apply BIOS updates silently** :To perform an update action (for example, silent install BIOS available updates):

    `-Type BIOS`

    ![Bios argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/bios.webp)

7. **Apply Application updates silently** :To perform an update action (for example, silent install of Application available updates):

    `-Type Application`

    ![Application argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/application.webp)

8. **Apply BIOS, Driver updates silently** :To perform an update action (for example, silent install BIOS, Driver  available updates):

    `-Type BIOS, Driver -NoReboot`

    ![BIOS Driver argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/driver,bios.webp)

9. **Apply specific updates silently** :To perform an update action (for example, silent install BIOS, Driver  available updates):

    `-Type 'n3ch101w_bisbnk919kse', 'pcieeth06w_w11'`

    ![specific updates argument](../../../static/img/docs/0454bb04-e771-4443-9285-6a17f3f9fea9/id.webp)

## Output

- Script Logs

- `C:\ProgramData\_automation\AgentProcedure\DellCommandUpdate\Install-LenovoUpdates-log.txt`

- `C:\ProgramData\_automation\AgentProcedure\DellCommandUpdate\Install-LenovoUpdates-error.txt`
