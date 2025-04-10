---
id: 'e64d9e93-4fd1-4643-8ffe-bc62492ed6cc'
slug: /e64d9e93-4fd1-4643-8ffe-bc62492ed6cc
title: 'OSX - File Vault Audit'
title_meta: 'OSX - File Vault Audit'
keywords: ['filevault', 'mac', 'dataview', 'audit', 'status']
description: 'This document provides a comprehensive overview of the FileVault Status dataview for MAC computers, including requirements, dependencies, and detailed column descriptions to help monitor the encryption status of devices in your environment.'
tags: ['encryption']
draft: false
unlisted: false
---

## Summary

This dataview displays the FileVault Status for the MAC computers present in the environment.

## Requirements

1. The "[CWM - Automate - Script - OSX - File Vault Audit [DV]](/docs/6c8b7535-ef72-4635-a968-60261dea67de)" script must be scheduled to run daily to keep the dataview up to date.

## Dependencies

[CWM - Automate - Script - OSX - File Vault Audit [DV]](/docs/6c8b7535-ef72-4635-a968-60261dea67de)

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
| Last Logon User           | Last Logon User                            |


