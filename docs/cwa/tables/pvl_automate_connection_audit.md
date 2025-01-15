---
id: 'ec679801-c86a-4127-9b62-46be10207909'
title: 'Custom Table for Computer Contact Audit'
title_meta: 'Custom Table for Computer Contact Audit'
keywords: ['custom', 'table', 'contact', 'audit', 'automate']
description: 'This document outlines the purpose and structure of a custom table that records the last contact time of computers in ConnectWise Automate whenever their state changes, including going offline and checking in again.'
tags: ['database', 'configuration', 'report', 'update']
draft: false
unlisted: false
---
## Purpose

The custom table records the computer’s last contact time whenever its state changes. This includes when the computer goes offline and when it starts checking in with Automate.

## Dependencies

- [CWM - Automate - Internal Monitor - Update Table - pvl_automate_connection_audit](https://proval.itglue.com/DOC-5078775-18178743)
- [CWM - Automate - script - Automate Agent Connection Audit](https://proval.itglue.com/DOC-5078775-18178745)

## Tables

### pvl_automate_connection_audit

| Column            | Type     | Explanation                                           |
|-------------------|----------|------------------------------------------------------|
| computerid        | int      | computerid                                          |
| state             | tinyint  | whether the computer is offline or online (0/1)    |
| lastcontact       | datetime | last contact time of the computer when the state changed |
| datacollectiontime | datetime | data collection time for the respective entry       |






