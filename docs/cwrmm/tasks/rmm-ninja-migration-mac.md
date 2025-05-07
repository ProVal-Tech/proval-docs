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
![Sample Run 1](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image.webp)

![Sample Run 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-1.webp)

## Dependencies
[CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)

[Group - Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)

[Solution - CW RMM to Ninja Migration](/docs/b388aa6a-3e60-482c-9a13-ce6425c55dd3)

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

**Name:** `NinjaRMM Deployment - [MAC]`  
**Description:** `This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below:
https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization.
It depends on the Authorization token, which will be kept in the company or site custom fields.`  
**Category:** `Application`

![Detail](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-27.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

`Note: Limit all the function to MacOs machines.`

![MacOs](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-2.webp)

#### Row 1 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `Deployment`

Custom Field: `Ninja Deployment Enable`

![Set Pre-defined 1](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-3.webp)

After clicking on Save the Pre-defined will show data as:

![Deployment](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-28.webp)

#### Row 2 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.
Make sure to select the `Ninja Deployment Exclude` site level custom field.

Variable: `DeploymentExL`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-5.webp)

After clicking on Save the Pre-defined will show data as:

![Deployment ExL](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-30.webp)

#### Row 3 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.
Make sure to select the `Ninja Deployment Exclude` endpoint level custom field.

Variable: `DeploymentExC`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 3](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-7.webp)

After clicking on Save the Pre-defined will show data as:

![Deployment ExC](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-29.webp)

#### Row 4 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `OrgID`

Custom Field: `Ninja_Org_ID`

![Set Pre-defined 4](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-8.webp)

After clicking on Save the Pre-defined will show data as:

![Org ID](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-31.webp)

#### Row 5 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `LocID`

Custom Field: `Ninja_Site_ID`

![Set Pre-defined 5](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-9.webp)

After clicking on Save the Pre-defined will show data as:

![Loc ID](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-32.webp)


#### Row 6 Logic: If/Then/Else

Add a logic If/Else/Then by clicking the Add Logic button:

![If/Else/Then](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-11.webp)


#### Row 6a Condition: Custom Field Contains

In the IF part, enter `-` in the right box for the Custom Field "Ninja_Org_ID" contains part.  

![Row 6A](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-33.webp)


#### Row 6b Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-34.webp)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-13.webp)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@OrgID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash Script](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-35.webp)

Limit the bash file to run on `Mac` machines only.

![Limit](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-36.webp)

#### Row 6c Logic: If/Then

![Logic If/Then](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-14.webp)

![Logic Selected](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-15.webp)

#### Row 6c(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-37.webp)

#### Row 6c(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-17.webp)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-16.webp)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-18.webp)

![Custom field 3](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-38.webp)

#### Row 6c(iii) Function: Script Exit

Add a new row in the `IF` part by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-39.webp)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Script Exit Message](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-40.webp)

#### Row 6d Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-20.webp)

Search and select the `Script Log` function.

![Script Log](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-41.webp)

The following function will pop up on the screen:

![Script Log Empty](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-22.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-23.webp)

#### Row 6e Function: Set Custom Field

Add a new row by clicking the `Add Row` button after `END IF`.

![Add Row 7](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-24.webp)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-16.webp)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Set custom field value](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-25.webp)

![Success](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-42.webp)
#### Row 6f Function: Script Exit

Add a new row by clicking on the Add row button.  

![6f Image](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-43.webp)

In the script exit message, leave blank

![Exit Message](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-44.webp)

#### Row 6g - Else Section

#### Row 6g Logic: If/Then

Add a logic If/Then by clicking the Add Logic button:

![Logic If/Then](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-14.webp)

![Logic Selected](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-15.webp)


#### Row 6g (i) Condition: Custom Field Contains

In the IF part, enter **-** in the right box for the Custom Field "Ninja_Site_ID" contains part.  

![Site ID](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-45.webp)


#### Row 6g (ii) Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-46.webp)

The following function will pop up on the screen:

![Bash Script 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-13.webp)

Paste in the following Bash script and leave the expected time of script execution to `900` seconds. Click the `Save` button.

```
sudo curl https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x64.pkg -L --output /tmp/NinjaOneAgent-x64.pkg && sudo sh -c 'echo "@LocID@" > /tmp/.~' && sudo installer -pkg /tmp/NinjaOneAgent-x64.pkg -target / && echo "Installation successful." || { echo "Failed to install Ninja RMM agent."; exit 1; }
```

![Bash cmd](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-47.webp)

Limit the bash file to run on `Mac` machines only.

![LimitMac](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-48.webp)

#### Row 6h Logic: If/Then

Add a logic If/Then by clicking the Add Logic button

![Logic If/Then](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-14.webp)

![Logic Selected](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-15.webp)

#### Row 6h(i) Condition: Output Contains

In the IF part, enter `Failed to install Ninja` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-49.webp)

#### Row 6h(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-17.webp)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-16.webp)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-18.webp)

![Failed Value](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-50.webp)

#### Row 6h(iii) Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 5](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-51.webp)

In the script exit message, simply type `The Ninja Deployment failed on the Mac Agent. Refer to the logs: %output%`  

![Exit Msg](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-52.webp)

#### Row 6i Function: Script Log

After `END IF` add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-20.webp)

Search and select the `Script Log` function.

![Script Log Function](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-53.webp)

The following function will pop up on the screen:

![Script Log Empty](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-22.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-23.webp)

#### Row 6j Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 7](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-24.webp)

Search and select the `Set Custom Field` function.

![Select Custom Field](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-16.webp)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Set custom field value](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-25.webp)

![Success CF](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-54.webp)

#### Row 6k Function: Script Exit

Add a new row by clicking on the Add row button.  

![Script Exit](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-55.webp)

In the script exit message, leave blank

![Blank](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-56.webp)

#### Row 7 Function: Script Exit

Add a new row by clicking on the `Add row` after `END IF` button.  

![Row 8](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-57.webp)

In the script exit message write, `The Ninja_Org_ID and Ninja_Site_ID both are empty. The script needs the authorization token for its working.`

![Script Exit Msg](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-58.webp)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Complete Task 1](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-59.webp)
![Complete Task 2](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-63.webp)
![Complete Task 3](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-61.webp)

## Deployment

This task is required to be deployed using a dynamic group.

It can be scheduled to run every 1 hour. Follow the below deployment step to schedule it.

- Go to Automation > Tasks.

- Search for `NinjaRMM Deployment - [MAC]`

- Then click on Schedule

![Schedule Task](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-26.webp)

- Select the Target group

![Target Set](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-19.webp)

- Click Device Group -> Search for Ninja -> Select `Ninja RMM Deployment` group and click save selection

![Target select](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-20_1.webp)

- Click on Schedule option, and set the time and click on Repeat to set it to run every hour

![Repeat](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-62.webp)

![Schedule Task](../../../static/img/docs/2893ba48-9686-424e-ba32-0c799c38f9fd/image-18_1.webp)

## Output

- Custom field
- Script Log