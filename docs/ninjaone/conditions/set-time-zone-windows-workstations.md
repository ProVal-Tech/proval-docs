---
id: '8369d5fe-217e-4804-a59f-8aa384df6cb1'
slug: /8369d5fe-217e-4804-a59f-8aa384df6cb1
title: 'Set Time Zone - Windows Workstations'
title_meta: 'Set Time Zone - Windows Workstations'
keywords: ['time', 'time-zone', 'windows']
description: 'Runs the "Manage Time Zone" automation on windows workstations where the "cPVAL Manage Time Zone" custom field is enabled.'
tags: ['timezone', 'windows']
draft: false
unlisted: false
---

## Summary

Runs the [Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c) automation once per day on windows workstations where the [cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03) custom field is enabled.

## Details

- **Name:** `Set Time Zone - Windows Workstations`  
- **Description:** `Runs the "Manage Time Zone" automation on windows workstations where the "cPVAL Manage Time Zone" custom field is enabled.`  
- **Recommended Agent Policies:** `Windows Workstation [Default]`  

## Dependencies

- [Custom Field: cPVAL Manage Time Zone](/docs/7db8dfdf-6825-4349-94e1-f86348fdec03)
- [Automation: Manage Time Zone](/docs/080cb5cd-270d-42ee-aa69-05b88adcb35c)
- [Solution: Time Zone Management](/docs/3641dd0d-82d8-4137-b987-0b6c0d8238da)

## Condition Creation

Conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Workstation [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/agentpolicies.webp)

Search for `Windows Workstation` and select the default `Windows Workstation [Default]` policy.  
![DefaultWindowsWorkstation](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/defaultwindowsworkstations.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/6cd46a25-ff1e-42db-9bed-9ea70cbaf8c0/windowsworkstationsconditionssection.webp)

Click the `Add a condition` button to add a new condition.  
![AddACondition](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/addacondition.webp)

The `Condition` screen will appear.  
![ConditionScreen](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/conditionscreen.webp)

## Condition

Click the `Select a condition` button to select the condition.  
![SelectACondition](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/selectacondition.webp)

Following screen will appear.  
![SelectConditionWindow](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/selectconditionwindow.webp)

Select the `Custom Fields` from the dropdown menu.  
![CustomFields](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/customfields.webp)

The `Custom Field Condition` configuration screen will appear.  
![CustomFieldsConfiguration](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/customfieldsconfiguration.webp)

Set the condition as following and Click the `Apply` Button.

**Custom field value must meet any conditions:**

`cPVAL Manage Time Zone` **>>** `equals` **>>** `Windows`  
`cPVAL Manage Time Zone` **>>** `equals` **>>** `Windows  Workstations`  

![Image1](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image1.webp)

## Configuration

Set the following details:

- **Name:** `Set Time Zone - Windows Workstations`  
- **Severity:** `None`  
- **Priority:** `None`  
- **Reset Interval:** `24 hours`  
- **Channel(s):** `<Leave it blank>`  
- **Notify Technician:** `Do not send notifications`  
- **ConnectWise:** `Do not create a ticket`  
- **Ticketing Rule:** `Off`  

![Image2](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image2.webp)

## Automations

Click the `Add` button in the `Automations` section of the condition to add the script to run.  
![AutomationsAddButton](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/automationsaddbutton.webp)

Search and select the `Manage Time Zone` automation from the `Automation Library`.  
![Image3](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image3.webp)

Set appropriate values to the variables and `Apply` the script.  
![Image4](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image4.webp)

## Saving the Condition

Click the `Add` button to save the condition.  
![Image5](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image5.webp)

## Completed Condition

![Image6](../../../static/img/docs/8369d5fe-217e-4804-a59f-8aa384df6cb1/image6.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/mfa.webp)
