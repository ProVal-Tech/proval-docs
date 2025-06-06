---
id: '6eace5fa-3c7d-45ae-a52c-66aa854ddde7'
slug: /6eace5fa-3c7d-45ae-a52c-66aa854ddde7
title: 'User Management - Profile Audit'
title_meta: 'User Management - Profile Audit'
keywords: ['user', 'profile', 'information', 'local', 'domain', 'admin', 'password', 'size', 'logon', 'audit']
description: 'This document details a script that retrieves user profile information at the machine level, including user type, admin status, password status, profile size, last logon time, and audit timestamps. It outlines the dependencies, process, and output of the script, as well as the time saved through automation.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

Superseded by [EPM - Accounts - Script - User Profile - Get Information](/docs/91d80bf6-68c8-4025-b285-d07390b860c8).

This script looks for user profile information at the machine level. It provides information about whether a user is local/domain, admin or not, password set or not, profile size, last logon, and the timestamp of the audit.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/6eace5fa-3c7d-45ae-a52c-66aa854ddde7/image_1.webp)

## Dependencies

- @Windows – Local Account Audit (script)
- Requires Windows OS
- [custom_proval_computer_accounts](/docs/2d9698ff-636d-4d56-b5d0-4ca308a6b5e5)

## Variables

- `@output@` -> Output from the PowerShell script
- `@dataValidation@` -> RegEx matching setup

## Process

1. This script creates the [custom_proval_computer_accounts](/docs/2d9698ff-636d-4d56-b5d0-4ca308a6b5e5) table if it doesn't exist.
2. Runs a PowerShell script to gather the list of users, properties, and sizes.
3. Logs the output in Automate's script logs.
4. Trims the PowerShell output via SQL and performs a RegEx to verify data.
5. Conducts a verification step of the data.
   1. Logs a failure in Automate's script logs if there was an issue verifying the data.

## Output

- Script log
- [custom_proval_computer_accounts](/docs/2d9698ff-636d-4d56-b5d0-4ca308a6b5e5)
- @Windows – Local Account Audit (Dataview)