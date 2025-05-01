---
id: '2893ba48-9686-424e-ba32-0c799c38f9fd'
slug: /2893ba48-9686-424e-ba32-0c799c38f9fd
title: 'NinjaRMM Deployment - [MAC]'
title_meta: 'NinjaRMM Deployment - [MAC]'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Agent', 'Install']
description: 'This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below: https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization. It depends on the Authorization token, which will be kept in the company or site custom fields.'
tags: ['RMM', 'Ninja', 'Migration', 'MAC']
draft: false
unlisted: false
---

## Summary
This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below:
https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization.
It depends on the Authorization token, which will be kept in the company or site custom fields.

## Sample Run
![Sample Run 1](../../../static/img/docs/rmm-ninja-migration-mac/image.png)

![Sample Run 2](../../../static/img/docs/rmm-ninja-migration-mac/image-1.png)

## Dependencies
[CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)

[Group - Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)

[Solution - CW RMM to Ninja Migration](/docs/b388aa6a-3e60-482c-9a13-ce6425c55dd3)

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

**Name:** `NinjaRMM Deployment - [MAC]`  
**Description:** `This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below:
https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization.
It depends on the Authorization token, which will be kept in the company or site custom fields.`  
**Category:** `Application`

![Script Detail](../../../static/img/docs/rmm-ninja-migration-mac/{68CAB065-F31D-4848-8ADD-C903E8AC7E5A}.png)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/cw-rmm-tasks-common-screenshots/addrow.png)

A blank function will appear:  
![BlankFunction](../../../static/img/cw-rmm-tasks-common-screenshots/blankfunction.png)

`Note: Limit all the function to MacOs machines.`

![MacOs](../../../static/img/docs/rmm-ninja-migration-mac/image-2.png)

#### Row 1 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `Deployment`

Custom Field: `Ninja Deployment Enable`

![Set Pre-defined 1](../../../static/img/docs/rmm-ninja-migration-mac/image-3.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Enable](../../../static/img/docs/rmm-ninja-migration-mac/{4D4F7827-9FC7-4DAB-9637-A8988CCDFF86}.png)

#### Row 2 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExL`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 2](../../../static/img/docs/rmm-ninja-migration-mac/image-5.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude Location](../../../static/img/docs/rmm-ninja-migration-mac/{091347DA-7E7A-4B4D-94DC-FF4F96770323}.png)

#### Row 3 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExC`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 3](../../../static/img/docs/rmm-ninja-migration-mac/image-7.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude Computer](../../../static/img/docs/rmm-ninja-migration-mac/{7A2DC246-22CD-4E4E-B394-5706ED070FC3}.png)

#### Row 4 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `OrgID`

Custom Field: `Ninja_Org_ID`

![Set Pre-defined 4](../../../static/img/docs/rmm-ninja-migration-mac/image-8.png)

After clicking on Save the Pre-defined will show data as:

![Org ID](../../../static/img/docs/rmm-ninja-migration-mac/{02576813-CB67-4DAE-B36C-9DF030BBD9AB}.png)

#### Row 5 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `LocID`

Custom Field: `Ninja_Site_ID`

![Set Pre-defined 5](../../../static/img/docs/rmm-ninja-migration-mac/image-9.png)

After clicking on Save the Pre-defined will show data as:

![Loc ID](../../../static/img/docs/rmm-ninja-migration-mac/{1682DB43-4D8B-456E-B06A-5859FBCECF90}.png)


#### Row 6 Logic: If/Then/Else

Add a logic If/Else/Then by clicking the Add Logic button:

![If/Else/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-11.png)


#### Row 6a Condition: Custom Field Contains

In the IF part, enter `-` in the right box for the Custom Field "Ninja_Org_ID" contains part.  

![Row 6 A](../../../static/img/docs/rmm-ninja-migration-mac/{F6C604B8-5412-4AC6-AD7F-1B4A9876FFE8}.png)


#### Row 6b Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script 1](../../../static/img/docs/rmm-ninja-migration-mac/{FB2AF02D-5D99-47FF-80A9-4F90813EFADE}.png)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/rmm-ninja-migration-mac/image-13.png)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@OrgID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash Script Execution](../../../static/img/docs/rmm-ninja-migration-mac/{05DCEBF5-00D8-41A9-81D3-8513035108C9}.png)

Limit the bash file to run on `Mac` machines only.

![Bash Script Limit](../../../static/img/docs/rmm-ninja-migration-mac/{E558E5F7-50AC-459D-880F-373D8E6922EC}.png)

#### Row 6c Logic: If/Then

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)

#### Row 6c(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-mac/{425E65C8-546A-4145-8BEE-86EBF572C03E}.png)

#### Row 6c(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-mac/image-17.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/rmm-ninja-migration-mac/image-18.png)

![Set Custom field 3](../../../static/img/docs/rmm-ninja-migration-mac/{23A1DB78-B0FD-495C-AD61-5D7D46C84D1A}.png)

#### Row 6c(iii) Function: Script Exit

Add a new row in the `IF` part by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/rmm-ninja-migration-mac/{9695FBD5-5278-402C-AB6E-DED5523C7353}-1.png)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/{386A99AF-7A9D-416D-9ED0-68DFFA267F44}.png)

#### Row 6d Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-mac/image-20.png)

Search and select the `Script Log` function.

![Script Log](../../../static/img/docs/rmm-ninja-migration-mac/{4F78BEC9-CE53-4E42-9DF8-C01F78995CA1}.png)

The following function will pop up on the screen:

![Script Log Empty](../../../static/img/docs/rmm-ninja-migration-mac/image-22.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/rmm-ninja-migration-mac/image-23.png)

