---
id: '2c4a0323-9532-4145-8fca-d9151c20773c'
title: 'pvl_pua_audit'
title_meta: 'pvl_pua_audit'
keywords: ['audit', 'pua', 'data', 'removal', 'script']
description: 'This document provides details about the audit data collected for the removal of potentially unwanted applications (PUAs) using a specific script in ConnectWise Automate. It includes information on dependencies and the structure of the audit data table.'
tags: ['database', 'report', 'security']
draft: false
unlisted: false
---

## Purpose

This document holds audit data from [CWM - Automate - Script - Remove - PUA](<../scripts/Remove - PUA.md>).

## Dependencies

The following dependency is required for this audit data:

- [CWM - Automate - Script - Remove - PUA](<../scripts/Remove - PUA.md>)

## Tables

### pvl_pua_audit

| Column              | Type     | Explanation                              |
|---------------------|----------|------------------------------------------|
| ComputerID          | INT      | Primary Key, the computer ID.           |
| Name                | VARCHAR  | Primary Key, the name of the bloatware. |
| Category            | VARCHAR  | The category that the PUA belongs to.   |
| DataCollectionTime  | DateTime | Data collection time.                    |




