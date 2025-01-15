---
id: '8cfec2f2-cf2b-41f6-8a2e-2983f66f579f'
title: 'Agent Counts Recorder Data Storage'
title_meta: 'Agent Counts Recorder Data Storage'
keywords: ['data', 'monitor', 'agent', 'counts', 'recorder', 'servers', 'computers', 'clients']
description: 'This document outlines the purpose and dependencies of the Agent Counts Recorder, which stores data regarding the number of servers, computers, and agents that have checked in within the last 90 days. It includes a detailed table describing the structure of the data stored in the plugin_proval_agent_count_history.'
tags: ['database', 'monitoring', 'report', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores data from the monitor @Agent Counts Recorder about the number of servers, computers, and agents that have checked in within 90 days.

## Dependencies

@Agent Counts Recorder - Monitor

## Table

#### plugin_proval_agent_count_history

| Column   | Type | Explanation                                                   |
|----------|------|---------------------------------------------------------------|
| clientid | INT  | The clientid of the client associated with the agent counts.  |
| date     | DATE | The date of the agent count measurement.                      |
| servers  | INT  | The number of servers measured for the associated client.     |
| computers| INT  | The number of non-servers measured for the associated client. |
| over90   | INT  | The number of machines that have checked in within 90 days.  |






