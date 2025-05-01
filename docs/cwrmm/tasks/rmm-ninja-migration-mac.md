---
id: '2893ba48-9686-424e-ba32-0c799c38f9fd'
slug: /2893ba48-9686-424e-ba32-0c799c38f9fd
title: 'NinjaRMM Deployment - [MAC]'
title_meta: 'NinjaRMM Deployment - [MAC]'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Agent', 'Install']
description: 'This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below: https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization. It depends on the Authorization token, which will be kept in the company or site custom fields.'
tags: ['macos', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Summary
This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below:
[Agent Installation Tokenization](https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization).
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

![Detail](../../../static/img/docs/rmm-ninja-migration-mac/image-27.png)

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

![Deployment](../../../static/img/docs/rmm-ninja-migration-mac/image-28.png)

#### Row 2 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExL`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 2](../../../static/img/docs/rmm-ninja-migration-mac/image-5.png)

After clicking on Save the Pre-defined will show data as:

![Deployment ExL](../../../static/img/docs/rmm-ninja-migration-mac/image-30.png)

#### Row 3 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExC`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 3](../../../static/img/docs/rmm-ninja-migration-mac/image-7.png)

After clicking on Save the Pre-defined will show data as:

![Deployment ExC](../../../static/img/docs/rmm-ninja-migration-mac/image-29.png)

#### Row 4 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `OrgID`

Custom Field: `Ninja_Org_ID`

![Set Pre-defined 4](../../../static/img/docs/rmm-ninja-migration-mac/image-8.png)

After clicking on Save the Pre-defined will show data as:

![Org ID](../../../static/img/docs/rmm-ninja-migration-mac/image-31.png)

#### Row 5 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `LocID`

Custom Field: `Ninja_Site_ID`

![Set Pre-defined 5](../../../static/img/docs/rmm-ninja-migration-mac/image-9.png)

After clicking on Save the Pre-defined will show data as:

![Loc ID](../../../static/img/docs/rmm-ninja-migration-mac/image-32.png)


#### Row 6 Logic: If/Then/Else

Add a logic If/Else/Then by clicking the Add Logic button:

![If/Else/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-11.png)


#### Row 6a Condition: Custom Field Contains

In the IF part, enter **-** in the right box for the Custom Field "Ninja_Org_ID" contains part.  

![Row 6A](../../../static/img/docs/rmm-ninja-migration-mac/image-33.png)


#### Row 6b Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash](../../../static/img/docs/rmm-ninja-migration-mac/image-34.png)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/rmm-ninja-migration-mac/image-13.png)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@OrgID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash Script](../../../static/img/docs/rmm-ninja-migration-mac/image-35.png)

Limit the bash file to run on `Mac` machines only.

![Limit](../../../static/img/docs/rmm-ninja-migration-mac/image-36.png)

#### Row 6c Logic: If/Then

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)

#### Row 6c(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-mac/image-37.png)

#### Row 6c(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-mac/image-17.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/rmm-ninja-migration-mac/image-18.png)

![Custom field 3](../../../static/img/docs/rmm-ninja-migration-mac/image-38.png)

#### Row 6c(iii) Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/rmm-ninja-migration-mac/image-39.png)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Script Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/image-40.png)

#### Row 6d Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-mac/image-20.png)

Search and select the `Script Log` function.

![Script Log](../../../static/img/docs/rmm-ninja-migration-mac/image-41.png)

The following function will pop up on the screen:

![Script Log Empty](../../../static/img/docs/rmm-ninja-migration-mac/image-22.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/rmm-ninja-migration-mac/image-23.png)

#### Row 6e Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 7](../../../static/img/docs/rmm-ninja-migration-mac/image-24.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Set custom field value](../../../static/img/docs/rmm-ninja-migration-mac/image-25.png)

![Success](../../../static/img/docs/rmm-ninja-migration-mac/image-42.png)
#### Row 6f Function: Script Exit

Add a new row by clicking on the Add row button.  

![6f Image](../../../static/img/docs/rmm-ninja-migration-mac/image-43.png)

In the script exit message, leave blank

![Exit Message](../../../static/img/docs/rmm-ninja-migration-mac/image-44.png)

#### Row 6g - Else Section

#### Row 6g Logic: If/Else

Add a logic If/Then by clicking the Add Logic button:

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)


#### Row 6g (i) Condition: Custom Field Contains

In the IF part, enter **-** in the right box for the Custom Field "Ninja_Site_ID" contains part.  

![Site ID](../../../static/img/docs/rmm-ninja-migration-mac/image-45.png)


#### Row 6g (ii) Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script](../../../static/img/docs/rmm-ninja-migration-mac/image-46.png)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/rmm-ninja-migration-mac/image-13.png)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@LocID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash cmd](../../../static/img/docs/rmm-ninja-migration-mac/image-47.png)

Limit the bash file to run on `Mac` machines only.

![LimitMac](../../../static/img/docs/rmm-ninja-migration-mac/image-48.png)

#### Row 6h Logic: If/Then

Add a logic If/Else by clicking the Add Logic button

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-mac/image-14.png)

![Logic Selected](../../../static/img/docs/rmm-ninja-migration-mac/image-15.png)

#### Row 6h(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-mac/image-49.png)

#### Row 6h(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-mac/image-17.png)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/rmm-ninja-migration-mac/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/rmm-ninja-migration-mac/image-18.png)

![Failed Value](../../../static/img/docs/rmm-ninja-migration-mac/image-50.png)

#### Row 6h(iii) Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-mac/image-51.png)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Exit Msg](../../../static/img/docs/rmm-ninja-migration-mac/image-52.png)

#### Row 6i Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-mac/image-20.png)

Search and select the `Script Log` function.

![Script Log Function](../../../static/img/docs/rmm-ninja-migration-mac/image-53.png)

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

![Success CF](../../../static/img/docs/rmm-ninja-migration-mac/image-54.png)

#### Row 6k Function: Script Exit

Add a new row by clicking on the Add row button.  

![Script Exit](../../../static/img/docs/rmm-ninja-migration-mac/image-55.png)

In the script exit message, leave blank

![Blank](../../../static/img/docs/rmm-ninja-migration-mac/image-56.png)

#### Row 7 Function: Script Exit

Add a new row by clicking on the Add row button.  

![Row 8](../../../static/img/docs/rmm-ninja-migration-mac/image-57.png)

In the script exit message write, `The Ninja_Org_ID and Ninja_Site_ID both are empty. The script needs the authorization token for its working.`

![Script Exit Msg](../../../static/img/docs/rmm-ninja-migration-mac/image-58.png)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/cw-rmm-tasks-common-screenshots/savebutton.png)

## Completed Task

![Complete Task 1](../../../static/img/docs/rmm-ninja-migration-mac/image-59.png)
![Complete Task 2](../../../static/img/docs/rmm-ninja-migration-mac/image-60.png)
![Complete Task 3](../../../static/img/docs/rmm-ninja-migration-mac/image-61.png)

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

![Repeat](../../../static/img/docs/rmm-ninja-migration-mac/image-62.png)

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-18.png)

## Output

- Custom field
- Script Log