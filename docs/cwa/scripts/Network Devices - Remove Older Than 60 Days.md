---
id: '7668ab71-a969-42d2-bf54-6b3cc21e8cda'
title: 'Remove Inactive Network Devices'
title_meta: 'Remove Inactive Network Devices - Autofix Script'
keywords: ['network', 'devices', 'inactive', 'sql', 'autofix']
description: 'This document describes a script that removes network devices which have not been online for 60 days. It is designed to be used as an Autofix solution, saving valuable time by automating the cleanup process. The script executes SQL queries to identify and delete inactive devices, ensuring a streamlined network management experience.'
tags: ['network', 'cleanup', 'sql', 'automation', 'management']
draft: false
unlisted: false
---
## Summary

The script removes network devices that have not been online for 60 days. The script should be used as an Autofix.

Time Saved by Automation: 10 Minutes

## Dependencies

[Network Devices Not Contacted from 60 Days](https://proval.itglue.com/DOC-5078775-8023573)  
@Network Device Not Contacted From 60 Days Detection

## Process

The script runs a SQL query to delete network devices that have not been online for 60 days. It then verifies the deletion by running another SQL query.

## Output

- Script log






