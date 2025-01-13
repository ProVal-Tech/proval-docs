---
id: 'cwa_custom_table_repaired_computers'
title: 'Custom Table for Repaired Computers'
title_meta: 'Custom Table for Repaired Computers'
keywords: ['custom', 'table', 'repaired', 'computers', 'tracking']
description: 'This document outlines the purpose and structure of a custom table designed to store information about repaired computers, including dependencies on related scripts and a detailed description of the table schema.'
tags: ['database', 'setup', 'report', 'configuration']
draft: false
unlisted: false
---
## Purpose

The custom table stores the information of the repaired computers.

## Dependencies

- [CWM - Automate - Script - Track Repaired Agents](https://proval.itglue.com/DOC-5078775-15178447)
- [CWM - Automate - Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441)

## Tables

#### pvl_repaired_agents

| Column       | Type     | Explanation         |
|--------------|----------|---------------------|
| clientid    | int      | clientid            |
| locationid   | int      | locationid          |
| computerid   | int      | computerid          |
| client       | varchar  | Client Name         |
| location     | varchar  | Location Name       |
| computer     | varchar  | Computer Name       |
| RepairTime   | datetime | Agent Repair Time   |



