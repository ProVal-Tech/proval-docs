---
id: '8caf51b3-efe4-4feb-aed5-0f3df1562e4f'
slug: /8caf51b3-efe4-4feb-aed5-0f3df1562e4f
title: 'Uninstall Unapproved ScreenConnect Client'
title_meta: 'Uninstall Unapproved ScreenConnect Client'
keywords: ['uninstall', 'unapproved', 'screenconnect-client']
description: 'Uninstalls all unapproved ScreenConnect Client instances from the local system.'
tags: ['screenconnect', 'uninstallation']
draft: false
unlisted: false
last_update:
  date: 2025-06-11
---

## Summary

This script is intended for managed environments where only designated ScreenConnect Client instances are allowed.  
It takes a parameter containing the names of approved ScreenConnect Client instances, verifies the input, and scans the system for all installed instances. Any instance not included in the approved list is silently uninstalled. The script records all actions and confirms that unapproved instances have been removed.

**If the ApprovedInstances parameter is set to `none`, the script will uninstall every ScreenConnect Client instance present on the system.**

<span style={{color:'red'}}>**EXERCISE EXTREME CAUTION – Double-check the InstanceIds before running the script. Using an incorrect InstanceId may result in the removal of integrated ScreenConnect Client.**</span>

## Sample Run

![Image1](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image1.webp)  
![Image2](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image2.webp)
![Image6](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image6.webp)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| **ApprovedInstances** | `56bd08847e48343f, 9df67d57637499f3` | | True | | Text String | A comma-separated list of approved ScreenConnect Client instance names (typically 16-character alphanumeric strings). If the value is set to 'none', the script will remove all installed instances of ScreenConnect Client from the system. **Use this option with caution, as it will uninstall every ScreenConnect Client instance.** |

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

- **Name:** `Uninstall Unapproved ScreenConnect Client`  
- **Description:**  `Removes all unapproved ScreenConnect Client instances from the system based on a provided list of approved instance names. If the ApprovedInstances parameter is set to none, all ScreenConnect Clients will be uninstalled. Double-check instance IDs to avoid removing required clients.`

- **Category:** `Application`

![Image3](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image3.webp)

### Parameters

#### **ApprovedInstances**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

Configure the parameter as described below:  
- **Parameter Name:** `ApprovedInstances`  
- **Required Field:** `True`  
- **Parameter Type:** `Text String`  
- **Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image7](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image7.webp)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image8](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image8.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: PowerShell

Search and select the `PowerShell Script` function.  
![AddPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addpowershellfunction.webp)  
![AddedPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![BlankPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/uninstall-unapproved-screenconnect-client/script.ps1)



![Image4](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image4.webp)

#### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

Search and select the `Script Log` function.  
![AddScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)

The following function will pop up on the screen:  
![BlankScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankscriptlogfunction.webp)

In the script log message, simply type `%Output%` and click the `Save` button.  
![OutputScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image5](../../../static/img/docs/8caf51b3-efe4-4feb-aed5-0f3df1562e4f/image5.webp)

## Output

- Script logs

## Changelog

### 2025-06-09

- Initial version of the document

