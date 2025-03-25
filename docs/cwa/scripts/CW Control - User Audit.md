---
id: 'e7e6a0f4-6d21-4046-89ee-1e9dd5827221'
slug: /e7e6a0f4-6d21-4046-89ee-1e9dd5827221
title: 'CW Control - User Audit'
title_meta: 'CW Control - User Audit'
keywords: ['connectwise', 'audit', 'user', 'control', 'script']
description: 'This document outlines a script designed to run on the ConnectWise Control server, auditing user information and logging it into a custom table. It details the necessary dependencies, variables used in the script, and the output generated, including a dataview for user audits and a script log. The automation is expected to save approximately 15 minutes of manual effort.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Summary

This script runs on the Control server and audits ConnectWise Control user information to a custom table [plugin_proval_controluseraudit](<../tables/plugin_proval_controluseraudit.md>).

It displays information in the dataview **@CW Control - User Audit**.  
**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/CW-Control---User-Audit/image_1.png)

## Dependencies

- Must be run on Control Server
- [plugin_proval_controluseraudit](<../tables/plugin_proval_controluseraudit.md>)

## Variables

- `@insertStatement@` - Fetches the information of all the users that will be inserted into the custom table.
- `@2FAColumnExists@` - Verifies if the 2FA column exists or not.

## Process

- Runs PowerShell and fetches all the information of Control users.
- Verifies if the 2FA column exists; if it doesn't exist, it will drop the table; otherwise, it creates the table with all the information.

## Output

- Script log
- Dataview **@CW Control - User Audit**


