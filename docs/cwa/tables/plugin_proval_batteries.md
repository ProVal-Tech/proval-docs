---
id: '5507c4d8-9cfc-4d67-9c84-7cbad5a37de1'
title: 'plugin_proval_batteries'
title_meta: 'plugin_proval_batteries'
keywords: ['battery', 'information', 'storage', 'report', 'health']
description: 'This document outlines the purpose, dependencies, and structure of the Battery Information Storage for each target machine in ConnectWise Automate. It details the necessary table and its columns for storing battery-related data, including health state, capacity, and manufacturer information.'
tags: ['database', 'report', 'software']
draft: false
unlisted: false
---

## Purpose

Stores battery information for each target.

## Dependencies

[EPM - Data Collection - Automate - Script Get - Battery Report](<../scripts/EPM - Data Collection - Automate - Script Get - Battery Report.md>) creates this table.

## Tables

### plugin_proval_batteries

| Column                     | Type      | Explanation                                         |
|---------------------------|-----------|-----------------------------------------------------|
| ComputerID                | INT       | Holds the target machine ID in Automate.            |
| BatteryID                 | VarChar   | Holds an alphanumeric battery ID.                   |
| Chemistry                 | VarChar   | The battery chemistry.                               |
| CycleCount                | VarChar   | The battery cycle count.                             |
| DesignCapacity            | VarChar   | The battery design capacity.                         |
| FullChargeCapacity        | VarChar   | The battery full charge capacity.                   |
| BatteryState              | VarChar   | Health state of battery: OK/poor/very poor.        |
| BatteryHealthPercentage    | INT       | Life left for the battery.                          |
| LongTerm                  | VarChar   | The battery long-term value.                        |
| ManufactureDate           | VarChar   | The battery manufacture date.                       |
| Manufacturer              | VarChar   | The battery manufacturer.                           |
| RelativeCapacity          | VarChar   | The battery relative capacity.                       |
| SerialNumber              | VarChar   | The battery serial number.                          |
| LastScanTime              | DateTime  | The last scan time for the report.                 |



