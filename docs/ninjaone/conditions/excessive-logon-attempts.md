---
id: 'd8ab94a8-8b00-401b-b1a4-48b7fd2713ae'
slug: /d8ab94a8-8b00-401b-b1a4-48b7fd2713ae
title: 'Excessive Logon Attempts'
title_meta: 'Excessive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute']
description: 'The condition runs the automation once per hour and generates a ticket with the script’s results if any monitored event log is detected.'
tags: ['security', 'accounts', 'eventlogs']
draft: false
unlisted: false
---

## Summary

The condition runs the [Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) automation once per minute and generates a ticket with the script’s results if any monitored event log is detected.

## Details

- **Name:**  `Excessive Logon Attempts`
- **Description:**  `The condition runs the automation once per minute and generates a ticket with the script’s results if any monitored event log is detected.`
- **Recommended Agent Policies:**  `Windows Server [Default]`

## Dependencies
- [Solution - Excessive Logon Attempts](/docs/e99ec890-ae05-4ad5-bdbc-6b0599be67e9)
- [Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de)
- [CW Manage - Ticket Template - Excessive Logon Attempts](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea)

## Condition Creation

Conditions can be configured within an `Agent Policy`. This document provides an example using the default `Windows Server [Default]` policy for demonstration purposes.

Navigate to `Administration` `>` `Policies` `>` `Agent Policies`.  
![Navigate](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/agentpolicies.webp)

Search for `Windows Server` and select the default `Windows Server [Default]` policy.  
![DefaultWindowsServer](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/defaultwindowsservers.webp)

This will navigate you to the policy's landing page, which is the `Conditions` section. Note that conditions may vary across different policies and environments. The provided screenshot is for demonstration purposes only.  
![Conditions](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/windowsserversconditionssection.webp)

Click the `Add a condition` button to add a new condition.  
![AddACondition](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/addacondition.webp)

The `Condition` screen will appear.  
![ConditionScreen](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/conditionscreen.webp)

## Condition

Click the `Select a condition` button to select the condition.  
![SelectACondition](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/selectacondition.webp)

Following screen will appear.  
![SelectConditionWindow](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/selectconditionwindow.webp)

Select the `Script Result Condition` from the dropdown menu.  
![ConditionDropdown](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/conditiondropdown.webp)

The `Script Result Condition` configuration screen will appear.  
![ScriptResultConditionConfig](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/scriptresultconditionconfig.webp)

Enter the following details and click `Apply`.  

- **Condition:** `Script Result Condition`  
- **Evaluation Script:** Search and select `Excessive Logon Attempts`. Provide the desired value for `Threshold` and `Minutes` parameters.  
- **Run Every:** `0` **Hours** `1` **Minutes**  
- **Timeout:** `0` **Hours** `5` **Minutes**  
- **Result Code:** `equal to` `1`  
- **With Output:** `Contains`  `Logon Type Reference Table:`  

![Image1](../../../static/img/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae/image1.webp)

Condition so far after clicking the `Apply` button.  
![Image2](../../../static/img/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae/image2.webp)

## Configuration

Set the following details:

- **Name:** `Excessive Logon Attempts`  
- **Severity:** `Major`  
- **Priority:** `High`  
- **Auto-reset:** `After 1 Hour` `When no longer met`  
- **Channel(s):** `<Leave it blank>`  
- **Notify Technician:** `Do not send notifications`  
- **ConnectWise:** `Create a ticket`  
- **Ticket Template:** `Excessive Logon Attempts`  
- **Ticketing Rule:** `Off`  

**Note:** The details above may differ depending on environment. Please verify the required information with consultant or partner before completing these fields.

## Saving the Condition

Click the `Add` button to save the condition.  
![Image4](../../../static/img/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae/image4.webp)

## Completed Condition

![Image3](../../../static/img/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae/image3.webp)

## Saving Agent Policy

Click the `Save` button located at the top-right corner of the screen to save the agent policy.  
![Save](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/save.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/a5979a59-7291-42e0-8278-d7c10aa9b557/mfa.webp)
