---
id: '23e2c753-e68a-4bcc-83df-1f62826025a5'
slug: /23e2c753-e68a-4bcc-83df-1f62826025a5
title: 'Domain Admin Account LockOut'
title_meta: 'Domain Admin Account LockOut'
keywords: ['Domain','Admin','Account','Lockout']
description: 'This event monitor checks every 15 minutes for a domain admin account lockout. If a lockout is detected, it triggers the `Domain Admin Account Lockout` task to generate a ticket'
tags: ['Domain','Active Directory','Accounts']
draft: False
unlisted: false
---

## Summary
This event monitor checks every 15 minutes for a domain admin account lockout. If a lockout is detected, it triggers the [CWRMM - Task - Domain Admin Account Lockout](/docs/b194bbed-fe64-4ced-8410-21281b08de07) task to generate a ticket

## Dependencies
[CWRMM - Task - Domain Admin Account Lockout](/docs/b194bbed-fe64-4ced-8410-21281b08de07)

## Target

`Domain Controllers`  
This should target the group 'Domain Controllers' as shown below:
![Target](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image6.png)


## Monitor Creation

### Step 1

Navigate to `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  
![Step1](../../../static/img/cw-rmm-monitors-common-screenshots/step1.png)

### Step 2

Locate the `Create Monitor` button on the right-hand side of the screen and click on it.  
![Step2](../../../static/img/cw-rmm-monitors-common-screenshots/step2.png)

This page will appear after clicking on the `Create Monitor` button:  
![Step3](../../../static/img/cw-rmm-monitors-common-screenshots/step3.png)

### Step 3

- Fill in the mandatory columns on the left side  
- Name: `Domain Admin Account LockOut`  
- Description: `This event monitor checks every 15 minutes for a domain admin account lockout. If a lockout is detected, it triggers the 'Domain Admin Account Lockout' task to generate a ticket.`  
- Type: `Event`  
- Severity: `Critical Impact Results`  
- Family: `Active Directory`  
![Step3](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image1.png)

 
### Step 4

- Fill in the condition on the right side.  
- Follow the screenshot:  
![Step3](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image2.png)

- Click on `Add Automation` and select `Domain Admin Account Lockout` task. 
![Step3](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image3.png)
![Step3](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image4.png)

- Turn Off Ticket Resolution
And Select `Do not Generate Ticket` from the monitor Output DropDown.
![Step3](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image5.png)


### Step 5

Click the `Select Target` button to choose the endpoints for running the monitor set.  
![Step4](../../../static/img/cw-rmm-monitors-common-screenshots/step4.png)

This page will appear after clicking on the `Select Target` button:  
![Target](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image6.png)


## Completed Monitor
![CompletedTask](../../../static/img/cwrmm-monitor-domain-admin-account-lockout/image7.png)
