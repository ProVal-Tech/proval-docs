---
id: 'd97282c0-4d81-46f9-b821-d553c2d8a596'
title: 'Get Wi-Fi Profile Script for ConnectWise Automate'
title_meta: 'Get Wi-Fi Profile Script for ConnectWise Automate'
keywords: ['wifi', 'profiles', 'automate', 'script', 'edf']
description: 'This document details the implementation of the Get-WifiProfile script within ConnectWise Automate, providing instructions on its execution, required parameters, and output generated, including log files and data views.'
tags: ['networking', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script is an Automate implementation of the agnostic script [Get-WifiProfile](<../../powershell/Get-WifiProfile.md>). It retrieves details about Wi-Fi profiles stored on designated end-user machines.

## Sample Run

- For the first execution of the script, the value of the user parameter `Set_Environment` should be set to `1`. This will create the EDF, System property, and [custom table](https://proval.itglue.com/5078775/docs/12979849) used by the [Implement Wifi Profile](https://proval.itglue.com/DOC-5078775-16111352) solution:  
  ![Sample Run Image 1](../../../static/img/Get-Wifi-Profile/image_1.png)  

- Regular execution:  
  ![Sample Run Image 2](../../../static/img/Get-Wifi-Profile/image_2.png)  

## Variables

| Name               | Description                                          |
|--------------------|------------------------------------------------------|
| ProjectName        | Get-WifiProfile                                      |
| WorkingDirectory    | C:/ProgramData/_Automation/Script/Get-WifiProfile   |
| PS1Log             | C:/ProgramData/_Automation/Script/Get-WifiProfile-Log.txt |
| PS1ErrorLog        | C:/ProgramData/_Automation/Script/Get-WifiProfile-Error.txt |
| TableName          | [pvl_wifi_profiles](<../tables/pvl_wifi_profiles.md>) |

#### User Parameters

| Name               | Example | Required              | Description                                                                 |
|--------------------|---------|-----------------------|-----------------------------------------------------------------------------|
| Set_Environment     | 1       | True for the first run | It is mandatory to set this parameter to 1 for the very first execution of the script. |

## Output

- Script Log
- Dataview

