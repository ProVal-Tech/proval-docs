---
id: ps-invoke-restartservice
title: 'Invoke-RestartService'
title_meta: 'Invoke-RestartService Command'
keywords: ['restart', 'service', 'taskkill', 'errorhandling']
description: 'Documentation for the Invoke-RestartService command to simultaneously restart multiple services with proper error handling.'
tags: ['configuration', 'windows', 'performance']
draft: false
unlisted: false
---
## Description
Provide a Script that will simultaneously restart multiple services and provide proper error handling.

Features:   
1. Take no action on disabled services.
2. In the event that a service can not be stopped normally that service's pid is obtained and used in a forced taskkill command.
The results of that command are used to either restart the service if it's stopped, or log an error.

## Usage
1. Start the restart service jobs if not disabled.
2. Wait until all jobs finish.
3. Get the job results 
    1. If Success log success.
    2. If failure get the PID and use a forced taskkill to attempt to stop the service.
        1. If taskkill is successful, restart the service by name, then wait 60 seconds and check the state of the service.
            1. If still running log as success.
            2. If failed log failure
        2. If taskkill is not successful, log failure.
4. Remove any created jobs.
5. Return the results.



```powershell
.\Invoke-RestartService.ps1 -ServiceNames SAAZDPMACTL, SAAZWatchDog, SAAZServerPlus, SAAZScheduler
```
Restarts the SAAZDPMACTL, SAAZWatchDog, SAAZServerPlus, SAAZScheduler services and verifies successful completion.


## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ServiceNames`    |       | True      |           | String[]    | A String array of service names to restart.                                          |

## Output
Location of output for log, result, and error files.
    [System.Object]
    .\Invoke-RestartService-log.txt

