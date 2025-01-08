---
id: 'cwa-set-maintenance-mode'
title: 'Set Maintenance Mode for Reboot'
title_meta: 'Set Maintenance Mode for Reboot'
keywords: ['maintenance', 'reboot', 'windows', 'script', 'parameter']
description: 'This document provides a detailed overview of a script designed to set maintenance mode for servers and workstations before initiating an immediate reboot. Users can customize the duration of maintenance mode, and the script ensures proper handling of parameters and conditions for execution.'
tags: ['maintenance', 'windows', 'script', 'configuration', 'reboot', 'performance']
draft: false
unlisted: false
---
## Summary

This script is created to set maintenance mode for 30 minutes for servers and 15 minutes for workstations before running the shell command which will cause the machine to reboot immediately.

If the User wishes to put the time manually they can enter the time in the parameter “CustomMaintModeMin” then it will set maintenance mode for whatever duration entered.

Note: This is a maintenance-style script that is allowed to run even if a machine is in maintenance mode.

Time Saved by Automation: 5 Minutes

## Sample Run

Target: Windows Device  
![Sample Run Image](5078775/docs/8002546/images/11140140)

#### User Parameters

| Name                  | Example | Required | Description                                                                                                                                                                                                                          |
|-----------------------|---------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CustomMaintModeMin    | 60      | False    | This is the user entered parameter for the maintenance mode duration. If no value is entered, the target machine will get either a 30 minute maintenance mode (servers) or a 15 minute maintenance window (workstations). This parameter must be a numerical value. |

## Process

The script will first determine if the user parameter was filled out. If it was not filled out, the script will go to the "Then" section and use the default maintenance mode windows of 30 minutes for servers or 15 minutes for workstations. If the script determines the user parameter was filled out, the script will jump to the "Else" section of the script.

**"Then" Section**  
The script will exit with error for Non Windows OS.  
The script will enable maintenance mode for 30 minutes for servers or 15 minutes for workstations and then issue a Windows CLI command to restart the device.  
The script will then exit on success.

**"Else" Section**  
The script will exit with error for non Windows OS.  
The script will ensure that the user parameter is valid. (This parameter must be a numerical value. To have the script do a 60 minute maintenance mode, please enter 60, for example.)  
If the parameter is not valid, the script will exit with a log message indicating the value was not entered properly. Otherwise, the script will put the machine into maintenance mode for the duration entered by the user.  
The script will then issue a Windows CLI command to restart the device and then exit successfully.

## Output

Script log messages


