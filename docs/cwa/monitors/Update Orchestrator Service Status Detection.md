---
id: 'e3c5aeb1-144d-4c12-9b33-2d56d05804ce'
title: 'Update Orchestrator Service Status Detection'
title_meta: 'Update Orchestrator Service Status Detection'
keywords: ['monitor', 'service', 'windows', 'alert', 'check']
description: 'This document provides details on a monitor designed to check the status of the Update Orchestrator Service on Windows machines. If the service is running, it triggers an alert based on the specified template. Suggested configurations for the monitor, including check actions and dependencies, are also included.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This monitor checks for the Update Orchestrator Service. If the service is running, it will trigger the applied alert template.

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Continuous  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type    | Check Value | Comparator | Interval | Result |
|--------------|----------------|---------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Service Check | UsoSvc      | Contains   | 60       | 0      |

## Dependencies

- [Update Orchestrator Service - Disable](<../scripts/Update Orchestrator Service - Disable.md>)

## Target

Windows Machine
