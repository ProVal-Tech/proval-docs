---
id: '04287c62-cb16-47bd-9203-2e3e923c32e4'
slug: /04287c62-cb16-47bd-9203-2e3e923c32e4
title: 'Install AutoElevate Agent'
title_meta: 'Install AutoElevate Agent'
keywords: ['agent','windows','security']
description: 'This script automates the deployment and update of the AutoElevate on windows and macintosh machines'
tags:  ['security','application','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-08-10
---

## Summary
This script automates the deployment and update of the AutoElevate on windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.

## Sample Run

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image18.webp)

## Dependencies

- [Solution : AutoElevate Deployment](/docs/4a95cdd5-dec1-4d8e-aa3a-0ee4dd7c0273)
- [AE Blocker Mode](/docs/42e621c4-24fa-469e-9ea9-9109f8928388) 
- [AE Elevation Mode](/docs/7561b830-134d-4e7b-9dab-30518d724dd0)
- [AE Company Short Initials](/docs/30bbb34e-579f-4186-97b3-f30a46a3fbe7)
- [AE License Key](/docs/5481f063-b0be-431d-b745-6b6ffe7b4246)

## User Parameters

| Name | Type | Option Type | Options | Required | Default | Description |
|----------|--------|--------|-------|---------|--------|--------|
|License_Key| Text String | - | - | False | - | Add AutoElevate License Key. It is required for installing and registering the AutoElevate agent. If not provided script will use the values from [Custom Field: AE License Key](/docs/5481f063-b0be-431d-b745-6b6ffe7b4246)| 
|Elevation_Mode|DropDown| String | `Audit`,`Live`,`Policy`| False | - | Choose the Auto Elevate Elevation Mode to determine how privilege elevation requests are handled on the device once the agent is installed. If not provided script will use the values from [Custom Field: AE Elevation Mode](/docs/7561b830-134d-4e7b-9dab-30518d724dd0) |
|Blocker_Mode | DropDown| String | `Audit`,`Live`,`Disabled`| False | - | Select the Auto Elevate Blocker Mode configuration to configure for the end user at the time of installation. If not provided script will use the values from [Custom Field: AE Blocker Mode](/docs/42e621c4-24fa-469e-9ea9-9109f8928388) |


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

**Name:** `Install AutoElevate Agent`  
**Description:** `This script automates the deployment and update of the AutoElevate on windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.`  
**Category:** `Custom`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image1.webp)

### Parameters

#### License_Key

Add a new parameter by clicking the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `License_Key` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image2.webp)

#### Elevation_Mode

Add a new parameter by clicking the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `Elevation_Mode` in the `Parameter Name` field.
- Select `Dropdown` from the `Parameter Type` dropdown menu.
- Select `String` as the Option Type.
- Add  `Audit`,`Live`,`Policy` in the options.
- Click the `Save` button.

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image3.webp)

#### Blocker_Mode

Add a new parameter by clicking the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

- Set `Blocker_Mode` in the `Parameter Name` field.
- Select `Dropdown` from the `Parameter Type` dropdown menu.
- Select `String` as the Option Type.
- Add  `Audit`,`Live`,`Disabled` in the options.
- Click the `Save` button.

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image4.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### **Row 1 Function: Set Pre-defined Variable (@CF_License_Key@ = AE License Key)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `Windows`, `MacOS`
- **Variable Name:** `CF_License_Key`
- **Custom Field:** `AE License Key`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image5.webp)

#### **Row 2 Function: Set Pre-defined Variable (@CF_Elevation_Mode@ = AE Elevation Mode)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `CF_Elevation_Mode`
- **Custom Field:** `AE Elevation Mode`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image6.webp)

#### **Row 3 Function: Set Pre-defined Variable (@CF_Blocker_Mode@ = AE Blocker Mode)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `CF_Blocker_Mode`
- **Custom Field:** `AE Blocker Mode`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image7.webp)

#### **Row 4 Function: Set Pre-defined Variable (@CF_Company_Initials@ = AE Company Short Initials)**

- **Notes:** `<Leave it Blank>` 
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `CF_Company_Initials`
- **Custom Field:** `AE Company Short Initials`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image8.webp)

#### **Row 5 Function: PowerShell script**

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-autoelevate-agent/script.ps1)


![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image9.webp)

#### **Row 6 Function: Command Prompt (CMD) Script**

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `MacOS`  
- **Command Prompt Script Editor:**

[Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-autoelevate-agent/script.sh)


![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image10.webp)

#### **Row 7 Function: Script Log**

- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows,MacOS`  
- **Script Log Message:** `%Output%`  

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image11.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image12.webp)
![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image13.webp)

## Output

- Script Logs

## Schedule Task

### Task Details

**Name:** `Install AutoElevate Agent`  
**Description:** `This script automates the deployment and update of the AutoElevate on windows and macintosh machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.`  
**Category:** `Custom`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image14.webp)

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `True`
- **Stop After:** `22`
- **Unit:** `Hour(s)`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image15.webp)

### Targeted Resource

**Device Group:** `Deploy AutoElevate Agent`

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image16.webp)

### Completed Scheduled Task

![Image](../../../static/img/docs/04287c62-cb16-47bd-9203-2e3e923c32e4/image17.webp)

## Changelog

### 2026-08-10

- Initial version of the document

