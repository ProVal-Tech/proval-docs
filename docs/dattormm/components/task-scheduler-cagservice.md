---
id: '17055496-4065-4329-9d4a-892e28e0cf12'
slug: /17055496-4065-4329-9d4a-892e28e0cf12
title: 'Scheduled Task Creation -  CagService'
title_meta: 'Scheduled Task Creation -  CagService'
keywords: ['datto', 'task', 'cagservice']
description: 'This component creates a `Scheduled task` to ensure the Datto RMM service (CagService) starts automatically on a daily basis.'
tags: ['windows','datto']
draft: false
unlisted: false
---

## Overview

This component creates a `Scheduled Task` in Task Scheduler to ensure the Datto RMM service (CagService) starts automatically on a daily basis.

## Implementation

1. Import the `Component` [Scheduled Task Creation -  Cagservice](../../../static/attachments/schedule-task-creation-cagservice.cpt) into Datto RMM.  
2. Download the attached file > Click on the `Import` button > Select the component to add to the Datto RMM interface.  

![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot5.webp)



## Sample Run

Go to `Automation`> `Jobs`> Click on `Create Job`.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot1.webp)

Into the Job section:-  
- Step1: Specify the `Name` of the job.  
- Step2: Under the `Components` section, select the `Schedule Task Creation -  Cagservice` component using `Add Component` button.  
- Step3: Under the `Targets` section, click on `Add target` button to add device or groups as target.  

![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot2.webp)

- `Schedule` the job at a particular time. Select `Immediately` from `Recurrence` dropdwon to execute it right now.  
- Set the `Expiration` to terminate the job after a certain time.  Select `Never` to run it indefinitely.  

![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot3.webp)

After Scheduling and setting expiration:-   
- Step1: Set the `Notification` if required.  
- Step2: Set the `Execution` of the job as per the requirement.   
- Step3: Click on `Create job`.  

![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot4.webp)


## Output

- stdOut  
- stdError  

## Attachments

[Scheduled Task Creation -  Cagservice](../../../static/attachments/schedule-task-creation-cagservice.cpt)