---
id: '09fb13cb-05b1-4515-8041-128689d933ff'
slug: /09fb13cb-05b1-4515-8041-128689d933ff
title: 'Get-AutopilotHash'
title_meta: 'Get-AutopilotHash'
keywords:  ['autopilot', 'hash', 'device', 'registration']
description: 'This the RMMM version of Automate script [Get-AutopilotHash](/docs/9171549a-070a-4346-be90-393416713806)'
tags: ['setup']
draft: False
unlisted: false
---

## Summary

This the RMM version of Automate script [Get-AutopilotHash](/docs/9171549a-070a-4346-be90-393416713806). It retrieves the Hardware Hash required for Autopilot device registration.

Note: The Hardware Hash cannot be stored in a custom field due to character limitations. Check the script logs to view the Hash key of a device.

## Sample Run

![Sample Run](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image5.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Create Script](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_3.webp)  
![Script Creation](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_4.webp)

**Name:** Get - Autopilot Hash
**Description:** This task retrieves the Hardware Hash for Autopilot device registration.
**Category:** Custom  
![Category](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image1.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_11.webp)

A blank function will appear.  
![Blank Function](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_12.webp)

### Row 1 Function: CMD Script

Search and select the `Command Prompt Script` function.  
![CMD Function](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image2.webp)

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image3.webp)

Paste in the following Command and set the expected time of script execution to 300 seconds. Click the `Save` button.

```Shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "try {$session = New-CimSession;$devDetail = Get-CimInstance -CimSession $session -Namespace root/cimv2/mdm/dmmap -Class MDM_DevDetail_Ext01 -Filter \"InstanceID='Ext' AND ParentID='./DevDetail'\";if ($devDetail) {$hash = $devDetail.DeviceHardwareData } else {$hash = ''};if ($hash -match '^[A-Za-z0-9+/=,.\-\s]+$') {$hash} else { throw 'Failed to fetch Autopilot Hash'}}catch { return 'Failed to fetch Autopilot Hash'}"
```

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Script Log](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_15.webp)

## Completed Task
![Completed Task](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image4.webp)

## Output

- Script Logs