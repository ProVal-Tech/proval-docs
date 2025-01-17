---
id: '21b8a07c-6756-415e-93c0-97e7eca8dbae'
title: 'Printer Driver Inventory Storage'
title_meta: 'Printer Driver Inventory Storage for ConnectWise Automate'
keywords: ['printer', 'inventory', 'data', 'driver', 'connectwise']
description: 'This document outlines the purpose and dependencies for storing printer driver inventory data in ConnectWise Automate. It details the structure of the database table used for this inventory, including the necessary columns and their explanations.'
tags: ['database', 'report', 'setup', 'software']
draft: false
unlisted: false
---
## Purpose

To store the data grabbed by [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](https://proval.itglue.com/DOC-5078775-10854806) script in order to feed into the [CWM - Automate - Dataview - Printer Driver Inventory [Script]](https://proval.itglue.com/DOC-5078775-10854809) dataview.

## Dependencies

- [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](https://proval.itglue.com/DOC-5078775-10854806)
- [CWM - Automate - Solution - Get - Printer Driver Inventory](https://proval.itglue.com/DOC-5078775-10854823)
- [CWM - Automate - Dataview - Printer Driver Inventory [Script]](https://proval.itglue.com/DOC-5078775-10854809)

## Tables

### plugin_proval_Printer_driver

| Column             | Type          | Explanation                                                  |
|--------------------|---------------|-------------------------------------------------------------|
| SerialNumber       | int(10)      | An Auto Incremental Column to serve as a primary key for the table |
| Computerid         | int(10)      | Computerid                                                  |
| Name               | varchar(256)  | Name of the Printer                                         |
| PrinterEnvironment  | varchar(100)  | Printer Environment e.g., Windows x64 or Windows x86      |
| Path               | varchar(256)  | Physical Path to the Printer Driver                        |
| DataFile           | varchar(256)  | Physical Path to the Driver's Data File                    |
| ConfigFile         | varchar(256)  | Physical Path to the Driver's Config File                  |
| HelpFile           | varchar(256)  | Physical Path to the Driver's Help File (if any)          |
| DependentFiles     | varchar(4096) | Path to the files dependent on this printer driver         |
| DefaultDataTypes   | varchar(20)   | Default extensions to print using this printer             |
| Manufacturer       | varchar(64)   | Manufacturer                                               |
| HardwareID         | varchar(64)   | HardwareID of the Printer                                  |
| Provider           | varchar(256)  | Provider/Manufacturer                                      |
| PrintProcessor     | varchar(128)  | Printer Processor                                          |
| InfPath            | varchar(256)  | Physical path to the Driver's inf file                     |
| DriverVersion      | varchar(32)   | Driver Version                                            |
| ScriptRunTime      | varchar(25)   | Script Run Time                                           |











