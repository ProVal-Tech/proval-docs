---
id: 'b1963e10-77b2-444a-80ac-9cfded3ab8a4'
slug: /b1963e10-77b2-444a-80ac-9cfded3ab8a4
title: 'MySQL - View - Create (pvl_patch_cu_compliance)'
title_meta: 'MySQL - View - Create (pvl_patch_cu_compliance)'
keywords: ['views', 'patch', 'compliance', 'automate', 'permissions']
description: 'This document outlines a script designed to create views named `pvl_patch_cu_compliance` and `pvl_patch_cu_compliance_clients` within ConnectWise Automate, and to grant access permissions to all active users. The script can be executed on any computer to implement the views, followed by the removal of the script from the environment.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The script aims to generate views named `pvl_patch_cu_compliance` and `pvl_patch_cu_compliance_clients`, and subsequently grant access permissions to all currently active Automate users.

Run the script on any computer to create the views, and afterward, remove the script from the environment.

## Sample Run

![Sample Run](../../../static/img/MySQL---View---Create-(pvl_patch_cu_compliance)/image_1.png)

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)

## Output

- Custom Views



