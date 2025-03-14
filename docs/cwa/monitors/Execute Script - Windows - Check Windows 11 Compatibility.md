---
id: '8aa2542c-c61f-43b8-a7ec-ec33558319e4'
title: 'Execute Script - Windows - Check Windows 11 Compatibility'
title_meta: 'Execute Script - Windows - Check Windows 11 Compatibility'
keywords: ['windows', 'monitor', 'compatibility', 'check', 'script']
description: 'This document outlines the monitor set designed to execute the Windows - Check Windows 11 Compatibility script, detailing its scheduling, execution frequency, and dependencies, ensuring that systems are ready for the Windows 11 upgrade.'
tags: []
draft: false
unlisted: false
---

## Summary

The purpose of this monitor set is to execute the [Windows - Check Windows 11 Compatibility](<../scripts/Windows - Check Windows 11 Compatibility.md>) script. This script can either be scheduled against the group, or we can use this monitor set to execute the script.

The monitor set will execute the script only once against the machines where it has never been executed, and once every six months against the machines where the upgrade was not possible during the previous execution of the script. Additionally, if the script fails to complete successfully, it will re-attempt that check every 30 days.

## Dependencies

- [EPM - Windows Configuration - Custom Table - plugin_proval_windows11_readiness](<../tables/plugin_proval_windows11_readiness.md>)
- [SEC - Windows Patching - Script - Windows - Check Windows 11 Compatibility](<../scripts/Windows - Check Windows 11 Compatibility.md>)

## Target

Global

## Alert Template

△ Custom - Execute Script - Windows 11 Compatibility Check



