---
id: '0865e96c-af9c-48f4-acff-a70525b773ac'
slug: /0865e96c-af9c-48f4-acff-a70525b773ac
title: 'Last Signed in User - Restore'
title_meta: 'Last Signed in User - Restore'
keywords: ['backup', 'logon', 'restore', 'user']
description: 'This document provides a detailed overview of a script designed to restore the backup logon user to the login screen of a machine. It includes sample runs, variable documentation, and a description of the process involved in checking and restoring the logon backup file.'
tags: ['backup', 'security', 'windows']
draft: false
unlisted: true
---

## Summary

This script will restore the backup logon user to the login screen of the machine.

## Sample Run

![Sample Run](../../static/img/Last-Signed-in-User---Restore/image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name          | Description                                               |
|---------------|-----------------------------------------------------------|
| LogonRestore  | This stores information about whether the last logged on user is backed up or not. |

## Process

This script will restore the backup logon user to the login screen of the machine. It first checks for the logon backup file, i.e., 'C:/Temp/Logonbackup/logonexport.reg'. If found, it will restore it on the machine and remove this backup after restoration.

## Output

- Script log

