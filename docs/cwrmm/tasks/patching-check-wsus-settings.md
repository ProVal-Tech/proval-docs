---
id: '93b6b4ac-5923-47c5-a382-26015f6ac0fc'
slug: /93b6b4ac-5923-47c5-a382-26015f6ac0fc
title: 'Patching - Check for WSUS Settings'
title_meta: 'Patching - Check for WSUS Settings'
keywords: ['WSUS','Windows Update','Update']
description: 'Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). The result is stored in the custom field WSUS_Status.'
tags: ['update','windows','auditing']
draft: false
unlisted: false
last_update:
  date: 2025-08-05
---

## Summary
Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). The result is stored in the custom field [WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8).

## Sample Run

![Sample1](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image.webp)  
 
![Sample2](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image1.webp)  

![Sample3](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image2.webp)

## Dependencies
[CustomField - WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8)
[Solution - Patching - Check for WSUS Settings](/docs/f68df531-09b3-4b82-b183-3769c7183a8d)

## Task Creation


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

- **Name:** `Patching - Check for WSUS Settings`  
- **Description:** `Determines if Windows Server Update Services (WSUS) settings are configured in the registry and identifies if they are managed via Group Policy (GPO). You can also write the results to a text custom field.`  
- **Category:** `Patching`

![Description Image](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image3.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
![Row 1 Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_15.webp)  
![Row 1 Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_16.webp)  

The following function will pop up on the screen:  
![Row 1 Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_17.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button. 

[PowerShell Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/patching-check-wsus-settings/script1.ps1)


![PowerShell](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image4.webp)

#### Row 2 Logic: If/Then

- Add a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a/image_13.webp)

#### Row 2a Condition: Output Contains

- Type `An error occurred` in the Value box.  

![Output Contains](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image5.webp)

#### Row 2b Function: Script Exit

- Add a new row in the If Section of the If/Then part by clicking the `Add Row` button  
- Search and select the `Script Exit` function.  
- Input the following:

```
Failed to run the WSUS Settings audit. Refer to the logs:
%Output%
```

![Image](../../../static/img/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a/image_15.webp)

![Script Exit](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image6.webp)

#### Row 3 Function: Command Prompt (CMD) Script
After `End If`, click on `Add Row` and search for `Command Prompt (CMD) Script`
![CMD](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image7.webp)

Paste in the following Command Prompt (CMD) script and set the expected script execution time to 600 seconds.

[Bash Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/patching-check-wsus-settings/script1.sh)



![CMD Image](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image8.webp)

#### Row 4 Function: PowerShell Script

Click on `Add Row`, search and select the `PowerShell Script` function.  
![Row 1 Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_15.webp)  
![Row 1 Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_16.webp)  

The following function will pop up on the screen:  
![Row 1 Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_17.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button. 

[PowerShell Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/patching-check-wsus-settings/script2.ps1)


![Image](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image9.webp)

#### Row 5 Logic: If/Then

- Add a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a/image_13.webp)

#### Row 5a Condition: Output Contains

- Type `An error occurred` in the Value box.  

![Output Contains](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image5.webp)

#### Row 5b Function: Script Exit

- Add a new row in the If Section of the If/Then part by clicking the `Add Row` button  
- Search and select the `Script Exit` function.  
- Input the following:

```
WSUS Settings audit failed. %output%
```

![Image](../../../static/img/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a/image_15.webp)

![Script Exit](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image10.webp)

#### Row 6 Function: Script Log

- Add a new row by clicking the `Add Row` button after `End If`   
- Search and select the `Script Log` function.  
- Input the following:

[Bash Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/patching-check-wsus-settings/script2.sh)



![Image](../../../static/img/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a/image_11.webp)

![Script Log](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image10.webp)


#### Row 7 Function: Set Custom Field

- Add a new row by clicking the `Add Row` button  
- Search and select the `Set Custom Field` function.  
- Input the following:

![Custom field set](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image12.webp)

![Custom field set 1](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image13.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Complete](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image14.webp)

## Output
- Log
- local file

`C:\ProgramData\_Automation\Script\Audit-WSUSSettings\Audit-WSUSSettings-log.txt`

`C:\ProgramData\_Automation\Script\Audit-WSUSSettings\Audit-WSUSSettings-error.txt`

## Changelog

### 2025-08-01

- Initial version of the document

