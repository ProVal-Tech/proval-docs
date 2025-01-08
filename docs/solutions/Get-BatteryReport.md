---
id: 'cwa-workstation-battery-state'
title: 'Workstation Battery State Monitoring'
title_meta: 'Workstation Battery State Monitoring'
keywords: ['workstation', 'battery', 'monitoring', 'report', 'threshold']
description: 'This document provides a comprehensive solution for monitoring the battery state of workstations. It includes scripts, dataviews, and internal monitors to effectively collect and report battery data, ensuring proactive management of battery health.'
tags: ['battery', 'monitor', 'report', 'setup', 'configuration']
draft: false
unlisted: false
---
## Purpose

This solution provides information on a workstation's battery state.

## Associated Content

### Core Content

| Content                                                                                     | Type             | Function                                                      |
|---------------------------------------------------------------------------------------------|------------------|--------------------------------------------------------------|
| [Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461)                 | Automate Script   | Sets Computer or System Property.                             |
| [Script - Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978)           | Automate Script   | Places Battery data in custom table.                         |
| [Internal Monitor - Proval - Production - DailyScript - Get-BatteryReport](https://proval.itglue.com/DOC-5078775-11417979) | Internal Monitor   | Checks for any machine that has not.                         |
| △ CUSTOM - Execute Script - Get-BatteryReport                                              | Alert Template    | Execute the data collection script on the machines detected by the internal monitor. |
| [Dataview - Proval - Battery Report](https://proval.itglue.com/DOC-5078775-11140837)     | Dataview         | Displays Battery report information and calculates battery state using global or computer thresholds. |

### Other Content

| Content                                                                                     | Type             | Function                                                      |
|---------------------------------------------------------------------------------------------|------------------|--------------------------------------------------------------|
| [Custom Table - plugin_proval_batteries](https://proval.itglue.com/DOC-5078775-11420540) | Custom Table      | Stores Battery Information for each target                   |
| [Agnostic - Get-BatteryReport.ps1](https://proval.itglue.com/DOC-5078775-11299341)       | Agnostic Script    | Collects Battery report data and returns it as an object.    |

## Implementation

1. **Import the following scripts using the ProSync Plugin:**
   - [Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461)
   - [Script - Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978)

2. **Import the following Dataview using the ProSync plugin:**
   - [Dataview - Proval - Battery Report](https://proval.itglue.com/DOC-5078775-11140837)

3. **Import the following Internal Monitor using the ProSync plugin:**
   - [Internal Monitor - Proval - Production - DailyScript - Get-BatteryReport](https://proval.itglue.com/DOC-5078775-11417979)

4. **Import the following alert template using the ProSync Plugin:**
   - `△ CUSTOM - Execute Script - Get-BatteryReport`

5. **Using [CWM - Automate - Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461), set up a property named Proval-BatteryThreshold, with a value of your choosing in percent without the percent sign, with a type of Global and overwrite equal to 1**
   - If a custom threshold is not provided by the consultant, please set it to 70
     - No tickets will be generated from this solution. This is strictly for the dataview to report the threshold violations.
   - **OPTIONAL:** Using [CWM - Automate - Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461), set up any computer-specific property named Proval-BatteryThreshold, with a value of your choosing in percent without the percent sign, with a type of Computer and overwrite equal to 1
     - Only perform this step if instructed to do so by the consultant

6. **Reload the System Cache:**
   ![Reload the System Cache](https://proval.itglue.com/5078775/docs/14876168/images/21622864)

7. **Configure the solution as follows:**
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Proval - Production - DailyScript - Get-BatteryReport](https://proval.itglue.com/DOC-5078775-11417979)
       - Configure with the alert template: `△ CUSTOM - Execute Script - Get-BatteryReport`
       - Right-click and Run Now to start the monitor.

