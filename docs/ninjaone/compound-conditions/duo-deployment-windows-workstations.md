---
id: 'b90edc31-5509-4568-9c24-c020b24904cd'
slug: /b90edc31-5509-4568-9c24-c020b24904cd
title: 'Duo Deployment - Windows Workstations'
title_meta: 'Duo Deployment - Windows Workstations'
keywords: ['duo', 'mfa', 'security', 'auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Duo on Windows workstations where deployment is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Triggers the [Duo Deployment - Windows](/docs/3cc5e786-f5bd-4a86-85c6-89278fccaa65) automation on Windows workstations where deployment is enabled.

## Details

**Name:** `Duo Deployment - Windows Workstations`  
**Description:** `Triggers the auto-deployment script for Duo on Windows workstations where deployment is enabled.`  
**Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Duo Deployment - Windows](/docs/3cc5e786-f5bd-4a86-85c6-89278fccaa65)  
- [cPVAL DUO Deployment](/docs/22469c4c-79f2-4a87-9650-f418f4327e07)  
- [cPVAL DUO Deployment - Exclude](/docs/a27efdd4-32a9-4d9f-9aad-094543b49ffa)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Workstation [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/ninja-one-compound-conditions-common-screenshots/agentpolicies.png)

Search for `Windows Workstation` and select the default `Windows Workstation [Default]` policy.  
![DefaultWindowsWorkstation](../../../static/img/ninja-one-compound-conditions-common-screenshots/defaultwindowsworkstations.png)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/ninja-one-compound-conditions-common-screenshots/windowsworkstationsconditionssection.png)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/ninja-one-compound-conditions-common-screenshots/windowsworkstationscompoundconditionssection.png)

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

**Software Name:** `Duo Authentication for Windows Logon x64`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image1.png)

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

**Condition:** `cPVAL DUO Deployment` `equals` `Windows`

![Image4](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image4.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/ninja-one-compound-conditions-common-screenshots/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/ninja-one-compound-conditions-common-screenshots/searchcustomfield.png)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `Windows Workstations`

![Image5](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image5.png)

Click the `Apply` button to save the `custom field` condition.  
![Image6](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image6.png)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/ninja-one-compound-conditions-common-screenshots/automationssection.png)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/ninja-one-compound-conditions-common-screenshots/addautomations.png)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/ninja-one-compound-conditions-common-screenshots/automationlibrary.png)

Search and select the [Duo Deployment - Windows](/docs/3cc5e786-f5bd-4a86-85c6-89278fccaa65) script.  
![Image7](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image7.png)

Click the `Apply` button to add the automation.  
![Image8](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image8.png)

Completed Automation Section:  
![Image9](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image9.png)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/ninja-one-compound-conditions-common-screenshots/settingssection.png)

Set the `Settings` section as follows:  

**Name:** `Duo Deployment - Windows Workstations`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image10](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image10.png)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/ninja-one-compound-conditions-common-screenshots/apply.png)

![Image11](../../../static/img/ninja-one-compound-condition-duo-deployment-windows-workstations/image11.png)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/ninja-one-compound-conditions-common-screenshots/save.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/ninja-one-compound-conditions-common-screenshots/mfa.png)
