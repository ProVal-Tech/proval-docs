---
id: 'cwa-automate-deploy-gpo-implementation'
title: 'Automate Deploy GPO Implementation'
title_meta: 'Automate Deploy GPO Implementation'
keywords: ['automate', 'gpo', 'deployment', 'connectwise', 'script', 'policy']
description: 'This document provides a comprehensive guide on the implementation of the Automate Deploy Group Policy Object (GPO) for ConnectWise Automate. It explains how to create both a startup script GPO and a scheduled task GPO to effectively deploy the Automate agent across devices in a network. The document includes details on user parameters, dependencies, implementation steps, and frequently asked questions.'
tags: ['gpo', 'deployment', 'connectwise', 'script', 'policy', 'windows']
draft: false
unlisted: false
---
## Summary

It is an Automate implementation of the [Install-AutomateAgentGPO.ps1](https://proval.itglue.com/DOC-5078775-10798933) agnostic script. The script can create a ConnectWise Automate Agent Deployment group policy object that will create a startup script (or a Scheduled Task) policy and apply that policy to the root forest in group policy management.

**Name of the Startup Script GPO:** `Automate-Deploy`

**Name of the Scheduled Task GPO:** `Automate-Deploy Scheduled Task`

The startup script GPO executes a PowerShell script on startup (after the computer restarts). On the other hand, the scheduled task GPO will immediately execute the PowerShell script to install/fix the Automate agent as soon as the policy applies on the computer.

## Automate-Deploy GPO

![Automate-Deploy GPO Image 1](..\..\..\static\img\Agent-Deployment---GPO\image_1.png)

![Automate-Deploy GPO Image 2](..\..\..\static\img\Agent-Deployment---GPO\image_2.png)

## Automate-Deploy Scheduled Task GPO

![Automate-Deploy Scheduled Task GPO Image 1](..\..\..\static\img\Agent-Deployment---GPO\image_3.png)

![Automate-Deploy Scheduled Task GPO Image 2](..\..\..\static\img\Agent-Deployment---GPO\image_4.png)

![Automate-Deploy Scheduled Task GPO Image 3](..\..\..\static\img\Agent-Deployment---GPO\image_5.png)

## Sample Run

**To Create a Startup Script GPO:**

![Create Startup Script GPO](..\..\..\static\img\Agent-Deployment---GPO\image_6.png)

**To Create a Scheduled Task GPO:**

![Create Scheduled Task GPO](..\..\..\static\img\Agent-Deployment---GPO\image_7.png)

## Implementation

1. Import the Automate - Agent Deployment - GPO
2. Schedule the script to run on all primary domain controllers (PDC Emulator Role) once every 11 months. (Using 11 months on a 12-month token lease will ensure that broken agents are never installed or attempted).

## User Parameters

| Name                | Example | Required | Description                                                                                   |
|---------------------|---------|----------|-----------------------------------------------------------------------------------------------|
| ScheduledTaskGPO    | 1       | False    | Set it to 1 to create a Scheduled Task GPO instead of a startup script GPO.                  |

## Dependencies

[CWM - Automate - Agnostic - Install-AutomateAgentGPO.ps1](https://proval.itglue.com/DOC-5078775-10798933)

## Output

- Script log

## FAQ

**Q.** The script was working, but now it has stopped working, why?  
**A.** The most likely cause of this situation is that the token has expired, and the script is not scheduled to run on the recommended 11-month interval.

**Q.** I have followed the steps above and I am not seeing any change to the number of devices at my client.  
**A.** For a Group Policy Object to take effect on a target machine, that target must receive a group policy update, and then because it's a startup script, the computer must restart. If either of these conditions is not met, then the group policy will not be enforced.

**Q.** Does installing the Scheduled task GPO remove the existing Startup script GPO?  
**A.** No, both `Automate-Deploy` and `Automate-Deploy Scheduled Task` are individual GPOs and do not remove/update the other while creating.


