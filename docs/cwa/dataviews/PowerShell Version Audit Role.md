---
id: '9da26821-e8e6-44b4-9310-2495aebd0396'
title: 'PowerShell Version Audit Role'
title_meta: 'PowerShell Version Audit Role'
keywords: ['powershell', 'version', 'role', 'rmm', 'agent']
description: 'This document details a dataview that collects PowerShell version information based on the role of the agent in the RMM. It includes dependencies, a summary of the data collected, and descriptions of the columns used in the dataview.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview collects information about the PowerShell version based on the role.

## Dependencies

[Dynamic PowerShell Role](<../roles/Dynamic PowerShell Role.md>)

## Columns

| Column               | Description                               |
|----------------------|-------------------------------------------|
| Client               | Client name of the agent                  |
| Location             | Location name of the agent                |
| Computer             | Computer name of the agent                |
| Operating System     | Operating system of the agent             |
| Last Contact         | Last contact of the agent with the RMM   |
| PowerShell Version    | PowerShell version of the agent           |



