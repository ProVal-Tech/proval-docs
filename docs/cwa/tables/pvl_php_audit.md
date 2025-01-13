---
id: 'cwa_store-data-collection'
title: 'Store Data Collected by Locate PHP.exe Script'
title_meta: 'Store Data Collected by Locate PHP.exe Script'
keywords: ['data', 'collection', 'script', 'php', 'audit']
description: 'This document outlines the purpose and structure of the data storage for the Locate PHP.exe script, detailing its dependencies and the specific tables used for data collection.'
tags: ['database', 'configuration', 'report', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores the data collected by the [Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023) script.

## Dependencies

[EPM - Data Collection - Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023)

## Tables

#### pvl_php_audit

| Column          | Type                | Explanation                     |
|-----------------|---------------------|---------------------------------|
| computerid      | int                 | computerid                      |
| Path            | varchar             | Path to the file               |
| FileVersion     | varchar             | Version of the file if available|
| Size            | double unsigned      | Size of the file in Mega Bytes |
| CreationTime    | datetime            | File Creation time              |
| LastWriteTime   | datetime            | File Modification date          |
| Attributes      | varchar             | File's attributes               |
| ScriptRunTime   | datetime            | Data Collection Time            |


