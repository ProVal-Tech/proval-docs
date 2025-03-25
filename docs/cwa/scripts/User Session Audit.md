---
id: 'fffa01c1-5e44-4239-a69d-623e4a77e789'
slug: /fffa01c1-5e44-4239-a69d-623e4a77e789
title: 'User Session Audit'
title_meta: 'User Session Audit'
keywords: ['sql', 'table', 'audit', 'sessions', 'power', 'shell', 'users']
description: 'This document outlines a script that creates the SQL table “@plugin_proval_usersessions” if it does not exist, audits the current active sessions on a target machine using PowerShell, and updates the details in the custom table. It includes a summary, sample run, dependencies, variables, process steps, and output details.'
tags: ['database', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will create the SQL table “@plugin_proval_usersessions” if it does not exist, then run PowerShell to audit the current active sessions on a target machine and update the details in the custom table.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/User-Session-Audit/image_1.png)

## Dependencies

- @plugin_proval_usersessions (Table)
- [Windows - Current User Sessions](<../dataviews/Windows - Current User Sessions.md>)

## Variables

- `@psout@` -> Logs the output of PowerShell

## Process

1. This script creates the custom table @plugin_proval_usersessions if it doesn't already exist.
2. Runs a PowerShell script to audit the user session.
3. Logs the output of PowerShell to Automate's script logs.

## Output

- Script log


