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
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Windows Workstation` and select the default `Windows Workstation [Default]` policy.  
![DefaultWindowsWorkstation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationsconditionssection.webp)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationscompoundconditionssection.webp)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbutton.webp)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addacompoundcondition.webp)

## Conditions

### Condition 1: Software

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.webp)

Select the `Software` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionSoftware](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditionsoftware.webp)

`Add Software Condition` screen will appear on selecting the `Software` option:  
![CompoundConditionSoftwareScreen](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditionsoftwarescreen.webp)

Configure the `Add Software Condition` as follow:  

**Software Name:** `Duo Authentication for Windows Logon x64`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image1_1.webp)

**Note:** The Return key must be pressed after pasting the name to set the `Software Name`.

Click the `Apply` button to save the `software` condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

### Condition 2: Custom fields

Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.webp)

Select the `Custom fields` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfields.webp)

`Add custom fields condition` screen will appear on selecting the `Custom fields` option:  
![CompoundConditionCustomFieldsScreen](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfieldsscreen.webp)

Click the `+ Add` button within the upper section labeled `Custom field value must meet ALL conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL DUO Deployment - Exclude` custom field.

**Condition:** `cPVAL DUO Deployment - Exclude` `does not equal` `Yes`

![Image2](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image2_1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `All`

![Image3](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image3_1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `Windows`

![Image4](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image4_1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL DUO Deployment` custom field.

**Condition:** `cPVAL DUO Deployment` `equals` `Windows Workstations`

![Image5](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image5_1.webp)

Click the `Apply` button to save the `custom field` condition.  
![Image6](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image6_1.webp)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.webp)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.webp)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrary.webp)

Search and select the [Duo Deployment - Windows](/docs/3cc5e786-f5bd-4a86-85c6-89278fccaa65) script.  
![Image7](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image7_1.webp)

Click the `Apply` button to add the automation.  
![Image8](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image8_1.webp)

Completed Automation Section:  
![Image9](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image9.webp)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.webp)

Set the `Settings` section as follows:  

**Name:** `Duo Deployment - Windows Workstations`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image10](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image10.webp)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

![Image11](../../../static/img/docs/efef6d5d-b853-46a5-8b7b-3d248a55e7a0/image11.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.webp)