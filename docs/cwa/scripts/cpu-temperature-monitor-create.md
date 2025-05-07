---
id: '7519f655-224b-4c95-b716-773f59cb7314'
slug: /7519f655-224b-4c95-b716-773f59cb7314
title: 'CPU Temperature Monitor - Create'
title_meta: 'CPU Temperature Monitor - Create'
keywords: ['cpu', 'temperature', 'monitoring', 'windows', 'alerts', 'edfs']
description: 'This document outlines a script designed for establishing a remote monitoring system specifically for tracking CPU temperature on Windows computers. It details the setup process, usage instructions, and configuration options for effective monitoring and alerting.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to establish a remote monitoring system for Windows computers, specifically focusing on tracking CPU temperature. The script utilizes the [**`CPUTempMon.exe`**](https://proval.itglue.com/attachments/13313008) tool to monitor CPU temperatures and generate alerts if any sensor consistently records temperatures exceeding the permissible limit.

**Tool Placement:**
- Save the [**`CPUTempMon.exe`**](https://proval.itglue.com/attachments/13313008) file in the `LTShare` directory (or `Webdav` for hosted partners) under the path `Transfer/Tools/CPUTempMon/CPUTempMon.exe`.
- Create the `CPUTempMon` folder, place the [**`CPUTempMon.exe`**](https://proval.itglue.com/attachments/13313008) file, unblock the file if it's blocked, and execute an `iisreset` command after placing the file.

![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_1.png)

**IIS Reload for Hosted Partners:**
- Hosted partners can utilize the `IIS Reload` option under `Server Status` after completing the tool placement to ensure proper functionality.

![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_2.png)  
![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_3.png)

**Temperature Threshold Calculation:**
- The permissible limit is determined by subtracting the defined `offset` in Automate. This `offset` can be set either in the system property or the client-level EDF.

**Understanding EDFs and System Properties:**
- Familiarize yourself with the Extra Data Fields (EDFs) and system properties explained in this document to ensure seamless usage of the solution.

**Note:**
- It's crucial to follow the specified directory structure and initiate an `iisreset` after placing the tool.
- The [**`CPUTempMon.exe` tool**](https://proval.itglue.com/attachments/13313008) is attached to this document.

## Sample Run

**First Run:** For the initial run, you must execute the script with the `Set_Environment` parameter set to 1. This is necessary for importing/creating the EDFs and system properties utilized by the solution.

![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_4.png)

**Regular Execution:**  
![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_5.png)

**With Force Parameter:** The script’s general function is to compare the monitor set currently installed on the machine with the configuration in the EDFs and system properties. If discrepancies are detected, the monitor will be re-created. However, the force switch can be used to forcefully re-create the monitor set.

![Image](../../../static/img/docs/7519f655-224b-4c95-b716-773f59cb7314/image_6.png)

## Variables

| Name                    | Description                                               |
|-------------------------|-----------------------------------------------------------|
| ProjectName             | CPUTempMon                                               |
| WorkingDirectory         | C:/ProgramData/_Automation/Script/CPUTempMon            |
| DownloadURL             | [https://redirhostname/labtech/transfer/Tools/CPUTempMon/CPUTempMon.exe](https://redirhostname/labtech/transfer/Tools/CPUTempMon/CPUTempMon.exe) |
| ToolPath                | C:/ProgramData/_Automation/Script/CPUTempMon/CPUTempMon.exe |
| ScriptPath              | C:/ProgramData/_Automation/Script/CPUTempMon/CPUTempMon.ps1 |

## User Parameters

| Name                | Example | Required                              | Description                                                                                                                                                                                                 |
|---------------------|---------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment      | 1       | True (For First Run of the script)   | For the initial run, you must execute the script with the `Set_Environment` parameter set to 1. This is necessary for importing/creating the EDFs and system properties utilized by the solution.             |
| Force                | 1       | False                                 | The script’s general function is to compare the monitor set currently installed on the machine with the configuration in the EDFs and system properties. If discrepancies are detected, the monitor will be re-created. However, the force switch can be used to forcefully re-create the monitor set. |

## System Properties

| Name                           | Example | Required | Description                                                                                                                                                                                                 |
|--------------------------------|---------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CPUTempMon_Enable_Servers      | 1       | True     | To enable or disable server monitoring, use 1 or 0 respectively. By default, the setting is 1 (enabled).                                                                                                   |
| CPUTempMon_Enable_Workstations  | 1       | True     | To enable or disable workstation monitoring, use 1 or 0 respectively. By default, the setting is 1 (enabled).                                                                                             |
| CPUTempMon_Interval_Seconds    | 300     | True     | Run time interval in seconds of the monitor set. Default value is 300.                                                                                                                                  |
| CPUTempMon_Offset              | 10      | True     | This number represents the number of Celsius degrees to subtract from the maximum temperature allowed by the vendor for a sensor, in order to calculate the monitoring threshold or permissible limit.          |
| CPUTempMon_AlertTemplate_Servers | 172    | True     | This refers to the ID of the alert template that will be applied to the remote monitor for servers. By default, the script will attempt to set the ID of the `△ Custom - Ticket Creation - Computer` alert template. |
| CPUTempMon_AlertTemplate_Workstations | 172 | True     | This refers to the ID of the alert template that will be applied to the remote monitor for workstations. By default, the script will attempt to set the ID of the `△ Custom - Ticket Creation - Computer` alert template. |

## Client-Level EDF

| Name                          | Example               | Type      | Description                                                                                                                                                                                                 |
|-------------------------------|----------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CPUTempMon_Exclude_Servers    | Marked or Unmarked    | Check-Box | Mark this EDF if you want to exclude the servers of the client from the CPU Temperature monitoring solution.                                                                                              |
| CPUTempMon_Exclude_Workstations | Marked or Unmarked    | Check-Box | Mark this EDF if you want to exclude the workstations of the client from the CPU Temperature monitoring solution.                                                                                          |
| CPUTempMon_Offset              | 20                   | Text      | This can be used to override the value stored in the system property `CPUTempMon_Offset` for a specific client’s machine.                                                                                 |
| CPUTempMon_AlertTemplate_Servers | 1                   | Text      | This can be used to override the value stored in the system property `CPUTempMon_AlertTemplate_Servers` for a specific client’s machine. Best use case scenario is to disable the alerting for a specific client's servers. |
| CPUTempMon_AlertTemplate_Workstations | 1               | Text      | This can be used to override the value stored in the system property `CPUTempMon_AlertTemplate_Workstations` for a specific client’s machine. Best use case scenario is to disable the alerting for a specific client's workstations. |

## Location-Level EDF

| Name                          | Example               | Type      | Description                                                                                                                                                                                                 |
|-------------------------------|----------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CPUTempMon_Exclude_Servers    | Marked or Unmarked    | Check-Box | Mark this EDF if you want to exclude the servers of the location from the CPU Temperature monitoring solution.                                                                                           |
| CPUTempMon_Exclude_Workstations | Marked or Unmarked    | Check-Box | Mark this EDF if you want to exclude the workstations of the location from the CPU Temperature monitoring solution.                                                                                       |

## Computer-Level EDF

| Name                          | Example               | Type      | Description                                                                                                                                                                                                 |
|-------------------------------|----------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CPUTempMon_Exclude_Computer   | Marked or Unmarked    | Check-Box | Mark this EDF if you want to exclude the specific computer from the CPU Temperature monitoring solution.                                                                                                  |

## Output

- Script Logs
- Files on Machine
- Remote Monitor
## Attachments
[CPUTempMon.exe](<../../../static/attachments/itg/14323116/CPUTempMon.exe>)