---
id: '7668ab71-a969-42d2-bf54-6b3cc21e8cda'
slug: /7668ab71-a969-42d2-bf54-6b3cc21e8cda
title: 'Network Devices - Remove Older Than 60 Days'
title_meta: 'Network Devices - Remove Older Than 60 Days'
keywords: ['network', 'devices', 'inactive', 'sql', 'autofix']
description: 'This document describes a script that removes network devices that have not been online for 60 days. It is designed to be used as an Autofix solution, saving valuable time by automating the cleanup process. The script executes SQL queries to identify and delete inactive devices, ensuring a streamlined network management experience.'
tags: ['cleanup', 'sql']
draft: false
unlisted: false
---

## Summary

The script removes network devices that have not been online for 60 days. It should be used as an Autofix solution.

**Time Saved by Automation:** 10 Minutes

## Dependencies

[Network Devices Not Contacted for 60 Days](<../dataviews/Network Devices Not Contacted from 60 Days.md>)  
@Network Device Not Contacted From 60 Days Detection

## Process

The script runs a SQL query to delete network devices that have not been online for 60 days. It then verifies the deletion by executing another SQL query.

## Output

- Script log


