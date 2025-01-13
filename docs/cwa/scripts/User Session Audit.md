---
id: 'cwa_create_sql_table_audit_sessions'
title: 'Create SQL Table and Audit User Sessions'
title_meta: 'Create SQL Table and Audit User Sessions'
keywords: ['sql', 'table', 'audit', 'sessions', 'power', 'shell', 'users']
description: 'This document outlines a script that creates the SQL table “@plugin_proval_usersessions” if it does not exist, audits the current active sessions on a target machine using PowerShell, and updates the details in the custom table. It includes a summary, sample run, dependencies, variables, process steps, and output details.'
tags: ['database', 'configuration', 'windows', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script will create the SQL table “@plugin_proval_usersessions” if it does not exist, then run PowerShell to audit the current active sessions on a target machine and updates the details in the custom table.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/User-Session-Audit/image_1.png)

## Dependencies

- @plugin_proval_usersessions (Table)
- [Windows - Current User Sessions](https://proval.itglue.com/DOC-5078775-7963719)

## Variables

- `@psout@` -> Logs the output of PowerShell

## Process

1. This script creates the custom table @plugin_proval_usersessions if it doesn't exist already.
2. Runs a PowerShell script to audit the user session.
3. Logs the output of PowerShell to Automate's script logs.

## Output

- Script log




