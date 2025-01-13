---
id: 'cwa-internal-monitor-audit'
title: 'Internal Monitor for Connection Audit'
title_meta: 'Internal Monitor for Connection Audit'
keywords: ['monitor', 'audit', 'connection', 'database', 'update']
description: 'This document explains the functionality of the internal monitor that runs every 5 minutes to update the pvl_automate_connection_audit table by logging entries for computers whose current state differs from their previously saved state. It serves as an efficient alternative to running client scripts at frequent intervals.'
tags: ['database', 'update', 'configuration', 'report']
draft: false
unlisted: false
---
## Summary

The internal monitor runs every 5 minutes and adds an entry to the [pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744) table for computers whose current state differs from the previously saved state. Its purpose is to keep the table updated. Instead of running a client script at 5-minute intervals, this internal monitor executes the insert query.

## Dependencies

- [CWM - Automate - Custom Table - pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178744)
- [CWM - Automate - script - Automate Agent Connection Audit](https://proval.itglue.com/DOC-5078775-18178745)

## Target

Global



