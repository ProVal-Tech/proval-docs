---
id: '87e8cc64-8a82-4d83-9a91-dcd82c63ffea'
slug: /87e8cc64-8a82-4d83-9a91-dcd82c63ffea
title: 'Excesive Logon Attempts'
title_meta: 'Excesive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute']
description: 'This ticket template is used to manage the CW Manage ticket generation settings for the Excessive Logon Attempts Alert Condition'
tags: ['security', 'accounts', 'eventlogs']
draft: false
unlisted: false
---

## Overview
This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae) condition.

## Requirement

Ensure that the ConnectWise Manage app is enabled and connected.  
![Requirement](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/requirement.webp)

## Dependencies
- [Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de)
- [Condition - Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae)

## Template Creation

### Step 1

Go to `Administration` > `Apps` > `Installed`.  
![Step1](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/step1.webp)

### Step 2

Find the `ConnectWise Manage` app under the `Third-party apps` section and select it.  
![Step2](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/step2.webp)

The ConnectWise Manage Configuration window will appear.  
![ConfigurationWindow](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/configurationwindow.webp)

### Step 3

In the `Ticket Templates` section, click the `New Ticket Template` button.  
![NewTicketTemplate](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/newtickettemplate.webp)

The New Ticket Template Configuration window will open.  
![NewTicketTemplateConfig](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/newtickettemplateconfig.webp)

### Step 4

Enter the required details and click `Save`.

- **Name:**  `Excessive Logon Failures`
- **Board:**  `Help Desk`
- **Status:**  `New`
- **Priority:**  `Priority 2 - High`
- **Type:**  `MUST CHANGE`
- **Sub Type:**  
- **Item:**  
- **Source:**  `Automate`
- **Team:**  `Service Team`
- **Severity:**  `High`
- **Impact:**  `High`
- **Create and close status:**  
- **Ticket Title Contents:**  `Custom text` `Organization name` `Device name`
- **Custom Text** `Excessive Logon Detected for`
- **When condition is reset:**  `Do not change`
- **When condition retriggers:**  `Append to existent ticket (if not closed)`

![Image1](../../../static/img/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea/image1.webp)

## Completed Template
![Image2](../../../static/img/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea/image2.webp)