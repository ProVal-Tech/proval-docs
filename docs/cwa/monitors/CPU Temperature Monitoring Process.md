---
id: 'cwa-cpu-temperature-monitoring'
title: 'CPU Temperature Monitoring on Physical Windows Machines'
title_meta: 'CPU Temperature Monitoring on Physical Windows Machines'
keywords: ['cpu', 'temperature', 'monitoring', 'windows', 'physical']
description: 'This document outlines the process for monitoring CPU temperature on physical Windows machines using the CPUTempMon.exe tool. It details the conditions under which a failure is triggered and the necessary dependencies for effective monitoring.'
tags: ['monitor', 'alert', 'windows', 'performance', 'hardware']
draft: false
unlisted: false
---
## Summary

The remote monitor is responsible for CPU temperature monitoring on physical Windows machines. It utilizes the [CPUTempMon.exe](https://proval.itglue.com/attachments/13313008) tool to obtain readings from the CPU temperature sensors. This tool is based on the [Libre Hardware Monitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor).

The remote monitor verifies if the current temperature readings from the sensors exceed the permissible temperature for more than two consecutive executions of the monitor set. If this condition is met, it triggers a failure.

The monitor set is established by the [EPM - Sensors - Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323116) script, and its configuration is dependent on the system properties and the EDFs, as detailed in the [script's](https://proval.itglue.com/DOC-5078775-14323116) documentation.

## Details

**Suggested "Limit to"**: Physical Windows machines

**Suggested Alert Style**: Once

**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer` or `△ Custom - Email Creation - Computer`

## Dependencies

- [EPM - Sensors - Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323116)
- [EPM - Sensors - Internal Monitor - Execute Script - CPU Temperature Monitor - Create](https://proval.itglue.com/DOC-5078775-14323118)
- [EPM - Sensors - Script - CPU Temperature Monitor - Manage](https://proval.itglue.com/DOC-5078775-14323117)

## Ticketing

**Subject:** `CPU Temperature Monitoring - Failure - <COMPUTER NAME>`

**Sample Screenshot:**  
![Sample Screenshot](../../../static/img/CPU-Temperature-Monitoring-Process/image_1.png)




