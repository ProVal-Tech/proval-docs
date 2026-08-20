---
id: '03e6ab79-bc24-4442-881c-0b18142bfa8c'
slug: /03e6ab79-bc24-4442-881c-0b18142bfa8c
title: 'Users - LogOff'
title_meta: 'Users - LogOff'
keywords:  ['logoff', 'users', 'script', 'windows']
description: 'Logs off specified users or all active sessions from a Windows system. It provides flexibility in managing user sessions and can be executed with different parameters to target individual users or the entire user base.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Logs off specified users or all active sessions from a Windows system. It provides flexibility in managing user sessions and can be executed with different parameters to target individual users or the entire user base.

## Sample Run

![Image](../../../static/img/docs/03e6ab79-bc24-4442-881c-0b18142bfa8c/image5.webp) 


## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
|------|---------|-----------------|----------|-------|--------|--------------|
| Users | Calve,Test,All | user names separated by `,` or use ALL to log off all users | False | ALL | Text | The target user, multiple users, or all users to log off the machine. By default it will Log Off All users. |

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

**Name:** `Users - LogOff`  
**Description:** `Logs off specified users or all active sessions from a Windows system.`  
**Category:** `Custom`

![Image](../../../static/img/docs/03e6ab79-bc24-4442-881c-0b18142bfa8c/image1.webp) 

### Parameters

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `Users` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Set `All` as Default Value.
- Click the `Save` button.

![Image](../../../static/img/docs/03e6ab79-bc24-4442-881c-0b18142bfa8c/image2.webp) 


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

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/users-logoff/script.ps1)



![Image](../../../static/img/docs/03e6ab79-bc24-4442-881c-0b18142bfa8c/image3.webp) 


### Row 2 Function: Script Log

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

![Image](../../../static/img/docs/03e6ab79-bc24-4442-881c-0b18142bfa8c/image4.webp) 


## Output
- Script logs

## Changelog

### 2026-03-26

- Initial version of the document

