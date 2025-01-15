---
id: '3c11e893-b78e-4dc9-a8c2-c80060da203b'
title: 'Power Plan Audit Data View'
title_meta: 'Power Plan Audit Data View'
keywords: ['power', 'plan', 'audit', 'data', 'view', 'settings', 'collection']
description: 'This document provides a summary of the Power Plan Audit Data View, detailing the power plan settings gathered by the EPM Data Collection script. It includes information about dependencies, columns, and a sample screenshot for visualization.'
tags: ['audit', 'data', 'collection', 'settings', 'report', 'performance', 'windows']
draft: false
unlisted: false
---
## Summary

The dataview displays the power plan settings gathered by the [EPM - Data Collection - Script - Power Plan - Audit [DV]](https://proval.itglue.com/DOC-5078775-15053771) script.

## Dependencies

- [EPM - Data Collection - Script - Power Plan - Audit [DV]](https://proval.itglue.com/DOC-5078775-15053771)  
- [EPM - Data Collection - Custom Table - pvl_powerplan_audit](https://proval.itglue.com/DOC-5078775-15054015)  
- [EPM - Data Collection - Internal Monitor - Execute Script - Power Plan - Audit](https://proval.itglue.com/DOC-5078775-15053780)  

## Columns

| Column                     | Description                                               |
|---------------------------|-----------------------------------------------------------|
| Clientid                  | Clientid (Hidden)                                        |
| Locationid                | Locationid (Hidden)                                      |
| Computerid                | Computerid (Hidden)                                      |
| Client                    | Client Name                                              |
| Location                  | Location Name                                            |
| Computer                  | Computer Name                                            |
| Operating System          | Operating System                                         |
| Last Contact              | Last Contact with RMM                                    |
| Last Logged In User       | Last Logged In User                                      |
| Form Factor               | Form Factor of the Machine                               |
| Power Plan                | Name of the Power Plan                                   |
| Power Plan GUID           | GUID of the Power Plan (Hidden)                          |
| Is Active                 | Is the Power Plan active on the machine?                 |
| SubGroup Name             | Name of the Sub Group of the Power Plan                  |
| SubGroup GUID             | GUID of the Sub Group of the Power Plan                  |
| Power Setting Name        | Name of the Power Setting of the Sub Group               |
| Power Setting GUID        | GUID of the Power Setting of the Sub Group (Hidden)      |
| On Direct Power Setting (AC) | Value for the Power Setting on the machine when directly connected to electricity. |
| On Battery Power Setting (DC) | Value for the Power Setting on the machine when running on the Battery/UPS power. |
| Script Run Time           | Data Collection Time                                     |

## Sample Screenshot

<div><iframe src="https://proval.itglue.com/attachments/14048242?preview=1" width="100%" height="1000px" frameborder="0"></iframe></div>