#### Row 6e Function: Set Custom Field

Add a new row by clicking the `Add Row` button after `END IF`.

![Add Row 7](../../../static/img/docs/rmm-ninja-migration-mac/image-24.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Set custom field value](../../../static/img/docs/rmm-ninja-migration-mac/image-25.png)

![Set Custom field 3](../../../static/img/docs/rmm-ninja-migration-mac/{2F2A720E-6FEB-43E2-9265-B35FED4E2ADB}.png)

#### Row 6f Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 8](../../../static/img/docs/rmm-ninja-migration-mac/{9695FBD5-5278-402C-AB6E-DED5523C7353}.png)

In the script exit message, leave blank

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/{46958F1E-BF78-4BAA-BF5D-7C91D98965B1}.png)

#### Row 6g - Else Section

#### Row 6g Logic: If/Then

Add a logic If/Then by clicking the Add Logic button:

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)


#### Row 6g (i) Condition: Custom Field Contains

In the IF part, enter **-** in the right box for the Custom Field "Ninja_Site_ID" contains part.  

![Site ID](../../../static/img/docs/rmm-ninja-migration-mac/{94761431-A533-48D8-A7BA-D3EC4D672383}.png)


#### Row 6g (ii) Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script 1](../../../static/img/docs/rmm-ninja-migration-mac/{FB2AF02D-5D99-47FF-80A9-4F90813EFADE}.png)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/rmm-ninja-migration-mac/image-13.png)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@LocID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash Script Execution](../../../static/img/docs/rmm-ninja-migration-mac/{4C9909C8-60CF-4517-9F66-F7C0A55893AD}.png)

Limit the bash file to run on `Mac` machines only.

![Bash Script Limit](../../../static/img/docs/rmm-ninja-migration-mac/{E558E5F7-50AC-459D-880F-373D8E6922EC}.png)

#### Row 6h Logic: If/Then

Add a logic If/Then by clicking the Add Logic button

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)

#### Row 6h(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-mac/{425E65C8-546A-4145-8BEE-86EBF572C03E}.png)

#### Row 6h(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-mac/image-17.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/rmm-ninja-migration-mac/image-18.png)

![Set Custom field 3](../../../static/img/docs/rmm-ninja-migration-mac/{23A1DB78-B0FD-495C-AD61-5D7D46C84D1A}.png)

#### Row 6h(iii) Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/rmm-ninja-migration-mac/{9695FBD5-5278-402C-AB6E-DED5523C7353}-1.png)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/{386A99AF-7A9D-416D-9ED0-68DFFA267F44}.png)

#### Row 6i Function: Script Log

After `END IF` add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-mac/image-20.png)

Search and select the `Script Log` function.

![Script Log](../../../static/img/docs/rmm-ninja-migration-mac/{4F78BEC9-CE53-4E42-9DF8-C01F78995CA1}.png)

The following function will pop up on the screen:

![Script Log Empty](../../../static/img/docs/rmm-ninja-migration-mac/image-22.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/rmm-ninja-migration-mac/image-23.png)

#### Row 6j Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 7](../../../static/img/docs/rmm-ninja-migration-mac/image-24.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Set custom field value](../../../static/img/docs/rmm-ninja-migration-mac/image-25.png)

![Set Custom field 3](../../../static/img/docs/rmm-ninja-migration-mac/{2F2A720E-6FEB-43E2-9265-B35FED4E2ADB}.png)

#### Row 6k Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 8](../../../static/img/docs/rmm-ninja-migration-mac/{9695FBD5-5278-402C-AB6E-DED5523C7353}.png)

In the script exit message, leave blank

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/{46958F1E-BF78-4BAA-BF5D-7C91D98965B1}.png)

#### Row 7 Function: Script Exit

Add a new row by clicking on the `Add row` after `END IF` button.  

![Add Row 8](../../../static/img/docs/rmm-ninja-migration-mac/{9695FBD5-5278-402C-AB6E-DED5523C7353}.png)

In the script exit message write, `The Ninja_Org_ID and Ninja_Site_ID both are empty. The script needs the authorization token for its working.`

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/{4F9F8FEB-4FD7-4DBB-9B7F-2706EED18802}.png)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/cw-rmm-tasks-common-screenshots/savebutton.png)

## Completed Task

![Complete Task 1](../../../static/img/docs/rmm-ninja-migration-mac/{19FFB6BB-554C-4F2F-9483-EE6E0847964B}.png)
![Complete Task 2](../../../static/img/docs/rmm-ninja-migration-mac/{0DF1F0E0-0CC1-4E3B-AACD-8E57ABACC4C3}.png)
![Complete Task 3](../../../static/img/docs/rmm-ninja-migration-mac/{3A86EBA6-CBB6-4676-9423-F12C1A8AA307}.png)

## Deployment

This task is required to be deployed using a dynamic group.

It can be scheduled to run every 1 hour. Follow the below deployment step to schedule it.

- Go to Automations > Tasks.

- Search for `NinjaRMM Deployment - [Windows]`

- Then click on Schedule

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-mac/image-26.png)

- Select the Target group

![Target Set](../../../static/img/docs/rmm-ninja-migration-windows/image-19.png)

- Click Device Group -> Search for Ninja -> Select `Ninja RMM Deployment` group and click save selection

![Target select](../../../static/img/docs/rmm-ninja-migration-windows/image-20.png)

- Click on Schedule option, and set the time and click on Repeat to set it to run every hour

![Repeat Every 1 Hour](../../../static/img/docs/rmm-ninja-migration-windows/{379014B5-A273-42CD-8892-475FE52D7346}.png)

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-18.png)

## Output

- Custom field
- Script Log