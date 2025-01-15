---
id: 'cafd4aba-ae71-4098-bde5-52173cdc0427'
title: 'Repaired Agents Dataview'
title_meta: 'Repaired Agents Dataview'
keywords: ['dataview', 'agents', 'repair', 'automate', 'information']
description: 'This document provides a summary of the dataview that displays information about agents that have been repaired using the Automate Agent - Auto Repair script. It includes details on dependencies, columns, and the data captured for each repaired agent.'
tags: ['database', 'report', 'configuration', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

The dataview displays the information of the agents repaired by the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441).

## Dependencies

- [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441)
- [Custom Table - pvl_repaired_agents](https://proval.itglue.com/DOC-5078775-15178457)
- [Script - Track Repaired Agents](https://proval.itglue.com/DOC-5078775-15178447)

## Columns

| Column                    | Description                                                                                           |
|--------------------------|-------------------------------------------------------------------------------------------------------|
| Clientid                 | Clientid (Hidden)                                                                                     |
| Locationid               | Locationid (Hidden)                                                                                   |
| Computerid               | Computerid                                                                                             |
| Client                   | Client Name                                                                                           |
| Location                 | Location Name                                                                                         |
| Computer                 | Computer Name                                                                                         |
| Repair Time              | Agent Repair Time                                                                                     |
| Days Since Repaired      | Days Since the Agent was Repaired                                                                     |
| Form Factor              | Form Factor (Laptop/Desktop/Virtual Server/Physical Server/HyperV Host)                              |
| Operating System         | Operating System                                                                                      |
| Last Logged In User      | Last Logged In User                                                                                    |
| Last Contact with RMM    | Last Contact with RMM                                                                                 |
| Current Status           | Current Status of the machine (Offline/Online/Broken/Retired)                                        |






