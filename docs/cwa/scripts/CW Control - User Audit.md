---
id: 'cwa-connectwise-control-user-audit'
title: 'ConnectWise Control User Audit Script'
title_meta: 'ConnectWise Control User Audit Script'
keywords: ['connectwise', 'audit', 'user', 'control', 'script']
description: 'This document outlines a script designed to run on the ConnectWise Control server, auditing user information and logging it into a custom table. It details the necessary dependencies, variables used in the script, and the output generated, including a dataview for user audits and a script log. The automation is expected to save approximately 15 minutes of manual effort.'
tags: ['audit', 'connectwise', 'user', 'script', 'control', 'database']
draft: false
unlisted: false
---
## Summary

This script runs on the control server and audits ConnectWise Control user information to a custom table [plugin_proval_controluseraudit](https://proval.itglue.com/DOC-5078775-8038700)  

It displays information in the dataview @CW Control - User Audit  
Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](5078775/docs/8134362/images/11336596)

## Dependencies

- Must be run on Control Server
- [plugin_proval_controluseraudit](https://proval.itglue.com/DOC-5078775-8038700)

## Variables

- `@insertStatement@` - Fetches the information of all the users that will be inserted in the custom table
- `@2FAColumnExists@` - Verifies if the 2FA column exists or not

## Process

- Runs PowerShell and fetches all the information of control users
- Verifies if 2FA column exists or not; if it doesn't exist, then it will drop the table; otherwise, it creates the table with all the information.

## Output

- Script log
- Dataview @CW Control - User Audit

