---
id: 'f05a636f-889c-4d3a-9eaa-039e0166cb51'
slug: /f05a636f-889c-4d3a-9eaa-039e0166cb51
title: 'Install BlackPoint SnapAgent'
title_meta: 'Install BlackPoint SnapAgent'
keywords: ['blackpoint', 'snapagent', 'installer', 'script', 'connectwise']
description: 'This document provides a comprehensive guide on installing BlackPoint SnapAgent through ConnectWise RMM using an agnostic script. It includes sample runs, user parameters, task creation steps, and detailed PowerShell scripting instructions.'
tags: ['application', 'installation', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-25
---

## Summary

Installs the BlackPoint SNAP Agent on Windows and macOS machines. It uses agnostic script [Install-SnapAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9) for BlackPoint SnapAgent installation on windows machine

## Sample Run

![Sample Run](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_3.webp)  

## Dependencies

- [Agnostic: Install-SnapAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9)  
- [Solution: BlackPoint SnapAgent Deployment](/docs/b99808e9-5148-47f6-9da4-bc4eeb590f2a) 

## User Parameters

| Name | Example | Required | Type | Description |
|------|---------|----------|------|-------------|
| Win_DownloadUrl | [https://file.something.com/SnapAgent/SnapAgent_Installer.exe](https://file.something.com/SnapAgent/SnapAgent_Installer.exe) | False | Text String | Download URL for the installer. |
| MAC_Authentication_Token | `788jkhdfhhadf9` | False | Text String | Unique BlackPoint authentication token used to install the BlackPoint SNAP Agent on macOS endpoints. The client custom field `BP_MAC_Authentication_Token` takes precedence over this parameter value for client machines. |
| Mac_Customer_ID | `78134783489` | False | Text String | Unique BlackPoint Account UID used to identify and link endpoints to the correct BlackPoint account. This is for MAC agents. The client custom field `BP_Mac_Customer_ID` takes precedence over this parameter value for client machines. |

![User Parameters](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_5.webp)  

![Task Creation Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_6.webp)  

- **Name:** `Install BlackPoint SnapAgent`  
- **Description:** `Installs the BlackPoint SnapAgent on Windows and macOS machines.`  
- **Category:** `Application`  

![Task Creation Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_7.webp)  

## Parameters

### Win_DownloadUrl

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_9.webp)  

- Set `Win_DownloadUrl` in the `Parameter Name` field.
- Disable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_10.webp)  

### MAC_Authentication_Token

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_9.webp)  

- Set `MAC_Authentication_Token` in the `Parameter Name` field.
- Disable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image1.webp)  

### Mac_Customer_ID

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_9.webp)  

- Set `Mac_Customer_ID` in the `Parameter Name` field.
- Disable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image2.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_11.webp)  

A blank function will appear.  
![Add Row Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_12.webp)  

#### **Row 1 Function: Set Pre-defined Variable (@Client_DownloadURL@ = BP_WIN_URL)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `Client_DownloadURL`
- **Custom Field:** `BP_WIN_URL`

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image3.webp)  

#### **Row 2 Function: Set Pre-defined Variable (@Client_Authentication_Token@ = BP_MAC_Authentication_Token)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `MacOS`
- **Variable Name:** `Client_Authentication_Token`
- **Custom Field:** `BP_MAC_Authentication_Token`

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image4.webp)  

#### **Row 3 Function: Set Pre-defined Variable (@Client_Customer_ID@ = BP_Mac_Customer_ID)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `MacOS`
- **Variable Name:** `Client_Customer_ID`
- **Custom Field:** `BP_Mac_Customer_ID`

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image5.webp)  

### Row 4 Function: PowerShell Script

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**

Navigate to the [`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm), open the script linked below, copy the raw code, and paste it into the RMM script editor:

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-blackpoint-snapagent/script.ps1)

![PowerShell Script Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_16.webp)  

#### **Row 5 Function: Command Prompt (CMD) Script**

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `MacOS`  
- **Command Prompt Script Editor:**

Navigate to the [`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm), open the script linked below, copy the raw code, and paste it into the RMM script editor:

[Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-blackpoint-snapagent/script.sh)

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image6.webp)  

### Row 6 Function: Script Log


- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`, `MacOS`  
- **Script Log Message:** `%Output%`  

![image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_21.webp)  


## Completed Task

![Completed Task](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_23.webp)  

## Output

- Script log

## Schedule Task

### Task Details

**Name:** `Install BlackPoint SnapAgent`  
**Description:** `Installs the BlackPoint SNAP Agent on Windows and macOS machines.`  
**Category:** `Application`  
![Task Creation Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_7.webp)  

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `True`
- **Stop After:** `22`
- **Unit:** `Hour(s)`

![Image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image7.webp) 

### Targeted Resource

**Device Group:** `Deploy BlackPoint SnapAgent`

![Image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image8.webp) 

### Completed Scheduled Task

![Image](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image9.webp) 

## Changelog

### 2026-08-25

- Updated the script to include MAC installation as well.

### 2025-04-10

- Initial version of the document