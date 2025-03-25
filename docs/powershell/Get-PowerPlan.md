---
id: '4d7993ab-1fa8-4b96-9f19-f503737ea015'
slug: /4d7993ab-1fa8-4b96-9f19-f503737ea015
title: 'Get-PowerPlan'
title_meta: 'Get-PowerPlan'
keywords: ['powerplan', 'settings', 'configuration', 'energy']
description: 'Documentation for the Get-PowerPlan command to retrieve information about power plans, their subgroups, and power settings.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
Retrieves information about power plans, their subgroups, and power settings.

## Usage
- Executes the `powercfg /list` command to get a list of available power plans.
- Iterates through each power plan in the list obtained from the previous step.
- For each power plan, extracts the GUID and queries its settings using `powercfg /query`.
- Identifies subgroups within the power plan settings by using the 'Subgroup GUID:' string as a marker.
- For each subgroup, extracts information about power settings, including GUID, name, current AC power setting, current DC power setting, and possible settings.
- Creates custom PowerShell objects for each power setting and subgroup, organizing them into a structured format.
- Assembles the information about the power plan, including its name, GUID, active status, and the subgroups with their associated power settings.
- Aggregates all the power plans with their respective subgroups and power settings into an array.
- Returns the array containing detailed information about available power plans, subgroups, and power settings.

To retrieve information about available power plans, subgroups, and power settings, run the following command:

```powershell
.\\Get-PowerPlansInfo.ps1
```

## Output
The output will be saved in `Get-PowerPlansInfo-log.txt`.


