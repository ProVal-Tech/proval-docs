---
id: '6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0'
slug: /6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0
title: 'Deploy Vulscan Discovery Agent - Macintosh'
title_meta: 'Deploy Vulscan Discovery Agent - Macintosh'
keywords: ['rapid-fire', 'vulscan', 'discovery-agent', 'security', 'auto-deploy', 'macintosh']
description: 'Triggers the auto-deployment script for Vulscan Discovery Agent on Macintosh machines where deployment is enabled.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Triggers the [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7) automation on Macintosh machines where deployment is enabled.

## Details

**Name:** `Deploy Vulscan Discovery Agent - Macintosh`  
**Description:** `Triggers the auto-deployment script for the Vulscan Discovery Agent on Macintosh machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [cPVAL Vulscan Discovery Agent Deployment](/docs/317af03f-eb40-4f3f-a0e7-0b1433f2c2e1)
- [cPVAL Vulscan Discovery Agent - Exclude](/docs/685d8bef-ebda-40cb-a997-a7f9a208c837)
- [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Mac [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Mac` and select the default `Mac [Default]` policy.  
![DefaultMac](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultmac.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/macconditionssection.webp)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/macworkstationscompoundconditionssection.webp)

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

**Software Name:** `DiscoveryAgent`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image1.webp)

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

Search and select the `cPVAL Vulscan Discovery Agent - Exclude` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent - Exclude` `does not equal` `Yes`

![Image2](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image2_1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL Vulscan Discovery Agent Deployment` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent Deployment` `equals` `All`

![Image3](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image3_1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL Vulscan Discovery Agent Deployment` custom field.

**Condition:** `cPVAL Vulscan Discovery Agent Deployment` `equals` `Macintosh`

![Image2](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image2.webp)

Click the `Apply` button to save the `custom field` condition.  
![Image3](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image3.webp)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.webp)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.webp)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrarymac.webp)

Search and select the [Deploy Vulscan Discovery Agent - Macintosh](/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7) script.  
![Image4](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image4.webp)

Click the `Apply` button to add the automation.  
![Image5](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image5.webp)

Completed Automation Section:  
![Image6](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image6.webp)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.webp)

Set the `Settings` section as follows:  

**Name:** `Deploy Vulscan Discovery Agent - Macintosh`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image7](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image7.webp)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

![Image8](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/image8.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.webp)