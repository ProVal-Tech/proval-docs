---
id: '9475b189-47c5-4682-b278-de406761113b'
slug: /9475b189-47c5-4682-b278-de406761113b
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

[CW RMM Script - BitLocker Initialize C Volume](/docs/d920b865-7887-41b6-9fcd-b4802832d2a9)

## Target

Windows Workstations.  
This should target the group 'Windows 10/11' as shown below:

![Windows 10/11 Group](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_1.webp)

## Implementation

1. From the left bar, select Alert Management -> Monitor  

   ![Select Monitor](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_2.webp)  

   Then click 'Create Monitor'  

   ![Create Monitor](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_3.webp)

2. Fill in the mandatory columns on the left side.  
   - **Name**: BitLocker Init Failure  
   - **Description**: This monitor creates a ticket if the BitLocker initialization fails to enable BitLocker on the system volume.  
   - **Type**: Custom Field  
   - **Severity**: Critical Non-Impact Alerts  
   - **Family**: Desktop Security  

   ![Mandatory Fields](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_4.webp)

3. Fill in the condition on the right side.  
   Follow the screenshot:  

   ![Condition Screenshot](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_5.webp)

4. Select the target.  
   Click on Select Target:  

   ![Select Target](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_6.webp)  

   Then click on Device Group, search for the word "reboot," and select the 'Windows 10/11' group as shown below:  

   ![Windows 10/11 Group Selection](../../../static/img/docs/9475b189-47c5-4682-b278-de406761113b/image_1.webp)

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%