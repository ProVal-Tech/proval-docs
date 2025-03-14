---
id: 'c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33'
title: 'MySQL - View - Create (pvl_cu_compliance)'
title_meta: 'MySQL - View - Create (pvl_cu_compliance)'
keywords: ['compliance', 'views', 'access', 'automate', 'permissions']
description: 'This document details a script that generates compliance views named `pvl_cu_compliance` and `pvl_cu_compliance_clients` and grants access permissions to all currently active Automate users. The script can be run on any computer to create the views, after which it should be removed from the environment.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The script aims to generate views named `pvl_cu_compliance` and `pvl_cu_compliance_clients`, and subsequently grant access permissions to all currently active Automate users.

Run the script on any computer to create the views, and afterward, remove the script from the environment.

## Sample Run

![Sample Run](../../../static/img/MySQL---View---Create-(pvl_cu_compliance)/image_1.png)

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Output

- Custom Views



