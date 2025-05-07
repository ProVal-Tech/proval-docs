---
id: '3b41c8a5-cebe-47bd-a829-9b3fa5701b15'
slug: /3b41c8a5-cebe-47bd-a829-9b3fa5701b15
title: 'User Management - New Local Account Audit And Disable DV,Autofix,Global'
title_meta: 'User Management - New Local Account Audit And Disable DV,Autofix,Global'
keywords: ['account', 'audit', 'disable', 'detection', 'local', 'monitor', 'user']
description: 'This script detects newly created accounts within the last 15 minutes, logging details about the user who created the account and the new account itself, including its type and login status. It helps in automating the auditing process and can disable newly detected local users based on a configurable parameter.'
tags: ['security', 'windows']
draft: false
unlisted: true
---

## Summary

This script will look for any newly created account in the last 15 minutes and store complete information about the user who created the account, which new account was added, whether it is a local user, local admin, or if it has ever logged in.

**Time Saved by Automation:** 10 Minutes

## Sample Run

This script is a function script and it only runs with the dependent remote monitor.

## Dependencies

- [New Account Audit and Disable For Approve [Script]](/docs/fac82ae1-8f32-40b3-b9b2-a38f1a71e633)
- [ProVal - Submitted - New Account Detection](/docs/75f8c13f-04d5-45fd-b650-3b010353a8c0)
- [New User Account Audit Table](/docs/64d9813f-2eba-4448-8d78-c9a001979ee9)

#### Global Parameters

| Name               | Example | Required | Description                                                                                   |
|--------------------|---------|----------|-----------------------------------------------------------------------------------------------|
| DisableLocalUser   | 0       | 1,0      | 1 - Disable newly detected local user; 0 - Do not disable newly detected local user        |

## Process

- The monitor detects the newly created account based on event ID 4720.
  - This event ID triggers when the local group policy user account audit is enabled.
- The "new account created" message is filtered to log who created the account and information about the new account.
  - It also registers information about when the account was created, whether it is an admin, domain, or non-domain account, if the password is set or not, and the last logon of both the creator and created user.
- It also provides the option to disable the newly created user depending on the global parameter "DisableLocalUser".
- All information is logged to the custom table [custom_proval_computer_new_accounts](/docs/64d9813f-2eba-4448-8d78-c9a001979ee9).

## Output

- Script log
- Custom table
- Dataview
