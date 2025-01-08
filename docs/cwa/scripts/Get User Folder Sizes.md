---
id: 'cwa-fetch-user-folder-sizes'
title: 'Fetch User Folder Sizes'
title_meta: 'Fetch User Folder Sizes - PowerShell Script'
keywords: ['folder', 'size', 'user', 'profile', 'database']
description: 'This PowerShell script retrieves the size of every user folder on a machine, saving significant time in the process. It creates a custom database table to store the folder sizes and provides a detailed log of the execution.'
tags: ['database', 'configuration', 'windows', 'report', 'performance']
draft: false
unlisted: false
---
## Summary

This script runs PowerShell to fetch the size (in MB) of every user folder found on a machine.

Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](5078775/docs/8168852/images/11368605)

## Process

- Creates a custom table [plugin_proval_userfoldersizes](https://proval.itglue.com/DOC-5078775-8158070) in the Labtech Database if it doesn't already exist.
- Runs PowerShell script to fetch the folder size of every user profile.
- Inserts the value in the above table.

## Output

- Script log


