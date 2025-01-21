---
id: 'b1963e10-77b2-444a-80ac-9cfded3ab8a4'
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

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<./MySQL - Table - Create (plugin_proval_windows_os_support).md>)

## Output

- Custom Views



