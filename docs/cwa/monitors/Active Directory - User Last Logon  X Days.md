---
id: '2a260035-6023-4b23-ad58-4dbc38d9c819'
slug: /2a260035-6023-4b23-ad58-4dbc38d9c819
title: 'Active Directory - User Last Logon  X Days'
title_meta: 'Active Directory - User Last Logon  X Days'
keywords: ['active-directory', 'monitor', 'lastlogon', 'ticket', 'alert']
description: 'This document provides a detailed implementation guide for setting up an Active Directory monitor that checks for user accounts that have not logged in for a specified number of days, excluding administrator accounts. It includes instructions for creating tickets with user account status and last login information.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

This monitor will check for users that have not logged in for more than X days and are not administrator accounts.  
The monitor can be used to create a ticket with the details of whether the user account is enabled or disabled and will also show their last login. Please see the format below:

User1 (Enabled/Disabled) - Last Login: 6/10/2022

## Implementation

1. Import the Active Directory - User Last Logon > X Days Monitor from the plugin.
2. Duplicate the monitor and adjust the name as desired.
3. Edit the duplicated monitor, setting the configuration:
   1. In the additional Condition section of the Configuration tab, scroll down to the bottom and locate the following line:
      ```sql
      WHERE 
          LastLogon < NOW() - INTERVAL X DAY
      ```
   2. Change X to your desired limit in days.
4. In the Alerting Tab, set the desired Alert Template:
   1. For ticketing, use the Ticket Creation - Computer alert template or an appropriate alternative.
   2. For any other action, select the desired alert template.

## Dependencies

- Active Directory plugin

## Target

Global - Should be run without explicitly defined targets.


