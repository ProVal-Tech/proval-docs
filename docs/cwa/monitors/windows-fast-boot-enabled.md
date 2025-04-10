---
id: '0598c4eb-e1c8-4b3a-8e49-7f654622f459'
slug: /0598c4eb-e1c8-4b3a-8e49-7f654622f459
title: 'Windows - Fast Boot Enabled'
title_meta: 'Windows - Fast Boot Enabled'
keywords: ['monitor', 'fast', 'boot', 'windows', 'disable']
description: 'This document outlines a monitor that detects machines with Windows Fast Boot enabled and provides an Autofix for Windows-based machines to disable it. It is intended for workstations and should not be run on servers.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Using a role definition, this monitor detects machines where Windows Fast Boot is enabled. There is an available Autofix for Windows-based machines that will attempt to disable Fast Boot. The script is named [Fast Boot - Disable](/docs/663e3658-c389-4ab6-b7a2-8486f9e237c1).

## Dependencies

- [Windows Fast Boot Enabled](/docs/2929d042-dfa6-4721-b60d-9fd78269b942)

## Target

Workstations - should be run on non-servers.
