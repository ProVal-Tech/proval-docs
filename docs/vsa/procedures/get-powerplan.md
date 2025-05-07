---
id: '510f8406-d2d0-4ada-a92d-6837c134f43b'
slug: /510f8406-d2d0-4ada-a92d-6837c134f43b
title: 'Get-PowerPlan'
title_meta: 'Get-PowerPlan'
keywords: ['power', 'plan', 'settings', 'subgroup', 'configuration']
description: 'This document outlines a procedure to retrieve detailed information about power plans, their subgroups, and associated power settings using the powercfg command. It provides a structured output that can be logged and used for further analysis or configuration management.'
tags: ['report', 'setup', 'windows']
draft: false
unlisted: false
---

# Overview
This document retrieves information about power plans, their subgroups, and power settings. The information is logged and used in the agent procedure.

# Process
- Executes the `powercfg /list` command to get a list of available power plans.
- Iterates through each power plan in the list obtained from the previous step.
- For each power plan, extracts the GUID and queries its settings using `powercfg /query`.
- Identifies subgroups within the power plan settings by using the 'Subgroup GUID:' string as a marker.
- For each subgroup, extracts information about power settings, including GUID, name, current AC power setting, current DC power setting, and possible settings.
- Creates custom PowerShell objects for each power setting and subgroup, organizing them into a structured format.
- Assembles the information about the power plan, including its name, GUID, active status, and the subgroups with their associated power settings.
- Aggregates all the power plans with their respective subgroups and power settings into an array.
- Returns the array containing detailed information about available power plans, subgroups, and power settings.

# VSA Implementation
This agent procedure does not accept any parameters or require configuration once imported.

# Payload Usage
Retrieves information about available power plans, subgroups, and power settings.

```
./Get-PowerPlan.ps1
```

# Output
The output log can be found at:
`$env:ProgramData/_automation/AgentProcedure/GetPowerPlan/Get-PowerPlan-log.txt`

Agent Procedure Log

