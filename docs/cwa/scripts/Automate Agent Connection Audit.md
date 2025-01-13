---
id: 'cwa-custom-tables-connection-audit'
title: 'Custom Tables for Connection Audit'
title_meta: 'Custom Tables for Connection Audit'
keywords: ['custom', 'tables', 'audit', 'connection', 'daily', 'online', 'offline']
description: 'This document describes a script that generates two custom tables, pvl_automate_connection_audit and pvl_automate_connection_audit_daily, which track the daily online and offline times of machines. It provides details on how to run the script and its expected output.'
tags: ['database', 'report', 'setup', 'configuration']
draft: false
unlisted: false
---
## Summary

The script generates two custom tables: [pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744) and [pvl_automate_connection_audit_daily](https://proval.itglue.com/DOC-5078775-18178747). It calculates and records the daily online and offline times of all machines in the [pvl_automate_connection_audit_daily](https://proval.itglue.com/DOC-5078775-18178747) table, using the data stored in the [pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744) table.

## Sample Run

- Debug the script against any random client to import the custom tables.  
- Schedule the script to run once per day around midnight:  
  ![Sample Run Image](../../../static/img/Automate-Agent-Connection-Audit/image_1.png)  

## Output

- Script Log



