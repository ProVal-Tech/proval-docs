---
id: 'cwa-collect-device-info'
title: 'Collect Device Information Script'
title_meta: 'Collect Device Information Script for Windows Agents'
keywords: ['device', 'version', 'windows', 'sql', 'automation']
description: 'This document provides details on a script that collects device name and version information for specified devices on Windows agents, optimizing the data collection process and saving time through automation.'
tags: ['windows', 'database', 'report', 'performance', 'configuration']
draft: false
unlisted: false
---
## Summary

This script collects information of device name and version as provided for the parameter “Device” while executing the script.

Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](5078775/docs/8170654/images/11372959)

## Dependencies

@Hardware - PnPDevice List [Script]

## Variables

| Variable Name | Description |
|---------------|-------------|
| NameLoop      | This variable will hold the result of the SQL query select CONCAT('@','DriverVersion',@loopcounter,'@') |
| DriverLoop    | This variable will host the result of the SQL query select CONCAT('@','DriverVersion',@loopcounter,'@') |

#### Global Parameters

| Name   | Example      | Required | Description                                                                                                     |
|--------|--------------|----------|-----------------------------------------------------------------------------------------------------------------|
| Device | HP Printer   | True     | Provide the device name for which you need their version info on all of your windows agents to show in the Dataview. |

## Script States

| Script State Name        | Description                          |
|--------------------------|--------------------------------------|
| [DeviceList@loopcounter@](DeviceList@loopcounter@) | This script state will hold the @NameLoop@ -- @DriverLoop@ |

## Process

This script collects information of device name and version as provided for the parameter “Device” while executing the script. The script runs Powershell to get the Device Name and device version and splits the variables. Then runs the SQL commands to get the results and holds the results in script state.

## Output

- Dataview


