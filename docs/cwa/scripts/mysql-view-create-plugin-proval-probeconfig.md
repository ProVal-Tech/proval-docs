---
id: '5bee0fdf-d4c0-4158-8d69-ba49f43b66c5'
slug: /5bee0fdf-d4c0-4158-8d69-ba49f43b66c5
title: 'MySQL - View - Create (plugin_proval_probeconfig)'
title_meta: 'MySQL - View - Create (plugin_proval_probeconfig)'
keywords: ['view', 'recreate', 'permissions', 'custom', 'tables']
description: 'This document outlines the process of dropping an existing view and recreating it, followed by executing a script to update user permissions for ProVal custom tables in ConnectWise Automate. The automation aims to enhance efficiency by saving time in user permission management.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script will drop the view if it exists, recreate it, and then call the script "CWM - Automate - Script - Update User Permissions for ProVal Custom Tables."

**Time Saved by Automation:** 5 hours

## Sample Run

![Sample Run](../../../static/img/docs/5bee0fdf-d4c0-4158-8d69-ba49f43b66c5/image_1.webp)

## Dependencies

- [CWM - Automate - Script - Create View "plugin_proval_probeconfig"](/docs/5bee0fdf-d4c0-4158-8d69-ba49f43b66c5)  
- [CWM - Automate - Custom View - plugin_proval_probeconfig](/docs/bd07c1dc-34ff-4f87-aae9-b43dcd1b5057)

## Process

1. Drop the view if it exists: [CWM - Automate - Custom View - plugin_proval_probeconfig](/docs/bd07c1dc-34ff-4f87-aae9-b43dcd1b5057)  
2. Create the view: [CWM - Automate - Custom View - plugin_proval_probeconfig](/docs/bd07c1dc-34ff-4f87-aae9-b43dcd1b5057)  
3. Call the script "CWM - Automate - Script - Update User Permissions for ProVal Custom Tables" to assign the permissions to the Automate users for the Plugin_Proval custom tables and views.