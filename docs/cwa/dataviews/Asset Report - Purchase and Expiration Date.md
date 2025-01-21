---
id: '931fbe83-9616-4ae2-b7ae-128538a5fa73'
title: 'Asset Report - Purchase and Expiration Date'
title_meta: 'Asset Report - Purchase and Expiration Date'
keywords: ['dataview', 'cwm', 'configurations', 'managed', 'active']
description: 'This document provides an overview of the Dataview that displays information gathered by the CWM - Automate script for active and managed configurations. It includes details about dependencies, columns, and their descriptions to help users understand the data presented.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Dataview displays the information gathered by the [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](<../scripts/Get CWM Configurations - Active And Managed Only.md>) script along with some basic information.

## Dependencies

- [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](<../scripts/Get CWM Configurations - Active And Managed Only.md>)
- [CWM - Automate - Custom Table - pvl_cwm_configurations](<../tables/pvl_cwm_configurations.md>)

## Columns

| Column                    | Description                                                                                                   |
|--------------------------|---------------------------------------------------------------------------------------------------------------|
| clientid                 | Client ID                                                                                                    |
| locationid               | Location ID                                                                                                  |
| computerid               | Computer ID                                                                                                  |
| Client                   | Client Name                                                                                                  |
| Location                 | Location Name                                                                                                |
| Computer                 | Computer Name                                                                                                |
| Operating System         | Operating System                                                                                             |
| Last Logged In User      | Last Logged In User                                                                                          |
| Last Contact             | Last Contact with Automate                                                                                   |
| Purchase Date            | Purchase Date (From CW Manage)                                                                               |
| Expiration Date          | Warranty Expiration Date (From CW Manage)                                                                    |
| Is Virtual               | Is Virtual? (Yes/No)                                                                                        |
| Status                   | Warranty Status of the computer. Conditional formatting is applied to this column: <br/> - Expired: Dark Red <br/> - Expiring < 90 Days: Dark Orange <br/> - In Warranty: Dark Green <br/> - N/A: Virtual computers/Computers not having Warranty Date available |
| Model Number             | Computer's Model (From CW Manage)                                                                           |
| Serial Number            | Serial Number of computer (Hidden)                                                                          |
| Data Collection Time     | Data Collection Time                                                                                         |




