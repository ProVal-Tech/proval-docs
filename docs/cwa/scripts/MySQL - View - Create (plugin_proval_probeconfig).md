---
id: '5bee0fdf-d4c0-4158-8d69-ba49f43b66c5'
title: 'Drop View and Recreate for ProVal Custom Tables'
title_meta: 'Drop View and Recreate for ProVal Custom Tables'
keywords: ['view', 'recreate', 'permissions', 'custom', 'tables']
description: 'This document outlines the process of dropping an existing view and recreating it, followed by executing a script to update user permissions for ProVal custom tables in ConnectWise Automate. The automation aims to enhance efficiency by saving time in user permission management.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The script will drop the view if it exists, and recreate it followed by calling the script "CWM - Automate - Script - Update User Permissions for ProVal Custom Tables"

Time Saved by Automation: 5

## Sample Run

![Sample Run](../../../static/img/MySQL---View---Create-(plugin_proval_probeconfig)/image_1.png)

## Dependencies

[CWM - Automate - Script - Create View "plugin_proval_probeconfig"](<./MySQL - View - Create (plugin_proval_probeconfig).md>)  
[CWM - Automate - Custom View - plugin_proval_probeconfig](<../views/plugin_proval_probeconfig.md>)

## Process

> Drop the view if exists [CWM - Automate - Custom View - plugin_proval_probeconfig](<../views/plugin_proval_probeconfig.md>)  
> Create the view [CWM - Automate - Custom View - plugin_proval_probeconfig](<../views/plugin_proval_probeconfig.md>)  
> Call the script CWM - Automate - Script - Update User Permissions for ProVal Custom Tables to assign the permissions to the Automate users for the Plugin_Proval... custom tables and views.












