---
id: 'cwa-battery-information-storage'
title: 'Battery Information Storage for Targets'
title_meta: 'Battery Information Storage for Targets'
keywords: ['battery', 'information', 'storage', 'report', 'health']
description: 'This document outlines the purpose, dependencies, and structure of the Battery Information Storage for each target machine in ConnectWise Automate. It details the necessary table and its columns for storing battery-related data, including health state, capacity, and manufacturer information.'
tags: ['database', 'report', 'configuration', 'software']
draft: false
unlisted: false
---
## Purpose

Stores Battery Information for each target

## Dependencies

[EPM - Data Collection - Automate - Script Get - Battery Report](https://proval.itglue.com/DOC-5078775-11216978)  Creates this table.

## Tables

### plugin_proval_batteries

| Column                     | Type      | Explanation                                         |
|---------------------------|-----------|-----------------------------------------------------|
| ComputerID                | INT       | Holds the target machine id in automate.            |
| BatteryID                 | VarChar   | Holds an alpha numeric battery ID.                  |
| Chemistry                 | VarChar   | The battery Chemistry.                               |
| CycleCount                | VarChar   | The Battery CycleCount.                             |
| DesignCapacity            | VarChar   | The Battery Design Capacity.                         |
| FullChargeCapacity        | VarChar   | The Battery Full Charge Capacity.                   |
| BatteryState              | varchar    | Health State of Battery, OK/poor/Very Poor.        |
| BatteryHealthPercentage    | int       | Life left for the battery.                          |
| LongTerm                  | VarChar   | The Battery LongTerm Value.                         |
| ManufactureDate           | VarChar   | The Battery Manufacture Date.                       |
| Manufacturer              | VarChar   | The Battery Manufacturer.                           |
| RelativeCapacity          | VarChar   | The Battery Relative Capacity.                       |
| SerialNumber              | VarChar   | The Battery SerialNumber.                           |
| LastScanTime              | DateTime  | The Last Scan Time for the report.                  |



