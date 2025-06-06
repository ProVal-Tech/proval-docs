---
id: 'a20befa8-ecca-4cf9-9d18-c4140f87aafc'
slug: /a20befa8-ecca-4cf9-9d18-c4140f87aafc
title: 'plugin_proval_queued_scripts'
title_meta: 'plugin_proval_queued_scripts'
keywords: ['custom', 'table', 'queued', 'scripts', 'connectwise', 'automate']
description: 'This document explains the purpose and structure of a custom table used in ConnectWise Automate for queuing scripts on target computers. It details the dependencies and the schema of the custom table, including the columns and their explanations.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Purpose

This custom table holds the target computer ID, the script ID of a script you wish to queue, and any parameters you wish to pass to that script. The custom table is created by [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721). The custom table is populated by [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721) when you schedule a task on an offline machine. The custom table is read by [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031). The custom table is cleaned by [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) after executing the script on the target computer.

## Dependencies

- [CWM - Automate - Solution - Queue Script Next Checkin](/docs/2910ca09-a0c7-4b44-8ea4-ef6e71304df8)
- [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721)
- [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031)

## Tables

### plugin_proval_queued_scripts

| Column             | Type | Explanation                                               |
|--------------------|------|----------------------------------------------------------|
| ComputerID         | INT  | The target computer of the queued script.                |
| ScriptID           | INT  | The target script to be executed on the computer.        |
| ScriptParameters    | Text | Any parameters necessary for the successful execution of the targeted script. |