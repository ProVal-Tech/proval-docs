---
id: 'a9dabf31-db77-49f9-9403-22f1a259678e'
slug: /a9dabf31-db77-49f9-9403-22f1a259678e
title: 'IdleMon Report'
title_meta: 'IdleMon Report'
keywords: ['dataview', 'historical', 'idletime', 'threshold', 'globals', 'dependencies', 'columns', 'screenshot']
description: 'This document provides an overview of the IdleMon Report, detailing its purpose, dependencies, and the structure of the data it presents, including user idletime for a computer, along with a sample screenshot for reference.'
tags: ['domain', 'report']
draft: false
unlisted: false
---

## Summary

The purpose of the dataview is to display the historical data of the user's idletime for a computer. The threshold of the data is defined in the global variable `ThresholdDays` of the [CWM - Automate - Script - IdleMon Report [Globals]](<../scripts/IdleMon Report Globals.md>) script.

## Dependencies

- [CWM - Automate - Script - IdleMon Report [Globals]](<../scripts/IdleMon Report Globals.md>)
- [CWM - Automate - Custom Table - pvl_report_idlemon](<../tables/pvl_report_idlemon.md>)

## Columns

| Column               | Description                                                                                                      |
|---------------------|------------------------------------------------------------------------------------------------------------------|
| clientid            | clientid (Hidden)                                                                                               |
| locationid          | locationid (Hidden)                                                                                             |
| computerid          | computerid                                                                                                      |
| Location            | Location Name                                                                                                   |
| Client              | Client Name                                                                                                     |
| Computer            | Computer Name                                                                                                   |
| Operating System     | Operating System                                                                                                |
| UserName            | Logged on User (Not Logged In if no one was logged on to the machine during script run)                       |
| Domain              | Domain of the user (Name of the computer for local users)                                                     |
| Idle Time           | Idle Time of the user (Hours:Minutes:Seconds.Milliseconds)                                                    |
| Is Admin            | Is Admin? (True/False) (Hidden)                                                                                |
| Is Domain Admin     | Is Domain Admin? (True/False) (Hidden)                                                                         |
| Is Enterprise Admin  | Is Enterprise Admin? (True/False) (Hidden)                                                                    |
| Sample Collection Time | Sample Collection Time                                                                                        |

## Sample Screenshot

![Sample Screenshot](../../../static/img/IdleMon-Report/image_1.png)


