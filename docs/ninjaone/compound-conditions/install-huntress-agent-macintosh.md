---
id: '6e7c65c3-3a14-433e-9cbb-617674c1aff0'
slug: /6e7c65c3-3a14-433e-9cbb-617674c1aff0
title: 'Install Huntress Agent - Macintosh'
title_meta: 'Install Huntress Agent - Macintosh'
keywords: ['huntress', 'antivirus', 'auto-deploy', 'agent-policy', 'mac']
description: 'Triggers the auto-deployment script for the Huntress Agent on Macintosh machines where deployment is enabled.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

Triggers the [Install Huntress Agent - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f) automation on Macintosh machines where deployment is enabled.

## Details

**Name:** `Install Huntress Agent - Macintosh`  
**Description:** `Triggers the auto-deployment script for the Huntress Agent on Macintosh machines where deployment is enabled.`  

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Mac Server [Default]`
- `Mac [Default]`

## Dependencies

- [Install Huntress Agent - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f)  
- [cPVAL Huntress Deployment](/docs/67554954-e8da-48af-bda9-13a6a37c8295)  
- [cPVAL Huntress Install - Exclude](/docs/bdb92684-f093-49f8-9568-09874f9f79d5)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Mac [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.png)

Search for `Mac` and select the default `Mac [Default]` policy.  
![DefaultMac](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultmac.png)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/macconditionssection.png)

Navigate to the `Compound Conditions` section. Note that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/macworkstationscompoundconditionssection.png)

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

**Software Name:** `Huntress`  
**Trigger when:** `Any Software` `Doesn't exist`  

![Image1](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image1.png)

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

Search and select the `cPVAL Huntress Install - Exclude` custom field.

**Condition:** `cPVAL Huntress Install - Exclude` `does not equal` `Yes`

![Image2](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image2_1.png)

Click the `+ Add` button within the upper section labeled `Custom field value must meet ALL conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.png)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.png)

Search and select the `cPVAL Huntress Deployment` custom field.

**Condition:** `cPVAL Huntress Deployment` `equals` `Windows and Macintosh`

![Image4](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image4_1.png)

Click the `Apply` button to save the `custom field` condition.  
![Image2](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image2.png)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.png)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.png)

`Automation Library` will appear upon clicking the `+ Add Automation` button. Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrarymac.png)

Search and select the [Install Huntress Agent - Macintosh](/docs/69915d4b-f3e4-4192-b71c-e77559fe9d7f) script.  
![Image3](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image3.png)

Click the `Apply` button to add the automation.  
![Image4](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image4.png)

Completed Automation Section:  
![Image5](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image5.png)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.png)

Set the `Settings` section as follows:  

**Name:** `Install Huntress Agent - Macintosh`  
**Auto Reset:**

- **After:** `True` `1 hour`
- **When no longer met:** `True`

**Run Every:** `30 Minutes`  
**Trigger uptime:** `False`  

![Image6](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image6.png)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.png)

![Image7](../../../static/img/docs/6e7c65c3-3a14-433e-9cbb-617674c1aff0/image7.png)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.png)