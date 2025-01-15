---
id: ps-remove-powerplan
title: 'Remove-PowerPlan'
title_meta: 'Remove-PowerPlan Command'
keywords: ['remove', 'powerplan', 'configuration', 'energy']
description: 'Documentation for the Remove-PowerPlan command to remove a specified Power Plan from the computer.'
tags: ['configuration', 'windows', 'performance']
draft: false
unlisted: false
---
## Description
Removes the specified Power Plan from the computer.

## Requirements
The Power Plan should exist on the computer.

## Usage
- The script expects a mandatory parameter `Name,` which specifies the desired Power Plan`s name.
- Retrieves a list of available Power Plans using `powercfg /list.`
- Creates an array of Power Plans, including their names, GUIDs, and active status.
- Verifies if the specified Power Plan (`Name`) exists in the array of available Power Plans.
- If the specified Power Plan exists, retrieves its GUID.
- Attempts to remove the power plan using `powercfg /delete` $planGUID.
- Handles errors and exceptions during the removal process.


Removes the `Balanced` Power Plan from the computer.

```powershell
   PS C:\> .\Remove-PowerPlan.ps1 -Name 'Balanced'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                    |
| ----------------- | ----- | --------- | --------- | --------- | ---------------------------------------------- |
| `Name`            |       | True      |           | String    | Name of the existing Power Plan to be removed. |

## Output
    .\Remove-PowerPlan-log.txt
    .\Remove-PowerPlan-Error.txt




