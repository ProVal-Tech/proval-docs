---
id: '0a45663a-0274-4e07-bfba-03d7c6b7478f'
slug: /0a45663a-0274-4e07-bfba-03d7c6b7478f
title: 'Deploy Vulscan Discovery Agent - Windows Workstations'
title_meta: 'Deploy Vulscan Discovery Agent - Windows Workstations'
keywords: ['rapid-fire', 'vulscan', 'discovery-agent', 'security', 'auto-deploy']
description: 'Triggers the auto-deployment script for Vulscan Discovery Agent on Windows workstations where deployment is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Triggers the [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771) automation on Windows workstations where deployment is enabled.

## Details

**Name:** `Deploy Vulscan Discovery Agent - Windows Workstations`  
**Description:** `Triggers the auto-deployment script for Vulscan Discovery Agent on Windows workstations where deployment is enabled.`  
**Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [cPVAL Vulscan Discovery Agent Deployment](/docs/317af03f-eb40-4f3f-a0e7-0b1433f2c2e1)
- [cPVAL Vulscan Discovery Agent - Exclude](/docs/685d8bef-ebda-40cb-a997-a7f9a208c837)
- [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Workstation [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.png)

Search for `Windows Workstation` and select the default `Windows Workstation [Default]` policy.  
![DefaultWindowsWorkstation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.png)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationsconditionssection.png)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationscompoundconditionssection.png)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbutton.png)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addacompoundcondition.png)

## Conditions

### Condition 1: Software

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.png)

Select the `Software` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionSoftware](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditionsoftware.png)

`Add Software Condition` screen will appear on selecting the `Software` option:  
![CompoundConditionSoftwareScreen](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditionsoftwarescreen.png)

Configure the `Add Software Condition` as follow:  

**Software Name:** `Discovery Agent`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image1_1.png)

**Note:** The Return key must be pressed after pasting the name to set the `Software Name`.

Click the `Apply` button to save the `software` condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.png)

### Condition 2: Custom fields

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.png)

Select the `Custom fields` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfields.png)

`Add custom fields condition` screen will appear on selecting the `Custom fields` option:  
![CompoundConditionCustomFieldsScreen](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfieldsscreen.png)

Click the `+ Add` button within the upper section labeled `Custom field value must meet ALL conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.png)

Search and select the `cPVAL Vulscan Discovery Agent - Exclude` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent - Exclude` `does not equal` `Yes`

![Image2](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image2_1.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.png)

Search and select the `cPVAL Vulscan Discovery Agent Deployment` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent Deployment` `equals` `All`

![Image3](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image3_1.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.png)

Search and select the `cPVAL Vulscan Discovery Agent Deployment` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent Deployment` `equals` `Windows`

![Image4](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image4_1.png)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.png)

Search and select the `cPVAL Vulscan Discovery Agent Deployment` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent Deployment` `equals` `Windows Workstations`

![Image5](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image5_1.png)

Click the `Apply` button to save the `custom field` condition.  
![Image6](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image6_1.png)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.png)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.png)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrary.png)

Search and select the [Deploy Vulscan Discovery Agent - Windows](/docs/63fe40e5-e5c7-4a31-bfdf-32bdb55b6771) script.  
![Image7](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image7_1.png)

Click the `Apply` button to add the automation.  
![Image8](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image8_1.png)

Completed Automation Section:  
![Image9](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image9.png)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.png)

Set the `Settings` section as follows:  

**Name:** `Deploy Vulscan Discovery Agent - Windows Workstations`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image10](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image10.png)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.png)

![Image11](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image11.png)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.png)