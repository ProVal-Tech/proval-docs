---
id: ps-enable-powerplan
title: 'Enable-PowerPlan'
title_meta: 'Enable-PowerPlan Command'
keywords: ['enable', 'powerplan', 'profile', 'configuration']
description: 'Documentation for the Enable-PowerPlan command to set the specified Power Plan as the active Power Profile.'
tags: ['configuration', 'performance', 'windows']
draft: false
unlisted: false
---
## Description
Sets the specified Power Plan as the active Power Profile.

## Requirements
Ensure that the specified Power Plan is present on the computer before executing the script.

## Usage
- The script expects a mandatory parameter `Name,` which specifies the desired Power Plan`s name.
- Retrieves a list of available Power Plans using `powercfg /list.`
- Creates an array of Power Plans, including their names, GUIDs, and active status.
- Verifies if the specified Power Plan (`Name`) exists in the array of available Power Plans.
- If the specified Power Plan exists, retrieves its GUID.
- Attempts to set the identified Power Plan as the active Power Profile using `powercfg /setactive.`
- Logs success or failure messages based on whether the Power Plan activation was successful.


Sets the `High Performance` Power Plan as the active Power Profile.
```powershell
.\Set-ActivePowerPlan.ps1 -Name 'High Performance'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                                                |
| ----------------- | ----- | --------- | --------- | --------- | -------------------------------------------------------------------------- |
| `Name`            |       | True      |           | String    | Specifies the name of the Power Plan to be set as the active Power Profile.|

## Output
    .\Enable-PowerPlan-Log.txt
    .\Enable-PowerPlan-Error.txt

