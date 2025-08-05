---
id: 'f68df531-09b3-4b82-b183-3769c7183a8d'
slug: /f68df531-09b3-4b82-b183-3769c7183a8d
title: 'Solution- Patching - Check for WSUS Settings'
title_meta: 'Solution - Patching - Check for WSUS Settings'
keywords: ['WSUS','Windows Update','Update']
description: 'Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). The result is stored in the custom field WSUS_Status'
tags: ['update','windows','auditing']
draft: false
unlisted: false
---

## Purpose
Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). The result is stored in the custom field [WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8).

## Associated Content

| **Content**                                   | **Type**         | **Function**                                                                                                                                       |
|----------------------------------------------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| [Task - Patching - Check for WSUS Settings](/docs/93b6b4ac-5923-47c5-a382-26015f6ac0fc)          | Task             | Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). The result is stored in the custom field [WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8). |
| [WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8)                                   | Custom Field     | Stores the WSUS status discovered from the script "Patching - Check for WSUS Settings".                                                            |
| [WSUS Status Disabled](/docs/2d9af9b7-6208-43d2-82e5-23c3ab547410)                          | Dynamic Group    | Contains the agents where the WSUS status is detected as **disabled**.                                                                             |
| [WSUS Status Enabled](/docs/5ea4a43e-8802-4a56-a760-68dce9483d64)                           | Dynamic Group    | Contains the agents where the WSUS status is detected as **enabled**.                                                                              |
| [WSUS Status Not Configured](/docs/ec043f37-93f6-49c1-82cf-d4535c4332bf)                    | Dynamic Group    | Contains the agents where the WSUS status is detected as **not configured**.                                                                       |


## Implementation
- Schedule the task [Task - Patching - Check for WSUS Settings](/docs/93b6b4ac-5923-47c5-a382-26015f6ac0fc) to the Windows system as requested by the partner.
- It is recommended to run this one per month.