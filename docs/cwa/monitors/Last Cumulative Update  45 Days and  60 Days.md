---
id: 'cwa-out-of-date-cumulative-updates'
title: 'Out Of Date Cumulative Updates Monitor'
title_meta: 'Out Of Date Cumulative Updates Monitor'
keywords: ['cumulative', 'update', 'monitor', 'alert', 'ticketing']
description: 'This document outlines a monitor set that identifies computers with cumulative updates installed between 45 and 60 days ago, excluding End-of-Life machines. It includes dependencies and a custom alert template for efficient tracking and management.'
tags: ['monitoring', 'updates', 'alert', 'ticketing', 'windows']
draft: false
unlisted: false
---
## Summary

Identifies computers whose last cumulative update was installed more than 45 days but less than 60 days ago, excluding End-of-Life (EOL) machines.  

The monitor set will not keep detecting the computers where a ticket is already generated if it's using the suggested alert template `△ Custom - Autofix - Out Of Date Cumulative Updates without Ticketing`.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460) 
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) 
- [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix] [without Ticketing]](https://proval.itglue.com/DOC-5078775-16208967) 
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) 

## Target

Global

## Alert Template

`△ Custom - Autofix - Out Of Date Cumulative Updates without Ticketing`

The alert template executes the [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]](https://proval.itglue.com/DOC-5078775-14790498) script.


