---
id: '05737947-e8d5-4711-a1d7-91a6db43358f'
slug: /05737947-e8d5-4711-a1d7-91a6db43358f
title: 'Set-PowerPlan'
title_meta: 'Set-PowerPlan'
keywords: ['powerplan', 'settings', 'configuration', 'energy']
description: 'Documentation for the Set-PowerPlan command to configure power plan settings using a provided hashtable or CSV file.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description

Configures power plan settings using either a provided hashtable or CSV file. If the specified power plan does not exist, it will be created.

## Requirements

- PowerPlanSettingsTemplate.csv

## Usage

- Ensures mandatory parameters are provided and validates the parameter's format and structure.
- Retrieves available power plans using `powercfg /list`.
- Checks if the specified power plan (`$Name`) exists.
- If not, duplicates the active plan and renames it to the specified name.
- Retrieves current settings of the power plan.
- If a download URL is provided for `$CSVPath`, downloads and converts the CSV file to a PowerShell object.
- If a local computer path is provided for `$CSVPath`, converts the contents of the CSV file to a PowerShell object.
- If using a hashtable (`$Setting`), creates an array of settings based on the hashtable structure.
- Iterates through each setting in the configuration.
- Retrieves GUIDs for the subgroup and power setting from the current power plan settings.
- Uses `powercfg` commands to set AC and DC values for the specified subgroup and power setting.
- Logs success or error messages for each configuration attempt.

Configures a custom power plan named 'CustomPlan' with specified AC and DC power settings.

```powershell
PS C:> .\Set-PowerPlan.ps1 -Name 'CustomPlan' -Setting @{Subgroup=@{'Sleep' = @{ PowerSetting = @{ 'Sleep after' = @{ AC = 60; DC = 60 }; 'Allow hybrid sleep' = @{ AC = 1; DC = 100}; 'Hibernate After' = @{ AC = 0; DC = 18000}; 'Allow Wake Timers' = @{ AC = 2; DC = 2 }}}}}
```

Configures a custom power plan named 'CustomPlan' with specified AC and DC power settings from the `$Settings` hashtable.

```powershell
PS C:> $setting = @{
    Subgroup = @{
        'Hard Disk' = @{
            PowerSetting = @{
                'Turn off hard disk after' = @{
                    AC = 0
                    DC = 0
                }
            }
        }
        'Internet Explorer' = @{
            PowerSetting = @{
                'JavaScript Timer Frequency' = @{
                    AC = 1
                    DC = 0
                }
            }
        }
        'Sleep' = @{
            PowerSetting = @{
                'Sleep after' = @{
                    AC = 60
                    DC = 60
                }
                'Allow hybrid sleep' = @{
                    AC = 1
                    DC = 100
                }
                'Hibernate After' = @{
                    AC = 0
                    DC = 18000
                }
                'Allow Wake Timers' = @{
                    AC = 2
                    DC = 2
                }
            }
        }
        'Intel(R) Graphics Settings' = @{
            PowerSetting = @{
                'Intel(R) Graphics Power Plan' = @{
                    AC = 2
                    DC = 2
                }
            }
        }
        'AMD Power Slider' = @{
            PowerSetting = @{
                Overlay = @{
                    DC = 2
                    AC = 2
                }
            }
        }
    }
}
PS C:> .\Set-PowerPlan.ps1 -Name 'CustomPlan' -Setting $Settings
```

Configures a custom power plan named 'CustomPlan' with specified AC and DC power settings from the 'CustomPlanTemplate.csv' file located in the 'C:/Temp' directory.

```powershell
PS C:> .\Set-PowerPlan.ps1 -Name 'CustomPlan' -CSVPath 'C:\temp\CustomPlanTemplate.csv'
```

Configures a custom power plan named 'CustomPlan' with specified AC and DC power settings from the 'CustomPlanTemplate.csv' downloaded from 'https://file.provaltech.com/CustomPlanTemplate.csv'.

```powershell
PS C:> .\Set-PowerPlan.ps1 -Name 'CustomPlan' -CSVPath 'https://file.provaltech.com/CustomPlanTemplate.csv'
```

## Parameters

| Parameter         | Alias | Required  | ParameterSetName   | Type      | Description                                                                                                                                      |
| ----------------- | ----- | --------- | -----------------  | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------|
| `Name`            |       | True      | hashtable, csv     | String    | Specifies the name of the power plan to configure.                                                                                               |
| `CSVPath`         |       | True      | hashtable          | String    | Specifies the path to a CSV file containing the power plan configuration, which can be either a local file on the computer or a download URL.    |
| `Setting`         |       | True      | hashtable          | HashTable | Specifies a hashtable containing the configuration for the power plan.                                                                           |

## Output

- .\Set-PowerPlan-log.txt
- .\Set-PowerPlan-Error.txt

## Attachments
[PowerPlanSettingsTemplate.csv](<../../static/attachments/itg/14903184/PowerPlanSettingsTemplate.csv>)