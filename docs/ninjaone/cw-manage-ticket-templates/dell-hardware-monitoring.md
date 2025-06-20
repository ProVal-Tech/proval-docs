---
id: 'c1c2c40f-3a63-4eb8-8460-9f90000337aa'
slug: /c1c2c40f-3a63-4eb8-8460-9f90000337aa
title: 'Dell Hardware Monitoring'
title_meta: 'Dell Hardware Monitoring'
keywords: ['dell', 'omsa', 'open-manage-server-administrator', 'dell-omsa', 'dell-servers', 'dell-hardware', 'ticket', 'cw-manage', 'ticket-template']
description: 'This ticket template is used to manage the CW Manage ticket generation settings for the Dell OMSA Alerts condition.'
tags: ['dell', 'ticketing', 'cwmanage']
draft: false
unlisted: false
---

## Overview

This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [Dell OMSA Alerts](/docs/2bff6ade-58ff-4cbf-addc-067b90da09e9) condition.

## Requirement

Ensure that the ConnectWise Manage app is enabled and connected.  
![Requirement](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/requirement.webp)

## Dependencies

- [Condition - Dell OMSA Alerts](/docs/2bff6ade-58ff-4cbf-addc-067b90da09e9)
- [Automation - Dell Hardware Monitoring](/docs/45c545e2-a890-4ca8-acfc-5b100c2e100c)
- [Solution - Dell Hardware Monitoring](/docs/9980ae21-5d47-4b76-b5ad-0e6600e0c304)

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

- **Name:** `Dell Hardware Monitoring`  
- **Board:** `Help Desk`  
- **Status:** `New`  
- **Priority:** `Priority 2 - High`  
- **Type:** `MUST CHANGE`  
- **Sub Type:** `<Leave it blank or set required sub type>`  
- **Item:** `<Leave it blank or set required Item>`  
- **Source:** `Portal`  
- **Team:** `Service Team`  
- **Severity:** `High`  
- **Impact:** `High`  
- **Create and close status:** `Resolved`  
- **Ticket Title Contents:** `Custom Text` `Device Name`  
- **Custom Text:** `Dell OMSA Alert for`  
- **When condition is reset:** `Do not change`  
- **When condition retriggers:** `Create new ticket`  

**Note:** The details above may differ depending on environment. Please verify the required information with consultant or partner before completing these fields.

![Image1](../../../static/img/docs/c1c2c40f-3a63-4eb8-8460-9f90000337aa/image1.webp)

## Completed Template

![Image2](../../../static/img/docs/c1c2c40f-3a63-4eb8-8460-9f90000337aa/image2.webp)
