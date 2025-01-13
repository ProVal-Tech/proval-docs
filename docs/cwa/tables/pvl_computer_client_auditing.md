---
id: 'cwa-agents-migration-monitoring'
title: 'Agents Migration Monitoring - Client-Level'
title_meta: 'Agents Migration Monitoring - Client-Level'
keywords: ['migration', 'monitoring', 'clients', 'temporary', 'table']
description: 'This document outlines the purpose and structure of a temporary table created by the Agents Migration Monitoring script for tracking machines that are transitioning between clients. It details the dependencies and the specific columns of the pvl_computer_client_auditing table.'
tags: ['database', 'configuration', 'report', 'setup']
draft: false
unlisted: false
---
## Purpose

It's a temporary table created by [CWM - Automate - Script - Agents Migration Monitoring - Client-Level](https://proval.itglue.com/DOC-5078775-12597806) script to keep the tag of the machines jumping from one client to another.

## Dependencies

[CWM - Automate - Script - Agents Migration Monitoring - Client-Level](https://proval.itglue.com/DOC-5078775-12597806)

## Tables

#### pvl_computer_client_auditing

| Column      | Type     | Explanation    |
|-------------|----------|----------------|
| Computerid  | int(8)  | Computerid     |
| Clientid    | int(8)  | Clientid       |
| Timestamp   | datetime | Script Run Time |


