---
id: 'd97282c0-4d81-46f9-b821-d553c2d8a596'
slug: /d97282c0-4d81-46f9-b821-d553c2d8a596
title: 'Get Wifi Profile'
title_meta: 'Get Wifi Profile'
keywords: ['wifi', 'profiles', 'automate', 'script', 'edf']
description: 'This document details the implementation of the Get-WifiProfile script within ConnectWise Automate, providing instructions on its execution, required parameters, and output generated, including log files and data views.'
tags: ['networking', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script is an Automate implementation of the agnostic script [Get-WifiProfile](/docs/478f97f0-d069-4f50-9b93-2c9ca9ec63cd). It retrieves details about Wi-Fi profiles stored on designated end-user machines.

## Sample Run

- For the first execution of the script, the value of the user parameter `Set_Environment` should be set to `1`. This will create the EDF, System property, and [custom table](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82) solution:  
  ![Sample Run Image 1](../../../static/img/docs/d97282c0-4d81-46f9-b821-d553c2d8a596/image_1.png)  

- Regular execution:  
  ![Sample Run Image 2](../../../static/img/docs/d97282c0-4d81-46f9-b821-d553c2d8a596/image_2.png)  

## Variables

| Name               | Description                                          |
|--------------------|------------------------------------------------------|
| ProjectName        | Get-WifiProfile                                      |
| WorkingDirectory    | C:/ProgramData/_Automation/Script/Get-WifiProfile   |
| PS1Log             | C:/ProgramData/_Automation/Script/Get-WifiProfile-Log.txt |
| PS1ErrorLog        | C:/ProgramData/_Automation/Script/Get-WifiProfile-Error.txt |
| TableName          | [pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3) |

#### User Parameters

| Name               | Example | Required              | Description                                                                 |
|--------------------|---------|-----------------------|-----------------------------------------------------------------------------|
| Set_Environment     | 1       | True for the first run | It is mandatory to set this parameter to 1 for the very first execution of the script. |

## Output

- Script Log
- Dataview


