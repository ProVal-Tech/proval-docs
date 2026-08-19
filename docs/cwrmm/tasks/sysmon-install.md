---
id: '05fe8d4e-6e82-4bb1-a0eb-48c46627132d'
slug: /05fe8d4e-6e82-4bb1-a0eb-48c46627132d
title: 'Sysmon - Install'
title_meta: 'Sysmon - Install'
keywords:  ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'Installs Sysmon application on windows machines.'
tags: ['installation','windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Installs Sysmon application on Windows machines.

## Sample Run
![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image9.webp)

## Dependencies

- [Solution - Sysmon Solution ](/docs/2db51f41-1313-46c4-81f1-8c67ed578b73) 


## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

- **Name:** `Sysmon - Install`  
- **Description:** `Installs Sysmon application on windows machines.`  
- **Category:** `Application`

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image1.webp)


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

### Row 1: Function: Set Pre-defined Variable

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image2.webp)

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image3.webp)

This sets the variable `CustomConfigFile` with the value of a custom field `Sysmon ConfigFile DownloadURL`


#### Row 2 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/sysmon-install/script.ps1)



![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image4.webp)

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image5.webp)

## Output

- Script Logs

## Schedule Task

### Task Details

- **Name:** `Sysmon - Install`  
- **Description:** `Installs Sysmon application on windows machines.`  
- **Category:** `Application`

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image1.webp)

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every Day`

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image6.webp)

#### Targeted Resource

**Device Group:** [Sysmon Deployment](/docs/424ddb1a-2a1b-47fb-b3cd-89ff4cf8b7a1)

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image7.webp)


### Completed Scheduled Task

![Image](../../../static/img/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d/image8.webp)


## Changelog

### 2026-03-26

- Initial version of the document
