---
id: 'cwa-windows-11-compatibility-check'
title: 'Windows 11 Compatibility Check Monitor Set'
title_meta: 'Windows 11 Compatibility Check Monitor Set'
keywords: ['windows', 'monitor', 'compatibility', 'check', 'script']
description: 'This document outlines the monitor set designed to execute the Windows - Check Windows 11 Compatibility script, detailing its scheduling, execution frequency, and dependencies, ensuring that systems are ready for the Windows 11 upgrade.'
tags: ['monitoring', 'scheduling', 'execution', 'upgrade', 'dependency']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor set is to execute the [Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-8355447) script. This script can either be scheduled against the group, or we can use this monitor set to execute the script.

The monitor set will execute the script only once against the machines where it had never been executed, and once per six months against the machines where the upgrade was not capable during the previous execution of the script. Additionally, if the script failed to complete successfully, it will re-attempt that check every 30 days.

## Dependencies

- [EPM - Windows Configuration - Custom Table - plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448)
- [SEC - Windows Patching - Script - Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-8355447)

## Target

Global

## Alert Template

△ Custom - Execute Script - Windows 11 Compatibility Check


