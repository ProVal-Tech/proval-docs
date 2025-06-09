---
id: 'fa339801-d0b8-4ce4-afd1-2468712c76e7'
slug: /fa339801-d0b8-4ce4-afd1-2468712c76e7
title: 'Local Admin Group Cleanup - Windows Servers'
title_meta: 'Local Admin Group Cleanup - Windows Servers'
keywords: ['local', 'admin', 'cleanup', 'windows']
description: 'Triggers the Local Admin Group Cleanup automation on Windows Servers where cleanup is enabled.'
tags: ['cleanup', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

Triggers the [Local Admin Group Cleanup](/docs/27432f96-a5bf-4605-b2c8-fd046487b2db) automation on Windows Servers (except domain controllers) where cleanup is enabled.

## Details

- **Name:** `Local Admin Group Cleanup - Windows Servers`  
- **Description:** `Triggers the Local Admin Group Cleanup automation on Windows Servers (except domain controllers) where cleanup is enabled.`  
- **Recommended Agent Policy:** `Windows Server [Default]`

## Dependencies

- [Local Admin Group Cleanup](/docs/27432f96-a5bf-4605-b2c8-fd046487b2db)  
- [cPVAL Local Admin Group Cleanup](/docs/d39ab865-2fad-461f-8c39-6540e0199b8e)  
- [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
- [Solution - Local Admin Group Cleanup](/docs/70aec704-a188-45fe-b059-52f1cf39d468)

## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Server [Default]` policy for demonstration purposes.

Navigate to `Administration` > `Policies` > `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Windows Server` and select the default `Windows Server [Default]` policy.  
![DefaultWindowsServer](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsservers.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. `Note` that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsserversconditionssection.webp)

Navigate to the `Compound Conditions` section. `Note` that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsserverscompoundconditionssection.webp)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbutton.webp)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addacompoundcondition.webp)

## Conditions

### Condition 1: Custom fields

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

Search and select the `cPVAL Roles Detected` custom field.

**Condition:** `cPVAL Roles Detected` `contains none` `Active Directory Domain Services`

![Image1](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image1.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL Local Admin Group Cleanup` custom field.

**Condition:** `cPVAL Local Admin Group Cleanup` `equals` `Windows`

![Image2](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image2.webp)

Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

Search and select the `cPVAL Local Admin Group Cleanup` custom field.

**Condition:** `cPVAL Local Admin Group Cleanup` `equals` `Windows Servers`

![Image3](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image3.webp)

Click the `Apply` button to save the `custom field` condition.  
![Image4](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image4.webp)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.webp)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.webp)

`Automation Library` will appear upon clicking the `+ Add Automation` button. `Note` that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrary.webp)

Search and select the [Local Admin Group Cleanup](/docs/27432f96-a5bf-4605-b2c8-fd046487b2db) script.  
![Image5](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image5.webp)

Click the `Apply` button to add the automation.  
![Image6](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image6.webp)

Completed Automation Section:  
![Image7](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image7.webp)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.webp)

Set the `Settings` section as follows:  

- **Name:** `Local Admin Group Cleanup - Windows Servers`  
- **Auto Reset:**
    - **After:** `True` `12 hour`
    - **When no longer met:** `True`
- **Run Every:** `12 Hours`  
- **Trigger uptime:** `False`  

![Image8](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image8.webp)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

![Image9](../../../static/img/docs/fa339801-d0b8-4ce4-afd1-2468712c76e7/image9.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.webp)
