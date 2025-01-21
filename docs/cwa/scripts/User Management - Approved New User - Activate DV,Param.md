---
id: 'd3db4260-b3e9-4ec6-b422-07434a2a239d'
title: 'Enable Disabled Users Script'
title_meta: 'Enable Disabled Users Script - Update Dependent DataView and Custom Table'
keywords: ['enable', 'users', 'script', 'dataview', 'custom', 'table', 'audit']
description: 'This script enables users that have been disabled by a dependent script. It also updates the dependent DataView and custom table, saving approximately 15 minutes through automation. This is a post-action script that is essential when the previous script is used to disable accounts.'
tags: ['database', 'update']
draft: false
unlisted: false
---

## Summary

This script will enable the users that have been disabled by the dependent script.  
It will also help to update the dependent DataView and custom table.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/User-Management---Approved-New-User---Activate-DV,Param/image_1.png)

## Dependencies

- [User Management - New Local Account Audit And Disable [DV, Autofix, Global]](<../../unsorted/User Management - New Local Account Audit And Disable DV,Autofix,Global.md>)  
- [ProVal - Submitted - New Account Detection](https://proval.itglue.com/DOC-5078775-7695147)  
- [New Account Audit and Disable For Approve [Script]](<../dataviews/New Account Audit and Disable For Approve.md>)  
- [New User Account Audit Table](<../tables/custom_proval_computer_new_accounts.md>)  

## Variables

- username

#### User Parameters

| Name     | Example                | Required | Description                                    |
|----------|------------------------|----------|------------------------------------------------|
| username | user1,user2,user3     |          | Provide the usernames that you want to approve.|

## Process

This script is the post-action of the above script; it will run to enable the disabled accounts from the previous script.  
This script is only required when the above script is used to disable accounts. If used only for audit, then this script is not required.

## Output

The location and method by which this script returns data.

Examples:  

- Script log  
- DataView  
- Custom table  
