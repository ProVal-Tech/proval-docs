---
id: '6a68b349-fa31-41d0-9a6c-80eef1a13fdb'
slug: /6a68b349-fa31-41d0-9a6c-80eef1a13fdb
title: 'Last Cumulative Update  45 Days and  60 Days'
title_meta: 'Last Cumulative Update  45 Days and  60 Days'
keywords: ['cumulative', 'update', 'monitor', 'alert', 'ticketing']
description: 'This document outlines a monitor set that identifies computers with cumulative updates installed between 45 and 60 days ago, excluding End-of-Life machines. It includes dependencies and a custom alert template for efficient tracking and management.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor identifies computers whose last cumulative update was installed more than 45 days but less than 60 days ago, excluding End-of-Life (EOL) machines.

The monitor set will not continue detecting the computers for which a ticket has already been generated if it is using the suggested alert template `△ Custom - Autofix - Out Of Date Cumulative Updates without Ticketing`.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998)
- [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix] [without Ticketing]](/docs/5e2c781f-761a-42f8-8d0a-d2866c2318b5)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Target

Global

## Alert Template

`△ Custom - Autofix - Out Of Date Cumulative Updates without Ticketing`

The alert template executes the [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]](/docs/dedb8564-bb1a-47b8-9525-61fc9e690cae) script.