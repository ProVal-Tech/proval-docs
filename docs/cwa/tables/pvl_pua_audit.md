---
id: '2c4a0323-9532-4145-8fca-d9151c20773c'
title: 'Audit Data for PUA Removal'
title_meta: 'Audit Data for PUA Removal'
keywords: ['audit', 'pua', 'data', 'removal', 'script']
description: 'This document provides details about the audit data collected for the removal of potentially unwanted applications (PUAs) using a specific script in ConnectWise Automate. It includes information on dependencies and the structure of the audit data table.'
tags: ['database', 'report', 'removal', 'security']
draft: false
unlisted: false
---
## Purpose

Holds audit data from [CWM - Automate - Script - Remove - PUA](https://proval.itglue.com/DOC-5078775-11157214)

## Dependencies

[CWM - Automate - Script - Remove - PUA](https://proval.itglue.com/DOC-5078775-11157214)

## Tables

#### pvl_pua_audit

| Column              | Type     | Explanation                              |
|---------------------|----------|------------------------------------------|
| ComputerID          | INT      | Primary Key, the computer ID.           |
| Name                | VARCHAR  | Primary Key, the name of the bloatware. |
| Category            | VARCHAR  | The Category that the pua belongs to.   |
| DataCollectionTime  | DateTime | Data Collection Time                     |






