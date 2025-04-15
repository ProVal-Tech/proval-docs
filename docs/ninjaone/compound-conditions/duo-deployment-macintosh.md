---
id: 'efef6d5d-b853-46a5-8b7b-3d248a55e7a0'
slug: /efef6d5d-b853-46a5-8b7b-3d248a55e7a0
title: 'Duo Deployment - Macintosh'
title_meta: 'Duo Deployment - Macintosh'
keywords: ['duo', 'mfa', 'security', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Duo on Macintosh machines where deployment is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Triggers the [Duo Deployment - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f) automation on Macintosh machines where deployment is enabled.

## Details

**Name:** `Duo Deployment - Macintosh`  
**Description:** `Triggers the auto-deployment script for the Huntress Agent on Macintosh machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Duo Deployment - Macintosh](/docs/059819a5-8b95-40d1-ac89-b33858e864a0)
- [cPVAL DUO Deployment](/docs/22469c4c-79f2-4a87-9650-f418f4327e07)  
- [cPVAL DUO Deployment - Exclude](/docs/a27efdd4-32a9-4d9f-9aad-094543b49ffa)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Mac [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/ninja-one-compound-conditions-common-screenshots/agentpolicies.png)

Search for `Mac` and select the default `Mac [Default]` policy.  
![DefaultMac](../../../static/img/ninja-one-compound-conditions-common-screenshots/defaultmac.png)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/ninja-one-compound-conditions-common-screenshots/macconditionssection.png)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/ninja-one-compound-conditions-common-screenshots/macworkstationscompoundconditionssection.png)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/ninja-one-compound-conditions-common-screenshots/addbutton.png)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/ninja-one-compound-conditions-common-screenshots/addacompoundcondition.png)

## Conditions

### Condition 1: Software

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/ninja-one-compound-conditions-common-screenshots/addcondition.png)

Select the `Software` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionSoftware](../../../static/img/ninja-one-compound-conditions-common-screenshots/compoundconditionsoftware.png)

`Add Software Condition` screen will appear on selecting the `Software` option:  
![CompoundConditionSoftwareScreen](../../../static/img/ninja-one-compound-conditions-common-screenshots/compoundconditionsoftwarescreen.png)

Configure the `Add Software Condition` as follow:  

**Software Name:** `Duo Authentication for macOS`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image1.png)

**Note:** The Return key must be pressed after pasting the name to set the `Software Name`.

Click the `Apply` button to save the `software` condition.  
![Apply](../../../static/img/ninja-one-compound-conditions-common-screenshots/apply.png)

### Condition 2: Custom fields

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/ninja-one-compound-conditions-common-screenshots/addcondition.png)

Select the `Custom fields` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionCustomFields](../../../static/img/ninja-one-compound-conditions-common-screenshots/compoundconditioncustomfields.png)

`Add custom fields condition` screen will appear on selecting the `Custom fields` option:  
![CompoundConditionCustomFieldsScreen](../../../static/img/ninja-one-compound-conditions-common-screenshots/compoundconditioncustomfieldsscreen.png)

Click the `+ Add` button within the upper section labeled `Custom field value must meet ALL conditions`.  
![AddButtonCustomFields](../../../static/img/ninja-one-compound-conditions-common-screenshots/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/ninja-one-compound-conditions-common-screenshots/searchcustomfield.png)

Search and select the `cPVAL DUO Deployment - Exclude` custom field.

**Condition:** `cPVAL DUO Deployment - Exclude` `does not equal` `Yes`

![Image2](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image2.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/ninja-one-compound-conditions-common-screenshots/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/ninja-one-compound-conditions-common-screenshots/searchcustomfield.png)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `All`

![Image3](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image3.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/ninja-one-compound-conditions-common-screenshots/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/ninja-one-compound-conditions-common-screenshots/searchcustomfield.png)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `Macintosh`

![Image2](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image2.png)

Click the `Apply` button to save the `custom field` condition.  
![Image3](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image3.png)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/ninja-one-compound-conditions-common-screenshots/automationssection.png)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/ninja-one-compound-conditions-common-screenshots/addautomations.png)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/ninja-one-compound-conditions-common-screenshots/automationlibrarymac.png)

Search and select the [Duo Deployment - Macintosh](/docs/059819a5-8b95-40d1-ac89-b33858e864a0) script.  
![Image4](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image4.png)

Click the `Apply` button to add the automation.  
![Image5](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image5.png)

Completed Automation Section:  
![Image8](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image8.png)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/ninja-one-compound-conditions-common-screenshots/settingssection.png)

Set the `Settings` section as follows:  

**Name:** `Duo Deployment - Macintosh`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image6](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image6.png)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/ninja-one-compound-conditions-common-screenshots/apply.png)

![Image7](../../../static/img/ninja-one-compound-condition-duo-deployment-macintosh/image7.png)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/ninja-one-compound-conditions-common-screenshots/save.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/ninja-one-compound-conditions-common-screenshots/mfa.png)
