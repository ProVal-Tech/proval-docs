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

This task validates whether the endpoint is a primary domain controller. It updates the value of the [CW RMM - Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) custom field, which is then used to create the [CW RMM - Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) group.

This task should be scheduled to run once per week or month against the [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) group.

## Sample Run

![Sample Run 1](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_1.png)

![Sample Run 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_2.png)

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
- [CW RMM - Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)

## Implementation

Create the group [CW RMM - Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68).

Create the Custom Field [CW RMM - Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae).

### Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Script Editor](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_3.png)

![Script Editor 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_4.png)

**Name:** Validate Primary Domain Controller

**Description:** Validate whether the endpoint is an infrastructure master or not and mark the `Is Primary Domain Controller` custom field.

**Category:** Custom

![Category Image](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_5.png)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Button](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_6.png)

#### Row 1 Function: PowerShell Script

![PowerShell Script 1](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_7.png)
![PowerShell Script 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. This PowerShell function will validate whether the endpoint is an infrastructure master or not.

```powershell
Import-Module ActiveDirectory
if ((Get-ADDomain -ErrorAction SilentlyContinue).InfrastructureMaster -match $env:COMPUTERNAME) {'Yes'} else {'No'}
```

![PowerShell Script Output](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_9.png)

#### Row 2 Logic: If Then

![If Then Logic 1](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_10.png)
![If Then Logic 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_11.png)

##### Row 2a Condition: Output Contains

Enter `Yes` in the text box.

![Output Contains](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_12.png)

##### Row 2b Function: Set Custom Field

Add a new row by clicking on the `Add Row` button.

![Add Row 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_13.png)

Select `Set Custom Field` function.

![Set Custom Field](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_14.png)

When you select `Set Custom Field`, a new window will open.

![Set Custom Field Window](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_15.png)

In this window, search for the `Is Primary Domain Controller` field.

**Custom Field:** Is Primary Domain Controller

**Value:** Yes ![Yes Value](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_16.png)

![Final Setup](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_17.png)

![Final Setup 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_18.png)

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task Screenshot](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_19.png)

### Deployment

It is suggested to run the task once per hour against the primary domain controllers or infrastructure masters.

- Go to `Automation` > `Tasks`.
- Search for `Validate Primary Domain Controller Task`.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Button](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_20.png)

This screen will appear.

![Schedule Screen](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_21.png)

Click the `Does not repeat` button.

![Does Not Repeat](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_22.png)

This pop-up box will appear.

![Repeat Options](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_23.png)

Select the `Week(s)` option from the Repeat dropdown and select a day to schedule the task.

![Select Week](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_24.png)
![Select Day](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_25.png)

Search for `Domain Controllers` in the `Resources*` and select the `Domain Controllers` group.

![Domain Controllers](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_26.png)

Now click the `Run` button to initiate the task.

![Run Button](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_27.png)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_28.png)
![Scheduled Tasks 2](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_29.png)

## Output

- Custom Field ![Custom Field Output](../../../static/img/docs/7bc6ac21-322d-4630-836f-f00e93b94168/image_30.png)

