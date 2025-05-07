---
id: '10712956-11f1-47f6-ab0a-d063d2ca67d1'
slug: /10712956-11f1-47f6-ab0a-d063d2ca67d1
title: 'pvl_php_audit'
title_meta: 'pvl_php_audit'
keywords: ['data', 'collection', 'script', 'php', 'audit']
description: 'This document outlines the purpose and structure of the data storage for the Locate PHP.exe script, detailing its dependencies and the specific tables used for data collection.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores the data collected by the [Locate PHP.exe](/docs/174c59f1-8d7f-44a0-b5de-d69145ab4a43) script.

## Dependencies

[EPM - Data Collection - Script - Locate PHP.exe](/docs/174c59f1-8d7f-44a0-b5de-d69145ab4a43)

## Tables

### pvl_php_audit

| Column          | Type                | Explanation                     |
|-----------------|---------------------|---------------------------------|
| computerid      | int                 | Identifier for the computer     |
| Path            | varchar             | Path to the file               |
| FileVersion     | varchar             | Version of the file if available|
| Size            | double unsigned      | Size of the file in Megabytes  |
| CreationTime    | datetime            | File creation time              |
| LastWriteTime   | datetime            | File modification date          |
| Attributes      | varchar             | File's attributes               |
| ScriptRunTime   | datetime            | Data collection time            |

