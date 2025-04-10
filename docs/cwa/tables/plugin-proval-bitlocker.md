---
id: 'dfddb88b-37c2-4d42-b8a0-bb7ebe4da6d0'
slug: /dfddb88b-37c2-4d42-b8a0-bb7ebe4da6d0
title: 'plugin_proval_bitlocker'
title_meta: 'plugin_proval_bitlocker'
keywords: ['bitlocker', 'recovery', 'key', 'storage', 'audit']
description: 'This document outlines the process for storing the BitLocker recovery key retrieved from the associated script. It includes details on the dependencies, the structure of the data table, and explanations of the relevant columns related to the recovery key storage.'
tags: ['backup', 'database', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores the recovery key from the script [Bitlocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5).

## Dependencies

[Bitlocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5)

## Table

#### plugin_proval_bitlocker

| Column       | Type    | Explanation                                        |
|--------------|---------|----------------------------------------------------|
| DriveID      | INT     | The associated drive of the recovery key.          |
| RecoveryKey  | CHAR    | The BitLocker recovery key.                         |
| LastUpdated  | DATETIME| The last time the agent recovery key was audited.  |


