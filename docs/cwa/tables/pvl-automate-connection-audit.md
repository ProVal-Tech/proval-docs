---
id: 'ec679801-c86a-4127-9b62-46be10207909'
slug: /ec679801-c86a-4127-9b62-46be10207909
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

- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](/docs/6dfa2f6b-02bb-4ccb-b69f-e23bc8d75b5d)
- [CWM - Automate - Script - Automate Agent Connection Audit](/docs/ef69cef8-da15-46b7-94a4-697431a87929)

## Tables

### pvl_automate_connection_audit

| Column             | Type     | Explanation                                           |
|--------------------|----------|------------------------------------------------------|
| computerid         | int      | The unique identifier for the computer               |
| state              | tinyint  | Indicates whether the computer is offline or online (0/1) |
| lastcontact        | datetime | The last contact time of the computer when the state changed |
| datacollectiontime  | datetime | The data collection time for the respective entry    |


