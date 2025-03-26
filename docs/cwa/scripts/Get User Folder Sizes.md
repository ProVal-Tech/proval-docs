---
id: '209a433a-f8a7-4ccc-b2d3-3db5b9d3abe4'
slug: /209a433a-f8a7-4ccc-b2d3-3db5b9d3abe4
title: 'Get User Folder Sizes'
title_meta: 'Get User Folder Sizes'
keywords: ['folder', 'size', 'user', 'profile', 'database']
description: 'This PowerShell script retrieves the size of every user folder on a machine, saving significant time in the process. It creates a custom database table to store the folder sizes and provides a detailed log of the execution.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This script runs PowerShell to fetch the size (in MB) of every user folder found on a machine.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Get-User-Folder-Sizes/image_1.png)

## Process

- Creates a custom table [plugin_proval_userfoldersizes](/docs/e47be58e-d72d-4396-aa0c-edef63f056e8) in the Labtech Database if it doesn't already exist.
- Runs the PowerShell script to fetch the folder size of every user profile.
- Inserts the values into the above table.

## Output

- Script log


