---
id: 'cwa-monitor-battery-report'
title: 'Monitor Battery Report for Computers'
title_meta: 'Monitor Battery Report for Computers - Automate Script'
keywords: ['monitor', 'battery', 'report', 'computers', 'script']
description: 'This document outlines a monitor that checks computers for battery report data, triggering a script to collect the latest battery information if the last scan was over 24 hours ago. It includes dependencies, target criteria, and an alert template for execution.'
tags: ['monitoring', 'script', 'alert', 'data-collection', 'computers']
draft: false
unlisted: false
---
## Summary

This monitor will check two times a day targeting only computers where the last battery report scan is greater than 24 hours ago, and the last battery report returned data, and run the [EPM - Data Collection - Automate - Script Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978) script.

## Dependencies

- [EPM - Data Collection - Automate - Script Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978)
- [EPM - Data Collection - Custom Table - plugin_proval_batteries](https://proval.itglue.com/DOC-5078775-11420540)
- [CWM - Automate - Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461)
- [EPM - Data Collection - Solution - Get-BatteryReport](https://proval.itglue.com/DOC-5078775-11149927)

## Target

The nature of the monitor is to select all computers which have returned a valid battery in the past, or if the last scan was more than 24 hours ago. This Monitor then triggers the Automate Get - Battery Report script to run on any device found with the conditions above.

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Get-BatteryReport`

The Alert template should run the [EPM - Data Collection - Automate - Script Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978) script.


