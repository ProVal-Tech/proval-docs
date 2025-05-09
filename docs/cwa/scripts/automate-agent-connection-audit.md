---
id: 'ef69cef8-da15-46b7-94a4-697431a87929'
slug: /ef69cef8-da15-46b7-94a4-697431a87929
title: 'Automate Agent Connection Audit'
title_meta: 'Automate Agent Connection Audit'
keywords: ['custom', 'tables', 'audit', 'connection', 'daily', 'online', 'offline']
description: 'This document describes a script that generates two custom tables, pvl_automate_connection_audit and pvl_automate_connection_audit_daily, which track the daily online and offline times of machines. It provides details on how to run the script and its expected output.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

The script generates two custom tables: [pvl_automate_connection_audit](/docs/ec679801-c86a-4127-9b62-46be10207909) and [pvl_automate_connection_audit_daily](/docs/da608773-1677-4247-a161-ea62b3b3ba23). It calculates and records the daily online and offline times of all machines in the [pvl_automate_connection_audit_daily](/docs/da608773-1677-4247-a161-ea62b3b3ba23) table, using the data stored in the [pvl_automate_connection_audit](/docs/ec679801-c86a-4127-9b62-46be10207909) table.

## Sample Run

- Debug the script against any random client to import the custom tables.  
- Schedule the script to run once per day around midnight:  
  ![Sample Run Image](../../../static/img/docs/ef69cef8-da15-46b7-94a4-697431a87929/image_1.webp)  

## Output

- Script Log
