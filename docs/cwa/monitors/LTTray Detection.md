---
id: '28ddee2c-510a-4557-941a-168d155eacdc'
title: 'LTTray Detection'
title_meta: 'LTTray Detection'
keywords: ['lttray', 'port', 'registry', 'monitor', 'windows']
description: 'This document outlines a remote monitor designed to detect discrepancies between the LTTray port value in the registry and the actual port being utilized by Windows. It includes suggested alert styles, templates, and check actions for effective monitoring on Windows machines.'
tags: ['performance', 'registry', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor detects if the port value for the LTTray in the registry matches the actual port that is being used by Windows for the process.

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: Autofix - LTTray Fix  

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result          |
|--------------|----------------|-------------|-------------|------------|----------|------------------|
| System       | 127.0.0.1     | Run File    | See below   | Contains    | 900      | Ports are same    |

## Dependencies

[LTTray Port Mapping with System Registry](<../scripts/LTTray Port Mapping with System Registry.md>)

## Target

Windows machine



