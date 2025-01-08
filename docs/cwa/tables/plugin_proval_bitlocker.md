---
id: 'cwa-bitlocker-key-retrieval'
title: 'BitLocker Recovery Key Storage'
title_meta: 'BitLocker Recovery Key Storage'
keywords: ['bitlocker', 'recovery', 'key', 'storage', 'audit']
description: 'This document outlines the process for storing the BitLocker recovery key retrieved from the associated script. It includes details on the dependencies, the structure of the data table, and explanations of the relevant columns related to the recovery key storage.'
tags: ['backup', 'security', 'database', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores the recovery key from the script [Bitlocker - Key Retrieval](https://proval.itglue.com/DOC-5078775-8009806).

## Dependencies

[Bitlocker - Key Retrieval](https://proval.itglue.com/DOC-5078775-8009806)

## Table

#### plugin_proval_bitlocker

| Column       | Type    | Explanation                                        |
|--------------|---------|----------------------------------------------------|
| DriveID      | INT     | The associated drive of the recovery key.          |
| RecoveryKey  | CHAR    | The BitLocker recovery key.                         |
| LastUpdated  | DATETIME| The last time the agent recovery key was audited.  |


