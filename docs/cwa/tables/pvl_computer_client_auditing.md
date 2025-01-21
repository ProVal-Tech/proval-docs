---
id: '0030148b-608a-449a-9d52-ff1678fa79c0'
title: 'pvl_computer_client_auditing'
title_meta: 'pvl_computer_client_auditing'
keywords: ['migration', 'monitoring', 'clients', 'temporary', 'table']
description: 'This document outlines the purpose and structure of a temporary table created by the Agents Migration Monitoring script for tracking machines that are transitioning between clients. It details the dependencies and the specific columns of the pvl_computer_client_auditing table.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

This document describes a temporary table created by the [CWM - Automate - Script - Agents Migration Monitoring - Client-Level](<../scripts/Agents Migration Monitoring - Client-Level.md>) script, which is used to track machines transitioning from one client to another.

## Dependencies

- [CWM - Automate - Script - Agents Migration Monitoring - Client-Level](<../scripts/Agents Migration Monitoring - Client-Level.md>)

## Tables

### pvl_computer_client_auditing

| Column      | Type     | Explanation    |
|-------------|----------|----------------|
| Computerid  | int(8)  | Unique identifier for the computer |
| Clientid    | int(8)  | Unique identifier for the client   |
| Timestamp   | datetime | The time when the script was run   |



