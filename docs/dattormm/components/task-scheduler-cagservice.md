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

Import the [attached component](../../../static/attachments/schedule-task-creation-cagservice.cpt) into Datto RMM.  
By clicking the `Import` button, the component will be added to the Datto RMM interface.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot5.webp)



## Sample Run

Go to `Automation`> `Jobs`> Click on `Create Componenet`.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot1.webp)

Into the Job section:-  
Step1:-Give the `name of the job`.  
Step2:-`select the component`.  
Step3:-`add the target`.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot2.webp)

`Schedule the job` at a particular time. `Immediately` to execute it right now.  
Set the `Expiration` to terminate the job after a certain time. `Never` to run it indefinitely.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot3.webp)

After Scheduling and setting expiration:-   
Step1:- Set the `Notification` if required.  
Step2:-`Execution`of the job as per the requirement.   
Step3:-After all of this click on `Create job`.
![Image 1](../../../static/img/docs/17055496-4065-4329-9d4a-892e28e0cf12/snapshot4.webp)


## Output

- stdOut  
- stdError  

## Attachments

[Task Scheduler - CagService](../../../static/attachments/schedule-task-creation-cagservice.cpt)