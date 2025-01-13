---
id: 'cwa-remove-sophos'
title: 'Remove Sophos Script for Automate Managed Devices'
title_meta: 'Remove Sophos Script for Automate Managed Devices'
keywords: ['sophos', 'uninstall', 'script', 'automate', 'management']
description: 'This document provides a comprehensive guide on running the Remove-Sophos.ps1 script on Automate managed devices, detailing prerequisites, parameters, and expected outcomes for successful execution.'
tags: ['software', 'uninstallation', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

Runs the Agnostic Remove-Sophos.ps1 script on a target Automate managed device.

**NOTE:** This script will fail if you do not use the SkipZap parameter and Sophos Zap is not installed.  
**NOTE:** TAMPER PROTECTION MUST BE TURNED OFF OR THIS WILL NOT WORK.

## Sample Run

### *It is recommended that you run this script with the NoSafeMode global parameter set to 0, it removes the application cleaner and results in less application remnants. Please consider running this in safe mode if possible.*

This setup will skip the removal of the Sophos Zap platform.  
![image](..\..\..\static\img\Uninstall---Sophos\image_1.png)

## Dependencies

- [SWM - Software Uninstall - Agnostic - Remove-Sophos](https://proval.itglue.com/DOC-5078775-11944799)

## Variables

No non-template variables in script.

#### Global Parameters

| Name                   | Example        | Required | Description                                                                                             |
|------------------------|----------------|----------|---------------------------------------------------------------------------------------------------------|
| ProjectName            | Remove-Sophos  | True     | The name of the agnostic script minus the .ps1                                                         |
| ExpectedSuccessReturn   | OK             | True     | This is the expected return from the agnostic script, the script will fail if the response is anything other than that. |
| NoSafeMode             | 1              | True     | Setting this to 1 will bypass the safemode reboot / reboot to normal mode after for a less certain method of removal. |

#### User Parameters

| Name       | Example              | Required | Description                                                                                             |
|------------|----------------------|----------|---------------------------------------------------------------------------------------------------------|
| Arguments  | -SkipZap -Force      | False    | The arguments you would pass if you were to run this script agnostically.                             |

## Output

- Script log

## FAQ

- The script failed but Sophos was actually removed
  - This can happen if you run the script without the -force parameter then see that the uninstall recommended the force parameter and then ran the script again on that same machine with the force parameter.

- There are a lot of leftover files on the target computer.
  - The cleanest method of removal is to set the Arguments parameter to -force, remembering that you should be using -SkipZap if Zap is not installed with the NoSafeMode set to 0.


