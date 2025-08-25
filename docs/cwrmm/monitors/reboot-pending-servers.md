---
id: 'b456d0ae-a456-4a35-85c2-c9b44eef2844'
slug: /b456d0ae-a456-4a35-85c2-c9b44eef2844
title: 'Reboot Pending - Servers'
title_meta: 'Reboot Pending - Servers'
keywords: ['monitor', 'ticket', 'reboot', 'windows', 'servers']
description: 'This document provides a detailed guide on creating a monitor that generates tickets for Windows servers with pending reboots. It covers the implementation process, dependencies, and configuration steps necessary to ensure proper functionality within the ConnectWise RMM environment.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers, i.e., 2016, 2019, and 2022. It only works when the Reboot Prompter Solution is activated and `Auto_RebootPendingCheck` custom field is enabled on servers.

## Details

This should target the group as shown below:

![Group Target](../../../static/img/docs/b456d0ae-a456-4a35-85c2-c9b44eef2844/image_1.webp)

## Dependencies

- [CW RMM - Dynamic Group - Reboot Pending Servers](/docs/d6235892-7f62-4a75-83ef-c6c01cc43898)
- [Solution - Reboot Prompter](/docs/5b376f62-e977-4feb-b523-b133d2ef5722)

## Implementation

1. From the left bar, select `Endpoints` > `Alerts` > `Monitors`. Then click `Create Monitor` from right side.
   
   

2. Fill in the mandatory fields on the left side.  
   - **Name:** `Reboot Pending - Servers ` 
   - **Description:** `This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers, i.e., 2016, 2019, and 2022, and it only works when the Reboot Prompter Solution is activated.  `
   - **Type:** `Custom Field`  
   - **Severity:** `Critical Non-Impact Alerts`  
   - **Family:** `Windows Server`  
   
   ![Mandatory Fields](../../../static/img/docs/b456d0ae-a456-4a35-85c2-c9b44eef2844/image_4.webp)

3. Fill in the condition on the right side.  
   Follow the screenshot:  
   
   ![Condition Screenshot](../../../static/img/docs/b456d0ae-a456-4a35-85c2-c9b44eef2844/image_5.webp)

4. Select the target.  
   Click on **Select Target:**  
   
   ![Select Target](../../../static/img/docs/b456d0ae-a456-4a35-85c2-c9b44eef2844/image_6.webp)  
   Then click on **Device Group**, search for the word "reboot," and select the **Reboot Pending Servers** group as shown below:  
   
   ![Device Group](../../../static/img/docs/b456d0ae-a456-4a35-85c2-c9b44eef2844/image_7.webp)

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%