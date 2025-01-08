---
id: 'cwa-import-windows-patching-mysql-view'
title: 'Import SEC - Windows Patching - MySQL View'
title_meta: 'Import SEC - Windows Patching - MySQL View'
keywords: ['import', 'mysql', 'windows', 'patching', 'view']
description: 'This document outlines a script used for importing the SEC - Windows Patching - MySQL View, specifically pvl_v_windows_version_metrics. It is intended for a one-time run and can be removed after confirming the view's presence.'
tags: ['database', 'windows', 'setup', 'security']
draft: false
unlisted: false
---
## Summary

This script can be used to import [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](https://proval.itglue.com/DOC-5078775-11560437) view. It's a one-time run and can be removed after ensuring the presence of the view.  

## Sample Run

![Sample Run](5078775/docs/11564063/images/19180985)

## Dependencies

- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)  
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)  

