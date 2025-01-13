---
id: 'cwa-fast-boot-monitor'
title: 'Windows Fast Boot Monitor'
title_meta: 'Windows Fast Boot Monitor'
keywords: ['monitor', 'fast', 'boot', 'windows', 'disable']
description: 'This document outlines a monitor that detects machines with Windows Fast Boot enabled and provides an Autofix for Windows-based machines to disable it. It is intended for workstations and should not be run on servers.'
tags: ['monitoring', 'windows', 'configuration', 'workstation', 'autofix']
draft: false
unlisted: false
---
## Summary

Using a role definition this monitor detects machines where windows fast boot is enabled. There is an available Autofix for Windows-based machines that will attempt to disable fast boot. The script is named [Fast Boot - Disable](https://proval.itglue.com/DOC-5078775-7776315).

## Dependencies

- @Windows Fast Boot Enabled

## Target

Workstations - Should be run on non-servers.




