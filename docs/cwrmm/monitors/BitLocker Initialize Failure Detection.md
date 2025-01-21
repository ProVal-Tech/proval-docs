---
id: '9475b189-47c5-4682-b278-de406761113b'
title: 'BitLocker Initialize Failure Detection'
title_meta: 'BitLocker Initialize Failure Detection'
keywords: ['bitlocker', 'monitor', 'ticket', 'failure', 'windows']
description: 'This document provides a detailed guide on creating a monitor that generates a ticket when the BitLocker Initialization fails on the system volume for Windows workstations. It includes dependencies, implementation steps, and ticketing information.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor creates a ticket if the BitLocker initialization fails to enable BitLocker on the system volume.

## Dependencies

[CW RMM Script - BitLocker Initialize C Volume](<../tasks/CW RMM Script - BitLocker Initialize C Volume.md>)

## Target

Windows Workstations.  
This should target the group 'Windows 10/11' as shown below:

![Windows 10/11 Group](../../../static/img/BitLocker-Initialize-Failure-Detection/image_1.png)

## Implementation

1. From the left bar, select Alert Management -> Monitor  

   ![Select Monitor](../../../static/img/BitLocker-Initialize-Failure-Detection/image_2.png)  

   Then click 'Create Monitor'  

   ![Create Monitor](../../../static/img/BitLocker-Initialize-Failure-Detection/image_3.png)

2. Fill in the mandatory columns on the left side.  
   - **Name**: BitLocker Init Failure  
   - **Description**: This monitor creates a ticket if the BitLocker initialization fails to enable BitLocker on the system volume.  
   - **Type**: Custom Field  
   - **Severity**: Critical Non-Impact Alerts  
   - **Family**: Desktop Security  

   ![Mandatory Fields](../../../static/img/BitLocker-Initialize-Failure-Detection/image_4.png)

3. Fill in the condition on the right side.  
   Follow the screenshot:  

   ![Condition Screenshot](../../../static/img/BitLocker-Initialize-Failure-Detection/image_5.png)

4. Select the target.  
   Click on Select Target:  

   ![Select Target](../../../static/img/BitLocker-Initialize-Failure-Detection/image_6.png)  

   Then click on Device Group, search for the word "reboot," and select the 'Windows 10/11' group as shown below:  

   ![Windows 10/11 Group Selection](../../../static/img/BitLocker-Initialize-Failure-Detection/image_1.png)

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%



