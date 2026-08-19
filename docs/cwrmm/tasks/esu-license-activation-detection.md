---
id: 'fad37673-34ab-46e9-8797-b87058f79faa'
slug: /fad37673-34ab-46e9-8797-b87058f79faa
title: 'ESU License Activation Detection'
title_meta: 'ESU License Activation Detection'
keywords: ['esu','extended security']
description: 'This script performs the checks for the ESU license activation detection.'
tags: ['auditing','licensing','patching','windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-09
---

## Summary
This script performs the checks for the ESU license activation detection and stores the info in the device-level custom field [ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0).

## Sample Run

![Sample Run](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image9.webp) 

## Dependencies

- [Custom Field - ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0)
- [Solution - Windows 10 ESU Licensing and Auditing](/docs/a7e4073e-1f09-4772-aa5e-ee44cf9bf9e7)

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

- **Name:** `ESU License Activation Detection`  
- **Description:** `This script performs the checks for the ESU license activation detection and stores the info in the device-level custom field "ESU Status"`  
- **Category:** `Data Collection`

![Description](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image1.webp) 

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/esu-license-activation-detection/script.ps1)



![Script Example](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image2.webp) 

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)  

### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addsetcustomfieldfunction.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blanksetcustomfieldfunction.webp)  

- Search and select the Computer-Level Custom Field `ESU Status` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image10.webp)  

![Set Custom Field Save 2](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image3.webp) 

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Completed Task](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image4.webp) 


## Output

- Script Logs

## Schedule Task

### Task Details

- **Name:** `ESU License Activation Detection`  
- **Description:** `This script performs the checks for the ESU license activation detection and stores the info in the device-level custom field "ESU Status".`  
- **Category:** `Custom`

![Description](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image5.webp) 

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every 15 Days`

![Schedule](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image6.webp) 

### Targeted Resource

**Device Group:** `Windows 10 22H2`

![Target](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image7.webp) 

### Completed Scheduled Task

![Schedule Task](../../../static/img/docs/fad37673-34ab-46e9-8797-b87058f79faa/image8.webp)

## Changelog

### 2026-02-04

- Initial version of the document

