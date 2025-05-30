---
id: 'd7ba7616-f11d-4961-90fb-9e7cf9ed6f28'
slug: /d7ba7616-f11d-4961-90fb-9e7cf9ed6f28
title: 'Threatlocker Depoyment - Windows'
title_meta: 'Threatlocker Depoyment - Windows'
keywords: ['Threatlocker','windows','auto-deploy', 'agent-policy']
description: 'Triggers the auto-deployment script for Threatlocker on Windows machines where deployment is enabled'
tags: ['security','setup','windows']
draft: False
unlisted: false
---

## Summary
Triggers the [Threatlocker Deployment'](/docs/1196b011-bfba-486a-8653-92066f19e527) automation on Windows machines where deployment is enabled.

## Details

**Name:** `Threatlocker Depoyment - Windows`  
**Description:** `Triggers the auto-deployment script for Threatlocker on Windows machines where deployment is enabled.` 

**Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policies:

- `Windows Server [Default]`
- `Windows Workstation [Default]`

## Dependencies

- [Automation - Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527)  
- [cPVAL Threatlocker Deployment](/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2) 
- [cPVAL Threatlocker Deployment - Exclude](/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da) 
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)
## Compound Condition Creation

Compound conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Workstation [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Windows Workstation` and select the default `Windows Workstation [Default]` policy.  
![DefaultWindowsWorkstation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. `Note` that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationsconditionssection.webp)

Navigate to the `Compound Conditions` section. `Note` that existing compound conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![CompoundConditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationscompoundconditionssection.webp)

Click the `+ Add` button to add a compound condition.  
![AddButton](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbutton.webp)

Clicking the `+ Add` button opens the compound condition creation window.  
![AddACompoundCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addacompoundcondition.webp)

## Conditions

### Condition 1: Custom fields

- Click the `+ Add condition` button.  
![AddCondition](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addcondition.webp)

- Select the `Custom fields` option from the list that will appear after clicking the `+ Add condition` button.  
![CompoundConditionCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfields.webp)

- `Add custom fields condition` screen will appear on selecting the `Custom fields` option:  
![CompoundConditionCustomFieldsScreen](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/compoundconditioncustomfieldsscreen.webp)

- Click the `+ Add` button within the upper section labeled `Custom field value must meet ALL conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

- A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

- Search and select the `cPVAL Threatlocker Deployment - Exclude` custom field.

- **Condition:** `cPVAL Threatlocker Deployment - Exclude` `does not equal` `Yes`

    ![Image1](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image1.webp)

- Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

- A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

- Search and select the `cPVAL Threatlocker Deployment` custom field.

- **Condition:** `cPVAL Threatlocker Deployment` `equals` `Windows`

    ![Image3](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image3.webp)

- Click the `+ Add` button within the lower section labeled `Custom field value must meet ANY conditions`.  
![AddButtonCustomFields](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addbuttoncustomfields.webp)

- A new row will be added upon clicking the `+ Add` button.  
![NewRow](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/searchcustomfield.webp)

- Search and select the `cPVAL Threatlocker Deployment` custom field.

- **Condition:** `cPVAL Threatlocker Deployment` `equals` `Windows and Macintosh`

    ![Image2](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image2.webp)

- Click the `Apply` button to save the `custom field` condition.  
![Image5](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image5.webp)

## Automations

Navigate to `Automations` section.  
![AutomationSections](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationssection.webp)

Click the `+ Add automation` button.  
![AddAutomation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/addautomations.webp)

`Automation Library` will appear upon clicking the `+ Add Automation` button. 

Note that existing automation library may vary across different environments. The provided screenshot is for demonstration purposes only.  
![AutomationLibrary](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/automationlibrary.webp)

Search and select the [Threatlocker Deployment](/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28) script.  
![Image6](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image6.webp)

Click the `Apply` button to add the automation.  
![Image7](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image7.webp)

Completed Automation Section:  
![Image8](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image8.webp)

## Settings

Navigate to `Settings` section.  
![SettingsSection](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/settingssection.webp)

Set the `Settings` section as follows:  

**Name:** `Threatlocker Depoyment - Windows`  
**Auto Reset:**

- **After:** `True`, `24 hour`
- **When no longer met:** `True`

**Run Every:** `24 hour`  
**Minimum uptime for Trigger:** `True`, `10 minutes`  

![Image9](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image9.webp)

## Notifications

Leave the `Notifications` section untouched.

## Completed Component

Click the `Apply` button at the bottom to save the compound condition.  
![Apply](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/apply.webp)

![Image10](../../../static/img/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28/image10.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/mfa.webp)