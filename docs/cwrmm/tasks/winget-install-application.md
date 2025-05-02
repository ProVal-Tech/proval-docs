---
id: '39d1ff3c-effe-4eee-8a28-d745073c5e0f'
slug: /39d1ff3c-effe-4eee-8a28-d745073c5e0f
title: 'Winget Install Application'
title_meta: 'Winget Install Application'
keywords: ['winget', 'install', 'application', 'script', 'windows']
description: 'This document provides a detailed guide on how to create and execute a PowerShell script to install applications using Winget on Windows devices. It includes parameters, dependencies, and step-by-step instructions for script creation and deployment.'
tags: ['installation', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Attempts to install or update an application via Winget.
To get the PackageId and source, you can search in cmd using **"winget search appname"** or by browsing to winget.run

## Sample Run

![Image1](../../../static/img/cwrmm-task-winget-install-application/image1.png)

**Example 1:** Installing application without any optional parameters

![Image2](../../../static/img/cwrmm-task-winget-install-application/image2.png)

**Example 2:** Installing application with optional parameter

![Image3](../../../static/img/cwrmm-task-winget-install-application/image3.png)

![Image4](../../../static/img/cwrmm-task-winget-install-application/image4.png)

## Dependencies

[Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| PackageId | `AgileBits.1Password` | | Yes |  | Text String | winget application ID |
| Source | `winget` | `winget`, `msstore` | Yes | | Text String | Specifies winget or msstore as the source for package install |
| OptionalParameter | `--Scope machine` | | No | | Text String | Specifies option parameters to deploy the application |

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/cw-rmm-tasks-common-screenshots/step1.png)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/cw-rmm-tasks-common-screenshots/step2.png)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/cw-rmm-tasks-common-screenshots/step3.png)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Winget Install Application`  
**Description:**

```PlainText
Attempts to install or update an application via Winget
Parameter:
PackageId = winget application ID (Example: Google.Chrome)
Source could be either 'winget', 'msstore'
To get the PackageId and source, you can search in cmd using "winget search appname" or by browsing to winget.run
```

**Category:** `Application`

![Image5](../../../static/img/cwrmm-task-winget-install-application/image5.png)

### Parameters

#### **PackageId**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addparameter.png)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addnewscriptparameter.png)

Configure the parameter as described below:  
**Parameter Name:** `PackageId`  
**Required Field:** `True`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image6](../../../static/img/cwrmm-task-winget-install-application/image6.png)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/cwrmm-task-winget-install-application/image7.png)

#### **Source**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addparameter.png)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addnewscriptparameter.png)

Configure the parameter as described below:  
**Parameter Name:** `Source`  
**Required Field:** `True`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image8](../../../static/img/cwrmm-task-winget-install-application/image8.png)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/cwrmm-task-winget-install-application/image7.png)

#### **OptionalParameter**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addparameter.png)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/cw-rmm-tasks-common-screenshots/addnewscriptparameter.png)

Configure the parameter as described below:  
**Parameter Name:** `OptionalParameter`  
**Required Field:** `False`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image9](../../../static/img/cwrmm-task-winget-install-application/image9.png)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/cwrmm-task-winget-install-application/image7.png)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/cw-rmm-tasks-common-screenshots/addrow.png)

A blank function will appear:  
![BlankFunction](../../../static/img/cw-rmm-tasks-common-screenshots/blankfunction.png)

#### Row 1 Function: `PowerShell script`



## Completed Task

`<Screenshot(s) of completed task>`

## Deployment


## Output
