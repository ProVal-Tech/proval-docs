---
id: '7bc6ac21-322d-4630-836f-f00e93b94168'
slug: /7bc6ac21-322d-4630-836f-f00e93b94168
title: 'Validate Primary Domain Controller'
title_meta: 'Validate Primary Domain Controller'
keywords: ['domain', 'controller', 'infrastructure', 'master', 'custom', 'field', 'automation']
description: 'This document outlines the process to validate whether an endpoint is a primary domain controller. It includes steps to update a custom field in ConnectWise RMM and create a scheduled task to run periodically against domain controllers.'
tags: ['domain']
draft: false
unlisted: false
---

## Summary

This task validates whether the endpoint is a primary domain controller. It updates the value of the [Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) custom field, which is then used to create the [Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) group.

This task should be scheduled to run once per week or month against the [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) group.

## Sample Run

![Sample Run 1](../../../static/img/Validate-Primary-Domain-Controller/image_1.png)

![Sample Run 2](../../../static/img/Validate-Primary-Domain-Controller/image_2.png)

## Dependencies

- [Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
- [Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)

## Implementation

Create the group [Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68).

Create the Custom Field [Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae).

### Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Script Editor](../../../static/img/Validate-Primary-Domain-Controller/image_3.png)

![Script Editor 2](../../../static/img/Validate-Primary-Domain-Controller/image_4.png)

**Name:** Validate Primary Domain Controller

**Description:** Validate whether the endpoint is an infrastructure master or not and mark the `Is Primary Domain Controller` custom field.

**Category:** Custom

![Category Image](../../../static/img/Validate-Primary-Domain-Controller/image_5.png)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Button](../../../static/img/Validate-Primary-Domain-Controller/image_6.png)

#### Row 1 Function: PowerShell Script

![PowerShell Script 1](../../../static/img/Validate-Primary-Domain-Controller/image_7.png)
![PowerShell Script 2](../../../static/img/Validate-Primary-Domain-Controller/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. This PowerShell function will validate whether the endpoint is an infrastructure master or not.

```powershell
Import-Module ActiveDirectory
if ((Get-ADDomain -ErrorAction SilentlyContinue).InfrastructureMaster -match $env:COMPUTERNAME) {'Yes'} else {'No'}
```

![PowerShell Script Output](../../../static/img/Validate-Primary-Domain-Controller/image_9.png)

#### Row 2 Logic: If Then

![If Then Logic 1](../../../static/img/Validate-Primary-Domain-Controller/image_10.png)
![If Then Logic 2](../../../static/img/Validate-Primary-Domain-Controller/image_11.png)

##### Row 2a Condition: Output Contains

Enter `Yes` in the text box.

![Output Contains](../../../static/img/Validate-Primary-Domain-Controller/image_12.png)

##### Row 2b Function: Set Custom Field

Add a new row by clicking on the `Add Row` button.

![Add Row 2](../../../static/img/Validate-Primary-Domain-Controller/image_13.png)

Select `Set Custom Field` function.

![Set Custom Field](../../../static/img/Validate-Primary-Domain-Controller/image_14.png)

When you select `Set Custom Field`, a new window will open.

![Set Custom Field Window](../../../static/img/Validate-Primary-Domain-Controller/image_15.png)

In this window, search for the `Is Primary Domain Controller` field.

**Custom Field:** Is Primary Domain Controller

**Value:** Yes ![Yes Value](../../../static/img/Validate-Primary-Domain-Controller/image_16.png)

![Final Setup](../../../static/img/Validate-Primary-Domain-Controller/image_17.png)

![Final Setup 2](../../../static/img/Validate-Primary-Domain-Controller/image_18.png)

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task Screenshot](../../../static/img/Validate-Primary-Domain-Controller/image_19.png)

### Deployment

It is suggested to run the task once per hour against the primary domain controllers or infrastructure masters.

- Go to `Automation` > `Tasks`.
- Search for `Validate Primary Domain Controller Task`.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Button](../../../static/img/Validate-Primary-Domain-Controller/image_20.png)

This screen will appear.

![Schedule Screen](../../../static/img/Validate-Primary-Domain-Controller/image_21.png)

Click the `Does not repeat` button.

![Does Not Repeat](../../../static/img/Validate-Primary-Domain-Controller/image_22.png)

This pop-up box will appear.

![Repeat Options](../../../static/img/Validate-Primary-Domain-Controller/image_23.png)

Select the `Week(s)` option from the Repeat dropdown and select a day to schedule the task.

![Select Week](../../../static/img/Validate-Primary-Domain-Controller/image_24.png)
![Select Day](../../../static/img/Validate-Primary-Domain-Controller/image_25.png)

Search for `Domain Controllers` in the `Resources*` and select the `Domain Controllers` group.

![Domain Controllers](../../../static/img/Validate-Primary-Domain-Controller/image_26.png)

Now click the `Run` button to initiate the task.

![Run Button](../../../static/img/Validate-Primary-Domain-Controller/image_27.png)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/Validate-Primary-Domain-Controller/image_28.png)
![Scheduled Tasks 2](../../../static/img/Validate-Primary-Domain-Controller/image_29.png)

## Output

- Custom Field  
    ![Custom Field Output](../../../static/img/Validate-Primary-Domain-Controller/image_30.png)
