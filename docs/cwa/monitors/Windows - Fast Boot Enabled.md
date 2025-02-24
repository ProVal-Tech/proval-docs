---
id: '0598c4eb-e1c8-4b3a-8e49-7f654622f459'
title: 'Windows - Fast Boot Enabled'
title_meta: 'Windows - Fast Boot Enabled'
keywords: ['monitor', 'fast', 'boot', 'windows', 'disable']
description: 'This document outlines a monitor that detects machines with Windows Fast Boot enabled and provides an Autofix for Windows-based machines to disable it. It is intended for workstations and should not be run on servers.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Using a role definition, this monitor detects machines where Windows Fast Boot is enabled. There is an available Autofix for Windows-based machines that will attempt to disable Fast Boot. The script is named [Fast Boot - Disable](<../scripts/Fast Boot - Disable.md>).

## Dependencies

- [Windows Fast Boot Enabled](../roles/Windows%20Fast%20Boot%20Enabled.md)

## Target

Workstations - should be run on non-servers.
