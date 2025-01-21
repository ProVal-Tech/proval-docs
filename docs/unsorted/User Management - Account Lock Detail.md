---
id: 'b5fa1e24-5582-4c2c-9277-ead30c0f3693'
title: 'User Lockout Account Audit'
title_meta: 'User Lockout Account Audit'
keywords: ['audit', 'lockout', 'user', 'account', 'monitor']
description: 'This document outlines the user lockout account audit process, detailing associated content, implementation steps, and best practices for monitoring account lockouts in Active Directory environments.'
tags: ['active-directory', 'report', 'windows']
draft: true
unlisted: false
---

## Purpose

The purpose of this document is to outline the user lockout account audit process.

## Associated Content

| Content                                                                 | Type          | Function                              |
|-------------------------------------------------------------------------|---------------|---------------------------------------|
| [User Management - Account Lockout Audit](<./User Management - Account Lockout Audit.md>) | Script        | Collects the account lockout details   |
| [Account LockOut Audit](<../cwa/dataviews/Account LockOut Audit.md>) | Dataview      | Shows the details of account lockouts  |
| [AD Account Lockout Detection](<../cwa/monitors/Account Lockout Detection.md>) | Remote Monitor | Monitors to detect lockout accounts    |
| [plugin_proval_account_lock](<./plugin_proval_account_lock.md>) | Table         | Collects information about lockout accounts |

## Implementation

The monitor is required to run every 15 minutes, and the script is required to run as an autofix. The table and Dataview will be updated by the script.

For the AD users' account lock report:  
Apply the remote monitor to the DC group.

For all users' account lock report (local users):  
Schedule on all Windows machines.

## FAQ

*(No FAQs have been provided in this document.)*

