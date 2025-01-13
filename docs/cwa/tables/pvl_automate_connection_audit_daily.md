---
id: 'cwa_connection_audit_daily'
title: 'Daily Connection Audit Table for Automate'
title_meta: 'Daily Connection Audit Table for Automate'
keywords: ['connection', 'audit', 'table', 'automate', 'offline', 'online', 'data', 'collection']
description: 'This document outlines the purpose and structure of the daily connection audit table for Automate, which records the online and offline time of computers over the past 24 hours. It details the dependencies, table structure, and the process for updating the data.'
tags: ['database', 'configuration', 'update', 'report', 'performance']
draft: false
unlisted: false
---
## Purpose

The table records the amount of time, in minutes, that each computer was offline and online over the past 24 hours, using data from the [pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744) custom table. It saves one entry per machine daily, maintaining this data for 30 days. The table is updated once per day by the [Automate Agent Connection Audit](https://proval.itglue.com/DOC-5078775-18178745) script.

The script will start adding data to this table 24 hours after adding the first entry to the [pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744) table.

## Dependencies

- [CWM - Automate - Custom Table - pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744)
- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178743)
- [CWM - Automate - script - Automate Agent Connection Audit](https://proval.itglue.com/DOC-5078775-18178745)

## Tables

#### pvl_automate_connection_audit_daily

| Column              | Type     | Explanation                                           |
|---------------------|----------|------------------------------------------------------|
| computerid          | int      | computerid                                          |
| online              | int      | number of minutes it was online in the last 24 hours |
| offline             | int      | number of minutes it was offline in the last 24 hours |
| datacollectiontime  | datetime | data collection time for the respective entry        |


