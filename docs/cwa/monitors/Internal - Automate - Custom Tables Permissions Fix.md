---
id: '0b0783d1-3438-4983-b212-bf5d1e3ae26c'
title: 'Update User DB Permissions for ProVal Tables'
title_meta: 'Update User DB Permissions for ProVal Tables'
keywords: ['permissions', 'proval', 'database', 'monitor', 'tables']
description: 'This document outlines a monitor that checks several tables created by ProVal and updates permissions on those tables if the Automate DB agent is restarted, ensuring user access to necessary data.'
tags: ['database', 'permissions']
draft: false
unlisted: false
---
## Summary

Internal Use Only

This monitor checks several tables that ProVal wrote, and updates permissions on those tables (if the Automate DB agent gets restarted) allowing the user access to those tables.

## Dependencies

- @Autofix - Custom - Update user DB Permissions to Custom Tables (Alert template/Script)

Tables:
- @custom_proval_computer_new_accounts
- [plugin_proval_ad_gpo](https://proval.itglue.com/DOC-5078775-7948720) 
- @plugin_proval_bitlocker
- @plugin_proval_gpo_audit
- @plugin_proval_outlook_pst

## Target

- Global - Should be run without explicitly defined targets.












