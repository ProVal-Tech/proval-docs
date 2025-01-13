---
id: ps-get-powerplan
title: 'Get-PowerPlan'
title_meta: 'Get-PowerPlan Command'
keywords: ['powerplan', 'settings', 'configuration', 'energy']
description: 'Documentation for the Get-PowerPlan command to retrieve information about power plans, their subgroups, and power settings.'
tags: ['configuration', 'performance', 'windows']
draft: false
unlisted: false
---
## Description
Retrieves information about power plans, their subgroups, and power settings.

## Usage
- Executes the `powercfg /list` command to get a list of available power plans.
- Iterates through each power plan in the list obtained from the previous step.
- For each power plan, extract the GUID and query its settings using `powercfg /query`.
- Identifies subgroups within the power plan settings by using the 'Subgroup GUID:' string as a marker.
- For each subgroup, extract information about power settings, including GUID, name, current AC power setting, current DC power setting, and possible settings.
- Creates custom PowerShell objects for each power setting and subgroup, organizing them into a structured format.
- Assembles the information about the power plan, including its name, GUID, active status, and the subgroups with their associated power settings.
- Aggregates all the power plans with their respective subgroups and power settings into an array.
- Returns the array containing detailed information about available power plans, subgroups, and power settings.


Retrieves information about available power plans, subgroups, and power settings.
```powershell
.\Get-PowerPlansInfo.ps1
```

## Output
Get-PowerPlansInfo-log.txt

