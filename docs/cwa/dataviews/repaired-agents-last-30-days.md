---
id: 'cafd4aba-ae71-4098-bde5-52173cdc0427'
slug: /cafd4aba-ae71-4098-bde5-52173cdc0427
title: 'Repaired Agents Last 30 Days'
title_meta: 'Repaired Agents Last 30 Days'
keywords: ['dataview', 'agents', 'repair', 'automate', 'information']
description: 'This document provides a summary of the dataview that displays information about agents that have been repaired using the Automate Agent - Auto Repair script. It includes details on dependencies, columns, and the data captured for each repaired agent.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The dataview displays the information of the agents repaired by the [Script - Automate Agent - Auto Repair](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c).

## Dependencies

- [Script - Automate Agent - Auto Repair](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c)
- [Custom Table - pvl_repaired_agents](/docs/1258c674-8d60-446d-a3c6-f3295ee682cf)
- [Script - Track Repaired Agents](/docs/1cfbe430-0cbd-4abf-861d-4884632b7705)

## Columns

| Column                    | Description                                                                                           |
|--------------------------|-------------------------------------------------------------------------------------------------------|
| Clientid                 | Client ID (Hidden)                                                                                    |
| Locationid               | Location ID (Hidden)                                                                                  |
| Computerid               | Computer ID                                                                                           |
| Client                   | Client Name                                                                                           |
| Location                 | Location Name                                                                                         |
| Computer                 | Computer Name                                                                                         |
| Repair Time              | Agent Repair Time                                                                                     |
| Days Since Repaired      | Days Since the Agent was Repaired                                                                     |
| Form Factor              | Form Factor (Laptop/Desktop/Virtual Server/Physical Server/Hyper-V Host)                             |
| Operating System         | Operating System                                                                                      |
| Last Logged In User      | Last Logged In User                                                                                    |
| Last Contact with RMM    | Last Contact with RMM                                                                                 |
| Current Status           | Current Status of the machine (Offline/Online/Broken/Retired)                                        |
