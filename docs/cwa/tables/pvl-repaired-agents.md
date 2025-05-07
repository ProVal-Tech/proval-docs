---
id: '1258c674-8d60-446d-a3c6-f3295ee682cf'
slug: /1258c674-8d60-446d-a3c6-f3295ee682cf
title: 'pvl_repaired_agents'
title_meta: 'pvl_repaired_agents'
keywords: ['custom', 'table', 'repaired', 'computers', 'tracking']
description: 'This document outlines the purpose and structure of a custom table designed to store information about repaired computers, including dependencies on related scripts and a detailed description of the table schema.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

The custom table stores information about repaired computers.

## Dependencies

- [CWM - Automate - Script - Track Repaired Agents](/docs/1cfbe430-0cbd-4abf-861d-4884632b7705)
- [CWM - Automate - Script - Automate Agent - Auto Repair](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c)

## Tables

#### pvl_repaired_agents

| Column       | Type     | Explanation         |
|--------------|----------|---------------------|
| clientid    | int      | Client ID           |
| locationid   | int      | Location ID         |
| computerid   | int      | Computer ID         |
| client       | varchar  | Client Name         |
| location     | varchar  | Location Name       |
| computer     | varchar  | Computer Name       |
| RepairTime   | datetime | Agent Repair Time   |
