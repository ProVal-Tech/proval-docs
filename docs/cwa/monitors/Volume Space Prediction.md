---
id: 'd9cc98b2-179a-4fa0-b278-9d80e9fbfa92'
title: 'Volume Free Space Monitor'
title_meta: 'Volume Free Space Monitor - Alert on Low Disk Space'
keywords: ['monitor', 'disk', 'space', 'alert', 'volume']
description: 'This document provides an overview of the Volume Free Space Monitor, which is designed to alert users when low disk space is detected on Windows machines. The monitor is dynamically generated from the script Volume Free Space - Monitor Creation and includes suggested settings for alerting and ticket creation.'
tags: ['disk', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor is dynamically generated from the script [Volume Free Space - Monitor Creation](<../scripts/Create Predictive Volume Exhaustion Monitors.md>). It is used to alert on low space on a volume.

## Details

**Suggested "Limit to"**: N/A  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Automated Ticket  

This monitor will have dynamic properties based on the result of the script [Volume Free Space - Monitor Creation](<../scripts/Create Predictive Volume Exhaustion Monitors.md>).

## Dependencies

N/A

## Target

Windows Machines - Should be run on all Windows machines
