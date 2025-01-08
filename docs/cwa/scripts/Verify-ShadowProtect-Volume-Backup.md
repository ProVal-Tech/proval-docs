---
id: 'cwa-query-ntfs-volumes'
title: 'Query NTFS Volumes on Computer'
title_meta: 'Query NTFS Volumes on Computer - Efficient Drive Information Retrieval'
keywords: ['ntfs', 'database', 'drive', 'volume', 'query']
description: 'This document describes a script that queries the LT database to gather information about NTFS volumes on a computer, including drive letters, sizes, and file systems. The script aims to streamline the process of verifying ShadowProtect backups for each drive, significantly reducing manual effort and time spent on this task.'
tags: ['database', 'ntfs', 'backup', 'script', 'windows']
draft: false
unlisted: false
---
## Summary

This script queries the LT database for each drive letter that is an NTFS volume on a computer.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8007747/images/11145922)

## Dependencies

- @Verify-ShadowProtect-Volume-Backup-byLetter[SubScript] (script)

## Variables

- `%sqldataset%` -> grabs ComputerID, Letter, Size, FileSystem, SmartStatus, and Model
- `@DriveLetterString@` -> this is set empty for use later in the subscript.

## Process

1. Sets up 2 variables, DriveLetterString and rowcountA.
2. Starts querying the database and grabbing the drive information.
3. Sends that information to the subscript for Shadow-Protect verification.
4. Loops until this is completed for all machines the script is run on.

## Output

- Script log


