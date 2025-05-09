---
id: 'cb7a9cf6-e5ea-40db-8249-2daec21d793d'
slug: /cb7a9cf6-e5ea-40db-8249-2daec21d793d
title: 'Ensure Ninja Service is Running'
title_meta: 'Ensure Ninja Service is Running'
keywords: ['Ninja','Service','NinjaRMMAgent']
description: 'This Script creates a scheduled task that will make sure ninja service is running at the startup.'
tags: ['windows']
draft: False
unlisted: false
---

## Overview
This Script creates a scheduled task that will make sure ninja service is running at the startup.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select Deploy `Ensure Ninja Service is Running`
![SampleRun1](../../../static/img/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d/image1.webp)

Sample run to make sure Ninja Service is running at startup
![SampleRun1](../../../static/img/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d/image2.webp)

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step2.webp)

The scripting window will open.  
![ScriptingScreen](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/scriptingscreen.webp)

### Step 3

Configure the `Create Script` section as follows:

`Name`: Ensure Ninja Service is Running  
`Description`: This Script creates a scheduled task that will make sure ninja service is running at the startup.  
`Categories`: ProVal  
`Language`: PowerShell  
`Operating System`: Windows  
`Architecture`: All  
`Run As`: System  
![SampleRun1](../../../static/img/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d/image3.webp)


### Step 4

Paste the following Shell script in the scripting section:
```
$serviceName = "NinjaRMMAgent"
$actionScript = @"
if ((Get-Service -Name $serviceName).Status -ne 'Running') {
    Start-Service -Name $serviceName}
"@

$scriptPath = "$env:ProgramData\StartNinjaService.ps1"
Set-Content -Path $scriptPath -Value $actionScript -Force
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest
Register-ScheduledTask -TaskName "EnsureNinjaServiceRunning" -Action $action -Trigger $trigger -Principal $principal -Description "Ensure NinjaRMM Agent service is running on startup." -Force

```
![SampleRun1](../../../static/img/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d/image4.webp)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation
![SampleRun1](../../../static/img/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d/image5.webp)

## Output

- Activity Details  
