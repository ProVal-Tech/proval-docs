---
id: '69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b'
slug: /69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b
title: 'Windows 10 ESU License Upgrade'
title_meta: 'Windows 10 ESU License Upgrade'
keywords: ['esu','extended security']
description: 'This script applies Extended Security Updates (ESU) license for Windows 10 22H2 systems'
tags: ['auditing','licensing','patching','windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-09
---

## Summary
Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems through CW RMM. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date.

## Sample Run

![Sample Run](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image8.webp)

## Dependencies

- [Task : ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa) 
- [Solution - Windows 10 ESU Licensing and Auditing](/docs/a7e4073e-1f09-4772-aa5e-ee44cf9bf9e7)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| ESU Key | xxxxx-xxxxx-xxxxx-xxxxx-xxxxx | | True | | String/Text | Provide the ESU license key for activation of Windows 10 extended use. |
| ESU Year | 2 | 1, 2, or 3 | True | | Number Value | Select the license key year validation like 1, 2, or 3. |


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

- **Name:** `Windows 10 ESU License Upgrade`  
- **Description:** `Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems through CW RMM. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date.`  
- **Category:** `Patching`

![Description](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image1.webp)

### Parameters

### ESUKey :
Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `ESUKey` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![ESUKey ](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image2.webp)

### ESUYear:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen. And Add the below details:

- Set `ESUYear` in the `Parameter Name` field.
- Select `Number Value` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![ESUYear](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image3.webp)

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

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/windows-10-esu-license-upgrade/script.ps1)



![Script Example](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image4.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp) 

### Row 3 Script: ESU License Activation Detection

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  Change Function to Script from the dropdown.  
![Blank Script](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image5.webp)

Search and select the `ESU License Activation Detection` Script.  
![ESU License Activation Detection](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image6.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Completed Task](../../../static/img/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b/image7.webp)

## Output
- Script Logs

## Changelog

### 2026-02-04

- Initial version of the document

