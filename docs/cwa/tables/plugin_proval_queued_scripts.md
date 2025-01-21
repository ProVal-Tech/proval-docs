---
id: 'a20befa8-ecca-4cf9-9d18-c4140f87aafc'
title: 'Custom Table for Queued Scripts in ConnectWise Automate'
title_meta: 'Custom Table for Queued Scripts in ConnectWise Automate'
keywords: ['custom', 'table', 'queued', 'scripts', 'connectwise', 'automate']
description: 'This document explains the purpose and structure of a custom table used in ConnectWise Automate for queuing scripts on target computers. It details the dependencies and the schema of the custom table, including the columns and their explanations.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Purpose

This custom table holds the target computer ID, the script ID of a script you wish to queue, and any parameters you wish to pass to that script. The custom table is created by [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>). The custom table is populated by [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>) when you schedule a task on an offline machine. The custom table is read by [CWM - Automate - Script - Run Queued Scripts](<../scripts/Run Queued Scripts.md>). The custom table is cleaned by [CWM - Automate - Script - Run Queued Scripts](<../scripts/Run Queued Scripts.md>) after executing the script on the target computer.

## Dependencies

- [CWM - Automate - Solution - Queue Script Next Checkin](<../../solutions/Queue Script Next Checkin.md>)
- [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>)
- [CWM - Automate - Script - Run Queued Scripts](<../scripts/Run Queued Scripts.md>)

## Tables

### plugin_proval_queued_scripts

| Column             | Type | Explanation                                               |
|--------------------|------|----------------------------------------------------------|
| ComputerID         | INT  | The target computer of the queued script.                |
| ScriptID           | INT  | The target script to be executed on the computer.        |
| ScriptParameters    | Text | Any parameters necessary for the successful execution of the targeted script. |
