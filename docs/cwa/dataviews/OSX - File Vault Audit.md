---
id: 'cwa-filevault-status'
title: 'FileVault Status Dataview for MAC Computers'
title_meta: 'FileVault Status Dataview for MAC Computers'
keywords: ['filevault', 'mac', 'dataview', 'audit', 'status']
description: 'This document provides a comprehensive overview of the FileVault Status dataview for MAC computers, including requirements, dependencies, and detailed column descriptions to help monitor the encryption status of devices in your environment.'
tags: ['mac', 'encryption', 'audit', 'dataview', 'status']
draft: false
unlisted: false
---
## Summary

This dataview displays the FileVault Status for the MAC computers present in the environment.

## Requirements

1. The "[CWM - Automate - Script - OSX - File Vault Audit [DV]](https://proval.itglue.com/5078775/docs/10027994)" script must be scheduled to run daily to keep the dataview up to date.

## Dependencies

[CWM - Automate - Script - OSX - File Vault Audit [DV]](https://proval.itglue.com/5078775/docs/10027994)

## Columns

| Column                     | Description                                 |
|---------------------------|---------------------------------------------|
| Client Name               | Client Name                                 |
| Location Name             | Location Name                               |
| Computer Name             | Computer Name                               |
| Operating System          | Operating System                            |
| File Vault Status         | File Vault Status, either ON or OFF        |
| File Vault Script Run Time | File Vault Script Run Time                  |
| Last Contact              | Last Contact                                |
| Last Logon User          | Last Logon User                            |

