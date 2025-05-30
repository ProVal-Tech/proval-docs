---
id: '8ace140f-74d7-49cb-b9aa-90cf098629fc'
slug: /8ace140f-74d7-49cb-b9aa-90cf098629fc
title: 'PowerShell Environment Setup Verification'
title_meta: 'PowerShell Environment Setup Verification'
keywords: ['environment', 'verification', 'uac', 'admin', 'powershell', 'path', 'version']
description: 'This document outlines a script that checks for necessary environmental conditions before executing other scripts. It verifies Admin Approval Mode, UAC settings, environmental path variables, and PowerShell version to ensure that the target machine meets the required criteria for successful script execution.'
tags: ['performance', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will return a failed state if certain environmental conditions are not present. This script handles:

1. Admin Approval Mode being set to a level where an administrator account would need to supply credentials when running elevated commands.
2. UAC being set to enabled.
3. The addition of the supplied required path (defaulted to the PowerShell folder in Windows, as this is the most common required location) to the target machine.
4. If the PowerShell version does not meet the required PowerShell version set in the global variable (defaulted to 5.1).

## Sample Run

Although this script can be run to determine minimum requirements or environmental path variable settings, it is intended to be called by a parent script as a pre-check for script requirements.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Set-PathVariable](/docs/f91caf21-f00c-4459-8b1f-634720a92f4b)

## Variables

| Name                       | Description                                                                                                                                                                                                                   |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Log Var                    | A running log of what is being checked and its state.                                                                                                                                                                        |
| Violation                  | The result of the question: does the target machine's current state satisfy the necessary requirement of the calling script?                                                                                                |
| Violations                 | A running list of anything found with a violation of true.                                                                                                                                                                   |
| AdminApprovalModeViolations | Will be true if the local security policy object 'MACHINE/Software/Microsoft/Windows/CurrentVersion/Policies/System/ConsentPromptBehaviorAdmin' is set to either 1 or 3. These settings mean that an admin account, when running an elevated command, will be prompted for credentials to continue. |
| LUA Enabled                | Will be 1 or 0; 1 for enabled, 0 for disabled, reflecting the UAC setting on the computer. A failure here may not always prevent a script from running but could if the command requires elevation, and the Admin Approval Mode is set to a high enough level. Depending on the script, we may want to verify this, so it is added and will reflect a failure if UAC is turned on. |
| Scope                      | This is a required variable for the [EPM - Windows Configuration - Script - Set-Environmental Path Variable](/docs/838d8f61-038e-4569-aaf1-c72a1072670a) script and is used to add any required path variables to the target. Note: this script will not fail if the required path variable is not present; it will add it if it's not present. |
| Path                       | This is a required variable for the [EPM - Windows Configuration - Script - Set-Environmental Path Variable](/docs/838d8f61-038e-4569-aaf1-c72a1072670a) script and is used to add any required path variables to the target. It is equal to the global parameter RequiredPathVar, which can be set in this global parameter or in any parent script calling this script. |
| SatisfiesPsVersion        | Will be true if the target machine's PowerShell version is equal to or greater than the global parameter PsMinimumVersion, which can be set globally on this script or set in a parent script if a different value is desired. |

#### Global Parameters

| Name               | Example                            | Required | Description                                                                                                                                                                                                                                                                                                                                                   |
|--------------------|------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PsMinimumVersion    | 5.0                               | True     | This is a global PowerShell minimum version that this script will default to. Currently, it is set to 5.0; however, as time goes on and we move to newer versions, we can change this to match the minimum PowerShell version we require moving forward. When calling this script, if you set a script variable as PsMinimumVersion with a value other than the default, the calling script's variable will take precedence over the global variable. |
| RequiredPathVar     | C:/Windows/System32/WindowsPowerShell/v1.0 | True     | This is a global environmental path variable; it is defaulted to 'C:/Windows/System32/WindowsPowerShell/v1.0' as the most common issue when calling powershell.exe is that this particular path is not present in the system's environmental path variable. When calling this script, if you set a script variable as RequiredPathVar with a value other than the default, the calling script's variable will take precedence over the global variable. |
| Skip AAM            | 1, 0                              | False    | Setting this to 1 will skip the Admin Approval Mode check.                                                                                                                                                                                                                                                                                                   |
| Skip UAC            | 1, 0                              | False    | Setting this to 1 will skip the UAC check.                                                                                                                                                                                                                                                                                                                   |
| Skip EPV            | 1, 0                              | False    | Setting this to 1 will skip the setting of the Environmental Path variable.                                                                                                                                                                                                                                                                                 |
| Skip PSVC           | 1, 0                              | False    | Setting this to 1 will skip the PowerShell version check.                                                                                                                                                                                                                                                                                                   |

## Output

In a parent script, we are looking for a variable to be created from this script. That variable is named 'FinishStatus'. If FinishStatus comes back as false, then this script has failed, and something required is not met.

In the logs for the calling script, you should see the following log on failure:

```
~~~~~~~~~~ Sub Script ~~~~~~~~~~~~~

Script:  Environment Setup Verification
RunTime : 1/27/2023 9:04:17 AM
Target: DESKTOP-CKSGDL7

_______________________________________________

Checking Admin approval mode : 
If Admin approval mode is enabled, you may receive an error where required privileges are not held.
Admin Approval Mode violation is : False

_____________________________________________

Checking UAC settings : 
If UAC is enabled, you may receive an error where required privileges are not held.
UAC state is: 1

UAC state is considered a violation as it is active.
_______________________________________________

Environmental Path check for Path : C:/Windows/System32/WindowsPowerShell/v1.0
If the path does not exist, it will be added to the machine scope environmental variable.
The machine-wide environmental path variable is as follows:

C:/Windows/system32;C:/Windows;C:/Windows/System32/Wbem;C:/Windows/System32/WindowsPowerShell/v1.0/;C:/Windows/System32/OpenSSH/;C:/Program Files/dotnet/;
C:/Windows/System32/WindowsPowerShell/v1.0

_______________________________________________

PowerShell Minimum Version is set to 5.1
DESKTOP-CKSGDL7's PowerShell version satisfies the requirements of the developed script:  True

_______________________________________________

Environmental tests failed for the following issues - 

UAC Status
```