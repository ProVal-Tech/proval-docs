---
id: '4255caf3-73bb-434b-a612-fb1e76f2a10a'
slug: /4255caf3-73bb-434b-a612-fb1e76f2a10a
title: 'Hyper-V - Checkpoint Expiration Alert'
title_meta: 'Hyper-V - Checkpoint Expiration Alert'
keywords: ['hyper-v', 'hypervisor', 'checkpoint', 'backup', 'expire']
description: 'This creates ticket if the hyper-v checkpoint detected older than the provided threshold days'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
---

## Summary
This creates ticket if the hyper-v checkpoint detected older than the provided threshold days via script [Hyper-V - Checkpoint Expiration Alert](/docs/e2ab9b55-fbd3-4be9-801c-51b813b4bd13).

## Details

**Name:** `Hyper-V - Checkpoint Expiration Alert`  
**Description:** `This creates ticket if the hyper-v checkpoint detected older than the provided threshold days.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Windows Server - Hyper-V [Default]`

## Dependencies

[Script - Hyper-V - Checkpoint Expiration Alert](/docs/e2ab9b55-fbd3-4be9-801c-51b813b4bd13)

[Solution - Hyper-V Checkpoint Expiration Alert](/docs/621e8dcc-3405-47e6-b1e6-d9190971e8ee)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Server - Hyper-V [Default]` policy.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Hyper` and select the default `Windows Server - Hyper-V [Default]` policy.  
![Hyper](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-10.png)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  

![Condition](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-11.png)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  

![CompoundCondition](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-12.png)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbutton.webp)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addacompoundcondition.webp)

## Conditions

### Condition 1: Software

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.webp)

Select the `Script Result Condition` option from the list that will appear after clicking the `+ Add condition` button.  

![ScriptResultCondition](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-13.png)

`Add Script Result Condition` screen will appear. Select the `Evaluation Script` `+Add` button option:  

![AddScript](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-15.png)

Configure the `Script Result Condition` as follow:  

**Evaluation Script:** 

Search for `Hyper` and select `Hyper-V - Checkpoint Expiration Alert` script:

![Checkpoint](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-16.png)

It will open up the `Hyper-V - Checkpoint Expiration Alert` parameter setting.
Set the threshold as per the requirement in the `Age Limit` parameter or provide the custom field name containing the threshold days in the parameter `Retrieve Age Limit From Custom Field` and click `Apply`

![SetValue](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-17.png)

It will look like below after clicking on apply:

![Script Set](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-19.png)



Set Values in the Add Script Result Condition:

**Evaluation Script:** - `Hyper-V - Checkpoint Expiration Alert`
**Result code:** - `not equal to` - `0`
**Timeout:** - `10 Minutes`
**Output:** - `Contains` and put the value `There are checkpoints older than`
**Include script output in final Alert:** - `<Keep Unchecked>`
**Script error notification:** - `<Keep Unchecked>`

Click the `Apply` button to save the `Script Result Condition`.  

![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.webp)

Click `Apply` without any automation selection.

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.webp)

Set the `Settings` section as follows:  

**Name:** `Hyper-V - Checkpoint Expiration Alert`  
**Auto Reset:**

- **After:** `True` `4 hour`
- **When no longer met:** `True`

**Run Every:** `1 hour`  
**Trigger uptime:** `False`  

![Settings](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-20.png)

## Notifications

Set the following values:

**Severity:** - `Major`

**Priority:** - `High`

**Notify Technicians:** - `Do not send notifications`

**Channels:** - `Select any available channel`

**ConnectWise:** - `Create a ticket` and select a `Ticket Template`

**Ticketing Rule:** - `Off`

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

![Compound](../../../static/img/docs/hyperv-checkpoint-expiration-alert/image-21.png)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.webp)