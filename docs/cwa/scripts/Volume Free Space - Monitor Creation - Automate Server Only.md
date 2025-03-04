---
id: '8b42e4f9-eb46-4058-b4f9-e0f1ea8840cd'
title: 'Volume Free Space - Monitor Creation - Automate Server Only'
title_meta: 'Volume Free Space - Monitor Creation - Automate Server Only'
keywords: ['monitor', 'volume', 'free', 'space', 'ticket', 'drives', 'autotask']
description: 'This document details a script designed to monitor the free space on drives of the Automate server and generate tickets in the Autotask portal for any failures. It builds upon the existing Volume Free Space Monitor Creation script with modifications to enhance functionality and reporting.'
tags: ['autotask']
draft: false
unlisted: false
---

## Summary

This script runs similarly to the [CWM - Automate - Script - Volume Free Space - Monitor Creation](<./Create Predictive Volume Exhaustion Monitors.md>) script with a few changes. It is intended to use the dynamic monitor generated by the [CWM - Automate - Script - Volume Free Space - Monitor Creation](<./Create Predictive Volume Exhaustion Monitors.md>) script to monitor the Automate server's drives and to generate a ticket in our (ProVal's) Autotask portal for any failures.

## Sample Run

User parameters are only left in place in case we ever require them for any servers.

![Sample Run Image 1](../../../static/img/Volume-Free-Space---Monitor-Creation---Automate-Server-Only/image_1.png)

It is preferred to schedule the script against the "Labtech Server" group to run once per day.

![Sample Run Image 2](../../../static/img/Volume-Free-Space---Monitor-Creation---Automate-Server-Only/image_2.png)

## Dependencies

- [EPM - Disk - Agnostic - Get-VolumeExhaustionEstimate](<../../powershell/Get-VolumeExhaustionEstimate.md>)
- [EPM - Disk - Agnostic - Get-VolumeThresholds](<../../powershell/Get-VolumeThresholds.md>)
- PowerShell v5

## Process

Referred to: [CWM - Automate - Script - Volume Free Space - Monitor Creation](<./Create Predictive Volume Exhaustion Monitors.md>)

## Output

- Script log
- Remote Monitor



