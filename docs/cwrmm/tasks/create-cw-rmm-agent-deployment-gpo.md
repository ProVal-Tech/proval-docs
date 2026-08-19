---
id: '337fc103-461c-4e79-b2fd-db151a4bb628'
slug: /337fc103-461c-4e79-b2fd-db151a4bb628
title: 'Create CW RMM Agent Deployment GPO'
title_meta: 'Create CW RMM Agent Deployment GPO'
keywords: ['connectwise', 'gpo', 'deployment', 'agent', 'windows', 'domain']
description: 'This document provides a detailed guide on generating a ConnectWise RMM Agent Deployment Group Policy Object (GPO) on the primary domain controller. It outlines the steps to execute the script, the parameters required, and the expected outcomes of the deployment process.'
tags: ['connectwise', 'gpo', 'installation', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

The task will generate a ConnectWise RMM Agent Deployment Group Policy Object (GPO) on the domain controller where it is run. It is recommended to execute the script on the Primary Domain Controller.

The established GPO will execute a PowerShell script on the terminal device at startup or after the computer reboots. This script will attempt to install the ConnectWise RMM Agent on the Windows computers within the domain that do not currently have the CW RMM agent installed.

The results of the script execution will be stored on the endpoint in either the `Install-RMMAgent-log.txt` or `Install-RMMAgent-Error.txt` files. These files can be found in the `C:/ProgramData/_automation/script/Install-RMMAgent` directory.

## GPO

**Scope:** The GPO will be linked with the domain.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_1.webp)

**Details:**  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_2.webp)

**Settings:**  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_3.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_4.webp)

**Delegation:**  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_5.webp)

## Sample Run

![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_6.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_7.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_8.webp)

### User Parameters

| Name  | Example                             | Required | Description                                                                                                          |
|-------|-------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------|
| Token | 7f67c643-bf18-4c2b-be9d-f7a355e1f68a | True     | The ConnectWise RMM Agent Installer token corresponding to the client/site of the Domain Controller where the script is run. |

## Installer Token Generation

1. Go to **Devices** > **Computers**. Once the page loads, you will see a **Manage** option in the Action Bar, at the top-left of the page.
2. Click **Manage** to open the Menu Item. In the Menu, click **Download Agent.**  
   ![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_9.webp)
3. A new window will launch from where you can generate the agent installer token.  
   ![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_10.webp)
4. In the Download Agent window, select your site from the list of sites provided in the dropdown. You can also type to search for your site and select it.
5. After selecting the site, the `Agent Token` will be displayed. You can copy the token by clicking on the `Copy token to clipboard` button.  
   ![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_11.webp)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_12.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_13.webp)

**Name:** `Create CW RMM Agent Deployment GPO`  
**Description:** `The task will generate a ConnectWise RMM Agent Deployment Group Policy Object (GPO) on the domain controller where it is run. It is recommended to execute the script on the Primary Domain Controller.`  
**Category:** `Setup`  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_14.webp)

### Parameters

Click the `Add Parameter` button.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_15.webp)

The `Add New Script Parameter` box will appear.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_16.webp)

In the box, fill in the following details and select `Save` to create the `Token` parameter.

- **Parameter Name:** `Token`
- **Required Field:** `True`
- **Parameter Type:** `Text String`
- **Default Value:** `False`  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_17.webp)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_18.webp)

#### Row 1 Function: PowerShell Script

Select the `PowerShell Script` function.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_19.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_20.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_21.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

[PowerShell Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/create-cw-rmm-agent-deployment-gpo/script1.ps1)



![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_22.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_23.webp)

#### Row 2 Function: Script Log

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_24.webp)

Select the `Script Log` function.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_25.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_26.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`PowerShell Output: %Output%`  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_27.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_28.webp)

#### Row 3 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_24.webp)

Select the `PowerShell Script` function.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_19.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_20.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_21.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

[PowerShell Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/create-cw-rmm-agent-deployment-gpo/script2.ps1)


Get-Content -Path "C:/ProgramData/_automation/script/Install-RMMAgentGPO/Install-RMMAgentGPO-Log.txt" -ErrorAction SilentlyContinue
```
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_29.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_23.webp)

#### Row 4 Function: Script Log

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_24.webp)

Select the `Script Log` function.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_25.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_26.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`Script Logs: %Output%`  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_30.webp)  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_28.webp)

Click the `Save` button to save the Task.  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_31.webp)

## Completed Script

![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_32.webp)

## Output

- Script Log  
![Image](../../../static/img/docs/337fc103-461c-4e79-b2fd-db151a4bb628/image_33.webp)

## Changelog

### 2025-04-10

- Initial version of the document

