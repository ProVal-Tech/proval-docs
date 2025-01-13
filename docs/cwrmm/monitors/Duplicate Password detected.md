---
id: 'rmm-duplicate-password-monitor'
title: 'Duplicate Password Monitor for Domain Controllers'
title_meta: 'Duplicate Password Monitor for Domain Controllers'
keywords: ['monitor', 'domain', 'controllers', 'duplicate', 'passwords', 'ticket']
description: 'This document outlines the implementation of a monitor that creates a ticket when duplicate passwords are detected on a domain controller. It includes dependencies, target specifications, and step-by-step implementation instructions.'
tags: ['active-directory', 'monitoring', 'ticketing', 'security', 'configuration', 'alert']
draft: false
unlisted: false
---
## Summary

This monitor creates a ticket if accounts with Duplicate passwords are detected on a domain controller.

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214)
- [CW RMM - Task - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-17546396)
- [CW RMM - Solution - Weak Passwords Audit](https://proval.itglue.com/DOC-5078775-17872310)

## Target

Domain Controllers  
This should target the group 'Domain Controllers.'

## Implementation

1. From the left bar select Alert Management -> Monitor  
   ![Step 1 Image](..\..\..\static\img\Duplicate-Password-detected\image_1.png)  
   Then click 'Create Monitor'  
   ![Step 1 Image](..\..\..\static\img\Duplicate-Password-detected\image_2.png)  

2. Fill in the mandatory columns on the left side.  
   Name: Duplicate Password detected  
   Description: This monitor creates a ticket if accounts with Duplicate passwords are detected on a domain controller.  
   Type: Custom Field  
   Severity: Critical Non-Impact Alerts  
   Family: Active Directory  
   ![Step 2 Image](..\..\..\static\img\Duplicate-Password-detected\image_3.png)  

3. Fill in the condition on the right side.  
   Follow the screenshot:  
   ![Step 3 Image](..\..\..\static\img\Duplicate-Password-detected\image_4.png)  

4. Select the target.  
   Click on Select Target:  
   ![Step 4 Image](..\..\..\static\img\Duplicate-Password-detected\image_5.png)  
   Then click on Device Group and then search for the word Domain and then select the 'Domain Controllers' group as shown below:  
   ![Step 4 Image](..\..\..\static\img\Duplicate-Password-detected\image_6.png)  

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%


