---
id: '6c8b7535-ef72-4635-a968-60261dea67de'
title: 'File Vault Status Audit for Mac Machines'
title_meta: 'File Vault Status Audit for Mac Machines'
keywords: ['file', 'vault', 'status', 'mac', 'audit', 'edf']
description: 'This document describes a script that retrieves the File Vault Status of Mac machines and stores it in a computer level EDF called "File Vault Status". It is recommended to schedule this script to run daily to keep the data view up-to-date.'
tags: ['mac', 'edf', 'status', 'scheduling', 'audit']
draft: false
unlisted: false
---
## Summary

This script gets the File Vault Status of a Mac machine and stores it to a computer level EDF, "File Vault Status".

## Sample Run

![Sample Run](../../../static/img/OSX---File-Vault-Audit/image_1.png)

Suggested is to schedule the script to run daily against the MAC machines to keep the dataview up-to-date.

## Dependencies

[CWM - Automate - Dataview - OSX - File Vault Audit [Script]](https://proval.itglue.com/5078775/docs/10027996)

## Process

1. Executes the "fdesetup status" command to fetch the FileVault's status.
2. Update the current time to "File Vault Script Run Time" EDF.
3. Update the Outcome of the command to "File Vault Status" EDF.

## Output

- EDF






