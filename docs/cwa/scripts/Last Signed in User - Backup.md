---
id: 'a4434526-0106-4df4-832c-752519597f82'
title: 'Store Last Signed-In User'
title_meta: 'Store Last Signed-In User'
keywords: ['backup', 'logon', 'user', 'registry', 'computer']
description: 'This document describes a script used to store the last signed-in user information for PRONOC users, allowing them to restore their computer to its previous state after work is completed. It details the process of creating a registry backup and logging the results.'
tags: ['backup', 'registry']
draft: false
unlisted: false
---

## Summary

This script is used to store the last signed-in user so PRONOC users can run this script prior to logging in, allowing them to restore the computer to the state it was in before logging in after work is completed.

## Sample Run

![Sample Run](../../../static/img/Last-Signed-in-User---Backup/image_1.png)

## Variables

| Name          | Description                                                                                       |
|---------------|---------------------------------------------------------------------------------------------------|
| LogonBackup   | Collects information about whether the backup was taken successfully or not. The registry backup is located at: C:/Temp/Logonbackup/logonexport.reg |

## Process

This script stores the last signed-in user information from the registry as a backup on the local computer. It saves the last logged-in user data to the file "C:/Temp/Logonbackup/logonexport.reg". It then checks the results of the returned script for errors and logs this information.

## Output

- Script log

