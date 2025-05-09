---
id: 'c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33'
slug: /c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33
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

![Sample Run](../../../static/img/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33/image_1.webp)

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Output

- Custom Views