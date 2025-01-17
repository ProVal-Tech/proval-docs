---
id: '9da26821-e8e6-44b4-9310-2495aebd0396'
title: 'PowerShell Version Collection by Role'
title_meta: 'PowerShell Version Collection by Role'
keywords: ['powershell', 'version', 'role', 'rmm', 'agent']
description: 'This document details a dataview that collects PowerShell version information based on the role of the agent in the RMM. It includes dependencies, a summary of the data collected, and descriptions of the columns used in the dataview.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview collects the information of PowerShell Version based on role.

## Dependencies

[Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872)

## Columns

| Column              | Description                               |
|---------------------|-------------------------------------------|
| Client              | Client Name of the agent                  |
| Location            | Location Name of the agent                |
| Computer            | Computer Name of the agent                |
| Operating System    | Operating System of the agent             |
| LastContact         | Last Contact of agent with the RMM       |
| PowerShell Version   | PowerShell Version of the agent           |













