---
id: 'ec679801-c86a-4127-9b62-46be10207909'
title: 'pvl_automate_connection_audit'
title_meta: 'pvl_automate_connection_audit'
keywords: ['custom', 'table', 'contact', 'audit', 'automate']
description: 'This document outlines the purpose and structure of a custom table that records the last contact time of computers in ConnectWise Automate whenever their state changes, including going offline and checking in again.'
tags: ['database', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

The custom table records the computer’s last contact time whenever its state changes. This includes when the computer goes offline and when it starts checking in with Automate.

## Dependencies

- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](<../monitors/Update Table - pvl_automate_connection_audit.md>)
- [CWM - Automate - Script - Automate Agent Connection Audit](<../scripts/Automate Agent Connection Audit.md>)

## Tables

### pvl_automate_connection_audit

| Column             | Type     | Explanation                                           |
|--------------------|----------|------------------------------------------------------|
| computerid         | int      | The unique identifier for the computer               |
| state              | tinyint  | Indicates whether the computer is offline or online (0/1) |
| lastcontact        | datetime | The last contact time of the computer when the state changed |
| datacollectiontime  | datetime | The data collection time for the respective entry    |




