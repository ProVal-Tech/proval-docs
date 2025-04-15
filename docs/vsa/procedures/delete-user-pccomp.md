---
id: 'd9986380-db6d-42c5-82bb-506185756ae1'
slug: /d9986380-db6d-42c5-82bb-506185756ae1
title: 'Delete User - pccomp'
title_meta: 'Delete User - pccomp'
keywords: ['delete', 'user', 'pccomp', 'agent', 'procedure']
description: 'This document details the Agent procedure for deleting a user named pccomp, including example logs and output from the procedure execution.'
tags: []
draft: false
unlisted: false
---

## Summary

This Agent procedure is used to delete the user named pccomp.

## Example Agent Procedure Log

| Time                   | Action                                     | Status                             | User              |
|------------------------|--------------------------------------------|------------------------------------|-------------------|
| 12:52:21 am 30-Dec-24 | Delete User - pccomp                       | Success THEN                       | vaibhav.arora     |
| 12:52:20 am 30-Dec-24 | Delete User - pccomp-0001                 | User deleted successfully           | vaibhav.arora     |
| 12:52:20 am 30-Dec-24 | Delete User - pccomp                       | pccomp                             | vaibhav.arora     |
| 12:52:20 am 30-Dec-24 | Execute Shell command - Get Results to Variable | Success THEN                       | vaibhav.arora     |
| 12:52:18 am 30-Dec-24 | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: powershell.exe -ExecutionPolicy Bypass -Command "(Get-WmiObject -Class Win32_UserAccount -Filter 'Name=''pccomp''').Name" >"c:/kworking/commandresults-2143970785.txt" 2>&1 | vaibhav.arora     |
| 12:52:17 am 30-Dec-24 | Delete User - pccomp                       | Checking for the pccomp user      | vaibhav.arora     |
| 12:52:10 am 30-Dec-24 | Run Now - Delete User - pccomp             | Admin vaibhav.arora scheduled procedure Run Now - Delete User - pccomp to run at Dec 30 2024 12:52 AM | vaibhav.arora     |

## Output

Agent procedure log.


