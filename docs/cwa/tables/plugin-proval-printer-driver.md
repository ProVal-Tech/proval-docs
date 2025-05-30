---
id: '21b8a07c-6756-415e-93c0-97e7eca8dbae'
slug: /21b8a07c-6756-415e-93c0-97e7eca8dbae
title: 'plugin_proval_Printer_driver'
title_meta: 'plugin_proval_Printer_driver'
keywords: ['printer', 'inventory', 'data', 'driver', 'connectwise']
description: 'This document outlines the purpose and dependencies for storing printer driver inventory data in ConnectWise Automate. It details the structure of the database table used for this inventory, including the necessary columns and their explanations.'
tags: ['database', 'report', 'setup', 'software']
draft: false
unlisted: false
---

## Purpose

To store the data retrieved by the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) script to feed into the [Printer Driver Inventory](/docs/899b54a9-001d-4d76-8735-fb436c2fc9c1) dataview.

## Dependencies

- [Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4)
- [Get - Printer Driver Inventory](/docs/485b0ab5-8ce4-400c-9ba6-dff7967988aa)
- [Printer Driver Inventory](/docs/899b54a9-001d-4d76-8735-fb436c2fc9c1) 

## Tables

### plugin_proval_Printer_driver

| Column             | Type          | Explanation                                                             |
| ------------------ | ------------- | ----------------------------------------------------------------------- |
| SerialNumber       | int(10)       | An auto-incremental column that serves as the primary key for the table |
| Computerid         | int(10)       | Identifier for the computer                                             |
| Name               | varchar(256)  | Name of the printer                                                     |
| PrinterEnvironment | varchar(100)  | Printer environment, e.g., Windows x64 or Windows x86                   |
| Path               | varchar(256)  | Physical path to the printer driver                                     |
| DataFile           | varchar(256)  | Physical path to the driver's data file                                 |
| ConfigFile         | varchar(256)  | Physical path to the driver's config file                               |
| HelpFile           | varchar(256)  | Physical path to the driver's help file (if any)                        |
| DependentFiles     | varchar(4096) | Path to the files dependent on this printer driver                      |
| DefaultDataTypes   | varchar(20)   | Default extensions for printing using this printer                      |
| Manufacturer       | varchar(64)   | Manufacturer of the printer                                             |
| HardwareID         | varchar(64)   | Hardware ID of the printer                                              |
| Provider           | varchar(256)  | Provider/manufacturer                                                   |
| PrintProcessor     | varchar(128)  | Printer processor                                                       |
| InfPath            | varchar(256)  | Physical path to the driver's INF file                                  |
| DriverVersion      | varchar(32)   | Driver version                                                          |
| ScriptRunTime      | varchar(25)   | Script run time                                                         |