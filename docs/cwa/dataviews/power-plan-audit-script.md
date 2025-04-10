---
id: '3c11e893-b78e-4dc9-a8c2-c80060da203b'
slug: /3c11e893-b78e-4dc9-a8c2-c80060da203b
title: 'Power Plan - Audit Script'
title_meta: 'Power Plan - Audit Script'
keywords: ['power', 'plan', 'audit', 'data', 'view', 'settings', 'collection']
description: 'This document provides a summary of the Power Plan Audit Data View, detailing the power plan settings gathered by the EPM Data Collection script. It includes information about dependencies, columns, and a sample screenshot for visualization.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

The data view displays the power plan settings gathered by the [EPM - Data Collection - Script - Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d) script.

## Dependencies

- [EPM - Data Collection - Script - Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d)  
- [EPM - Data Collection - Custom Table - pvl_powerplan_audit](/docs/9560f2db-f58f-4c07-a9da-2828deabc4cf)  
- [EPM - Data Collection - Internal Monitor - Execute Script - Power Plan - Audit](/docs/fdbe1912-b216-4876-b64b-db83eee691a1)  

## Columns

| Column                     | Description                                               |
|---------------------------|-----------------------------------------------------------|
| Clientid                  | Client ID (Hidden)                                       |
| Locationid                | Location ID (Hidden)                                     |
| Computerid                | Computer ID (Hidden)                                     |
| Client                    | Client Name                                             |
| Location                  | Location Name                                           |
| Computer                  | Computer Name                                           |
| Operating System          | Operating System                                        |
| Last Contact              | Last Contact with RMM                                   |
| Last Logged In User       | Last Logged In User                                     |
| Form Factor               | Form Factor of the Machine                              |
| Power Plan                | Name of the Power Plan                                  |
| Power Plan GUID           | GUID of the Power Plan (Hidden)                         |
| Is Active                 | Is the Power Plan active on the machine?                |
| SubGroup Name             | Name of the Sub Group of the Power Plan                 |
| SubGroup GUID             | GUID of the Sub Group of the Power Plan                 |
| Power Setting Name        | Name of the Power Setting of the Sub Group              |
| Power Setting GUID        | GUID of the Power Setting of the Sub Group (Hidden)     |
| On Direct Power Setting (AC) | Value for the Power Setting on the machine when directly connected to electricity. |
| On Battery Power Setting (DC) | Value for the Power Setting on the machine when running on Battery/UPS power. |
| Script Run Time           | Data Collection Time                                    |

## Sample Screenshot

<iframe src="https://proval.itglue.com/attachments/14048242?preview=1" width="100%" height="1000px" frameborder="0"></iframe>
## Attachments
[sample_powerplan_dataview.png](<../../../static/attachments/itg/15053779/sample_powerplan_dataview.png>)
