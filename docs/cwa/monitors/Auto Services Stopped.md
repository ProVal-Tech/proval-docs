---
id: '29f53c95-c885-42ef-a24f-8030efc1830f'
title: 'ProVal Version of SVC - Auto Services Stopped Monitor'
title_meta: 'ProVal Version of SVC - Auto Services Stopped Monitor'
keywords: ['monitor', 'services', 'blacklist', 'wildcard', 'windows']
description: 'This document details the ProVal version of the default monitor "SVC - Auto Services Stopped", which has been enhanced to support wildcards in the service blacklist. It monitors services set to start automatically with Windows, excluding those listed in the blacklist. Instructions for modifying the blacklist are provided.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This is the ProVal version of the default monitor "SVC - Auto Services Stopped". It has been modified to support wildcards within the service blacklist in the System Dashboard. This monitor will track all the services that are set to automatically start with Windows and are not running, except for any that are mentioned in the service blacklist. To exclude any service from this monitor, add its name to the service blacklist. You can also use a wildcard to exclude all services with that name, such as using the wildcard 'GoogleUpdater*' to exclude all services with the name "GoogleUpdater".

## Dependencies

[Script - Service - Restart](<../scripts/Service - Restart.md>)

## Target

- Service Plans.Windows Workstations.Managed 24x7
- Service Plans.Windows Workstations.Managed 8x5
- Service Plans.Windows Servers.Managed 8x5
- Service Plans.Windows Servers.Managed 24x7

## Alert Template

- `△ Custom - Autofix - Restart Service`

