---
id: 'c692dfe2-e9ec-4f3d-a7ed-8f4f5da30493'
slug: /c692dfe2-e9ec-4f3d-a7ed-8f4f5da30493
title: 'Verify-ShadowProtect-Volume-Backup'
title_meta: 'Verify-ShadowProtect-Volume-Backup'
keywords: ['ntfs', 'database', 'drive', 'volume', 'query']
description: 'This document describes a script that queries the LT database to gather information about NTFS volumes on a computer, including drive letters, sizes, and file systems. The script aims to streamline the process of verifying ShadowProtect backups for each drive, significantly reducing manual effort and time spent on this task.'
tags: ['backup', 'database', 'windows']
draft: false
unlisted: false
---

## Summary

This script queries the LT database for each drive letter that is an NTFS volume on a computer.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Verify-ShadowProtect-Volume-Backup/image_1.png)

## Dependencies

- `@Verify-ShadowProtect-Volume-Backup-byLetter[SubScript]` (script)

## Variables

- `%sqldataset%` -> grabs ComputerID, Letter, Size, FileSystem, SmartStatus, and Model
- `@DriveLetterString@` -> this is set empty for use later in the subscript.

## Process

1. Sets up two variables: `DriveLetterString` and `rowcountA`.
2. Starts querying the database and retrieving the drive information.
3. Sends that information to the subscript for ShadowProtect verification.
4. Loops until this is completed for all machines the script is run on.

## Output

- Script log


