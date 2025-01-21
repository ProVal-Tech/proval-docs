---
id: 'ef69cef8-da15-46b7-94a4-697431a87929'
title: 'Custom Tables for Connection Audit'
title_meta: 'Custom Tables for Connection Audit'
keywords: ['custom', 'tables', 'audit', 'connection', 'daily', 'online', 'offline']
description: 'This document describes a script that generates two custom tables, pvl_automate_connection_audit and pvl_automate_connection_audit_daily, which track the daily online and offline times of machines. It provides details on how to run the script and its expected output.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

The script generates two custom tables: [pvl_automate_connection_audit](<../tables/pvl_automate_connection_audit.md>) and [pvl_automate_connection_audit_daily](<../tables/pvl_automate_connection_audit_daily.md>). It calculates and records the daily online and offline times of all machines in the [pvl_automate_connection_audit_daily](<../tables/pvl_automate_connection_audit_daily.md>) table, using the data stored in the [pvl_automate_connection_audit](<../tables/pvl_automate_connection_audit.md>) table.

## Sample Run

- Debug the script against any random client to import the custom tables.  
- Schedule the script to run once per day around midnight:  
  ![Sample Run Image](../../../static/img/Automate-Agent-Connection-Audit/image_1.png)  

## Output

- Script Log


