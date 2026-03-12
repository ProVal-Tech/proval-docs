---
id: '84d6587b-2bca-4f0e-9176-c0df064f532c'
slug: /84d6587b-2bca-4f0e-9176-c0df064f532c
title: 'CPU Temperature Monitoring Process'
title_meta: 'CPU Temperature Monitoring Process'
keywords: ['cpu', 'temperature', 'monitoring', 'windows', 'physical']
description: 'This document outlines the process for monitoring CPU temperature on physical Windows machines using the CPUTempMon.exe tool. It details the conditions under which a failure is triggered and the necessary dependencies for effective monitoring.'
tags: ['performance', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-10
---

## Summary

The remote monitor is responsible for CPU temperature monitoring on physical Windows machines. It utilizes the [CPUTempMon.exe](https://proval.itglue.com/attachments/13313008) tool to obtain readings from the CPU temperature sensors. This tool is based on the [Libre Hardware Monitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor).

The remote monitor verifies if the current temperature readings from the sensors exceed the permissible temperature for more than two consecutive executions of the monitor set. If this condition is met, it triggers a failure.

The monitor set is established by the [CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314) script, and its configuration is dependent on the system properties and the EDFs, as detailed in the [script's](/docs/7519f655-224b-4c95-b716-773f59cb7314) documentation.

## Details

- **Suggested "Limit to":** Physical Windows machines
- **Suggested Alert Style:** Once
- **Suggested Alert Template:** `△ Custom - Ticket Creation - Computer` or `△ Custom - Email Creation - Computer`

## Dependencies

- [Script - CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314)
- [Internal Monitor - Execute Script - CPU Temperature Monitor - Create](/docs/7519f655-224b-4c95-b716-773f59cb7314)
- [Script - CPU Temperature Monitor - Manage](/docs/56c1260c-a689-45e9-a226-49bf31444750)
- [Solution - CPU Temperature Monitoring](/docs/cbd87b6f-563f-4fbb-82cf-2861c671f250)

## Ticketing

**Subject:** `CPU Temperature Monitoring - Failure - [COMPUTER NAME]`

**Sample Screenshot:**  
![Sample Screenshot](../../../static/img/docs/84d6587b-2bca-4f0e-9176-c0df064f532c/image_1_1.webp)

## Changelog

### 2025-04-10

- Initial version of the document
