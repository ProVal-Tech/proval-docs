---
id: '9560f2db-f58f-4c07-a9da-2828deabc4cf'  
title: 'pvl_powerplan_audit'  
title_meta: 'pvl_powerplan_audit'  
keywords: ['scripting', 'automation', 'variables', 'functions', 'error handling']  
description: 'This document explores advanced techniques for script usage in PowerShell, including the use of variables, functions, and error handling to create efficient and robust scripts for various tasks.'  
tags: ['performance', 'security', 'setup', 'windows']  
draft: false  
unlisted: false  
---

## Purpose

Stores the information gathered by the [Power Plan - Audit [DV]](../scripts/Power%20Plan%20-%20Audit%20DV.md) script into the database.

## Dependencies

[Power Plan - Audit [DV]](../scripts/Power%20Plan%20-%20Audit%20DV.md)

## Tables

### pvl_powerplan_audit


| Column            | Type      | Explanation                                      |
|-------------------|-----------|--------------------------------------------------|
| Computerid        | INT       | Computerid                                       |
| PowerPlan         | VARCHAR   | Name of the Power Plan                           |
| PlanGUID          | VARCHAR   | GUID of the Power Plan                           |
| IsActive          | TinyINT   | Is the Power Plan Active on the computer?        |
| Subgroup          | VARCHAR   | Name of the Sub Group of the Power Plan          |
| SubgroupGUID      | VARCHAR   | GUID of the Sub Group of the Power Plan          |
| PowerSetting      | VARCHAR   | Name of the Power Setting of the Sub Group       |
| PowerSettingGUID  | VARCHAR   | GUID of the Power Setting of the Sub Group       |
| ACPowerSetting    | VARCHAR   | Setting of the Power Setting on the Direct Power |
| DCPowerSetting    | VARCHAR   | Setting of the Power Setting on the Battery      |
| ScriptRunTime     | DATETIME  | Data Collection Time                             |