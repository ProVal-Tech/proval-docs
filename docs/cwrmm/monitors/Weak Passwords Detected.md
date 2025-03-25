---
id: '827c282a-8701-42f9-87d3-8dbb7372134d'
slug: /827c282a-8701-42f9-87d3-8dbb7372134d
title: 'Weak Passwords Detected'
title_meta: 'Weak Passwords Detected'
keywords: ['monitor', 'weak', 'passwords', 'domain', 'controllers', 'ticket']
description: 'This document provides a detailed guide on implementing a monitor that creates a ticket when accounts with weak passwords are detected on domain controllers. It includes dependencies, target specifications, and step-by-step implementation instructions.'
tags: ['active-directory', 'security', 'ticketing']
draft: false
unlisted: false
---

## Summary

This monitor creates a ticket if accounts with weak passwords are detected on a domain controller.

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](<../groups/Domain Controllers.md>)
- [CW RMM - Task - Weak Passwords - AD Test](<../tasks/Weak Passwords - AD Test.md>)
- [CW RMM - Solution - Weak Passwords Audit](<../../solutions/Weak Passwords Audit.md>)

## Target

**Domain Controllers**  
This should target the group 'Domain Controllers.'

## Implementation

1. From the left bar, select **Alert Management** -> **Monitor**  
   ![Step 1 Image 1](../../../static/img/Weak-Passwords-Detected/image_1.png)  
   Then click **Create Monitor**  
   ![Step 1 Image 2](../../../static/img/Weak-Passwords-Detected/image_2.png)  

2. Fill in the mandatory fields on the left side.  
   - **Name:** Weak Passwords Detected  
   - **Description:** This monitor creates a ticket if accounts with weak passwords are detected on a domain controller.  
   - **Type:** Custom Field  
   - **Severity:** Critical Non-Impact Alerts  
   - **Family:** Active Directory  
   ![Step 2 Image](../../../static/img/Weak-Passwords-Detected/image_3.png)  

3. Fill in the condition on the right side.  
   Follow the screenshot:  
   ![Step 3 Image](../../../static/img/Weak-Passwords-Detected/image_4.png)  

4. Select the target.  
   Click on **Select Target:**  
   ![Step 4 Image 1](../../../static/img/Weak-Passwords-Detected/image_5.png)  
   Then click on **Device Group**, search for the word **Domain**, and select the 'Domain Controllers' group as shown below:  
   ![Step 4 Image 2](../../../static/img/Weak-Passwords-Detected/image_6.png)  

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%



