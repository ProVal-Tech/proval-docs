---
id: 'cwa_adpluginuseraccountcreation'
title: 'AD Plugin User Account Creation and Management'
title_meta: 'AD Plugin User Account Creation and Management'
keywords: ['ad', 'user', 'account', 'password', 'management', 'monitor']
description: 'This document outlines the process for creating and managing an ADPluginUser account for domain controllers detected in the AD Plugin. It details the script initiation for password changes, dependencies, and alert templates, while also addressing the limitations on EOL systems.'
tags: ['active-directory', 'windows', 'security', 'configuration', 'setup']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor set is to create an 'ADPluginUser' account for the domain controllers detected in AD Plugin. It will also initiate the script to force a password change every **X** days.

**X** (Number of days) can be defined in the system property `AD_Plugin_Password_Update_Days`. Refer to the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940) script's document for more information on the system property.

**Note**  
This monitor will no longer run on any EOL systems. This includes 2003 Servers, 2008 Servers, 2011 SBS Servers, and 2012 Servers (Both normal and R2). All management of the AD Plugin User Accounts will need to happen manually for these machines.

## Dependencies

[CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940)

## Target

Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers

## Alert Template

<u>**Name:**</u>  `△ Custom - Autofix - AD Plugin User - Create/Update`

- Import the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940) script before importing the alert template OR simply verify the script was imported correctly and fully up to date after importing the alert template.



