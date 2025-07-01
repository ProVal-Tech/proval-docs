---
id: '17055496-4065-4329-9d4a-892e28e0cf12'
slug: /17055496-4065-4329-9d4a-892e28e0cf12
title: 'Task Scheduler - CagService'
title_meta: 'Task Scheduler - CagService'
keywords: ['datto', 'task', 'cagservice']
description: 'This script creates a scheduled task to ensure the Datto RMM service (CagService) starts automatically on a daily basis.'
tags: ['windows','datto']
draft: false
unlisted: false
---

## Overview

This script creates a scheduled task to ensure the Datto RMM service (CagService) starts automatically on a daily basis.

## Implementation

Import the `Component` [Schedule Task Creation -  Cagservice](../../../static/attachments/schedule-task-creation-cagservice.cpt) into Datto RMM.  
Download the attached file > Click on the `Import` button > Select the component to add to the Datto RMM interface.  

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

[Schedule Task Creation -  Cagservice](../../../static/attachments/schedule-task-creation-cagservice.cpt)