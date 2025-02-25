---
id: '6dfa2f6b-02bb-4ccb-b69f-e23bc8d75b5d'
title: 'Update Table - pvl_automate_connection_audit'
title_meta: 'Update Table - pvl_automate_connection_audit'
keywords: ['monitor', 'audit', 'connection', 'database', 'update']
description: 'This document explains the functionality of the internal monitor that runs every 5 minutes to update the pvl_automate_connection_audit table by logging entries for computers whose current state differs from their previously saved state. It serves as an efficient alternative to running client scripts at frequent intervals.'
tags: ['database', 'report', 'update']
draft: false
unlisted: false
---

## Summary

The internal monitor runs every 5 minutes and adds an entry to the [pvl_automate_connection_audit](<../tables/pvl_automate_connection_audit.md>) table for computers whose current state differs from the previously saved state. Its purpose is to keep the table updated. Instead of running a client script at 5-minute intervals, this internal monitor executes the insert query.

## Dependencies

- [CWM - Automate - Custom Table - pvl_automate_connection_audit](<../tables/pvl_automate_connection_audit.md>)
- [CWM - Automate - Script - Automate Agent Connection Audit](<../scripts/Automate Agent Connection Audit.md>)

## Target

Global
