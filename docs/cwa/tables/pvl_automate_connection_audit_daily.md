---
id: 'da608773-1677-4247-a161-ea62b3b3ba23'
title: 'pvl_automate_connection_audit_daily'
title_meta: 'pvl_automate_connection_audit_daily'
keywords: ['connection', 'audit', 'table', 'automate', 'offline', 'online', 'data', 'collection']
description: 'This document outlines the purpose and structure of the daily connection audit table for Automate, which records the online and offline time of computers over the past 24 hours. It details the dependencies, table structure, and the process for updating the data.'
tags: ['database', 'performance', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

The table records the amount of time, in minutes, that each computer was offline and online over the past 24 hours, using data from the [pvl_automate_connection_audit](<./pvl_automate_connection_audit.md>) custom table. It saves one entry per machine daily, maintaining this data for 30 days. The table is updated once per day by the [Automate Agent Connection Audit](<../scripts/Automate Agent Connection Audit.md>) script.

The script will start adding data to this table 24 hours after the first entry is added to the [pvl_automate_connection_audit](<./pvl_automate_connection_audit.md>) table.

## Dependencies

- [CWM - Automate - Custom Table - pvl_automate_connection_audit](<./pvl_automate_connection_audit.md>)
- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](<../monitors/Update Table - pvl_automate_connection_audit.md>)
- [CWM - Automate - script - Automate Agent Connection Audit](<../scripts/Automate Agent Connection Audit.md>)

## Tables

#### pvl_automate_connection_audit_daily

| Column              | Type     | Explanation                                           |
|---------------------|----------|------------------------------------------------------|
| computerid          | int      | Unique identifier for the computer                   |
| online              | int      | Number of minutes it was online in the last 24 hours |
| offline             | int      | Number of minutes it was offline in the last 24 hours |
| datacollectiontime  | datetime | Data collection time for the respective entry        |




