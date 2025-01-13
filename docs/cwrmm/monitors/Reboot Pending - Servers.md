---
id: 'rmm-reboot-pending-servers-monitor'
title: 'Reboot Pending - Servers Monitor'
title_meta: 'Reboot Pending - Servers Monitor'
keywords: ['monitor', 'ticket', 'reboot', 'windows', 'servers']
description: 'This document provides a detailed guide on creating a monitor that generates tickets for Windows servers with pending reboots. It covers the implementation process, dependencies, and configuration steps necessary to ensure proper functionality within the ConnectWise RMM environment.'
tags: ['alert', 'windows', 'monitoring', 'ticketing', 'configuration']
draft: false
unlisted: false
---
## Summary

This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.

## Details

This should target the group as shown below:

![Group Target](..\..\..\static\img\Reboot-Pending---Servers\image_1.png)

## Dependencies

[CW RMM - Dynamic Group - Reboot Pending Servers](https://proval.itglue.com/DOC-5078775-15488656)

## Implementation

1. From the left bar select Alert Management -> Monitor  
   
   ![Alert Management](..\..\..\static\img\Reboot-Pending---Servers\image_2.png)  
   Then click 'Create Monitor'  
   
   ![Create Monitor](..\..\..\static\img\Reboot-Pending---Servers\image_3.png)

2. Fill in the mandatory columns on the left side.  
   Name: Reboot Pending - Servers  
   Description: This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.  
   Type: Custom Field  
   Severity: Critical Non-Impact Alerts  
   Family: Windows Server  
   
   ![Mandatory Fields](..\..\..\static\img\Reboot-Pending---Servers\image_4.png)

3. Fill in the condition on the right side.  
   Follow the screenshot:  
   
   ![Condition Screenshot](..\..\..\static\img\Reboot-Pending---Servers\image_5.png)

4. Select the target.  
   Click on Select Target:  
   
   ![Select Target](..\..\..\static\img\Reboot-Pending---Servers\image_6.png)  
   Then click on Device Group and then search for the word reboot, and then select the 'Reboot Pending Servers' group as shown below:  
   
   ![Device Group](..\..\..\static\img\Reboot-Pending---Servers\image_7.png)

## Ticketing

**Subject**  
The custom field failed on %computername%

**Body**  
The custom field failed on %computername%


