---
id: '70484928-22c8-4aed-a32b-861646feaaaf'
title: 'Latest Windows Rollup Update Information'
title_meta: 'Latest Windows Rollup Update Information'
keywords: ['windows', 'update', 'rollup', 'patch', 'client', 'location', 'computer', 'agent', 'os', 'version', 'kb', 'contact']
description: 'This document provides a detailed dataview displaying information about the latest Windows rollup update that has been installed on various machines, including details such as client name, location, computer name, agent type, operating system, Windows version, latest rollup patch, and last contact with the Automate.'
tags: ['report', 'security', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview displays information about the latest Windows rollup update that has been installed on machines.

## Dependencies

- @ plugin_proval_ wmipatchesinstalled
- [EPM - Data Collection - Script - Audit WMI Patch History](<../scripts/Audit WMI Patch History.md>)

## Columns

| Column          | Description                                               |
|-----------------|-----------------------------------------------------------|
| Client          | Client Name                                              |
| Location        | Location Name                                            |
| Computer        | Computer Name                                            |
| Agent Type      | Agent type whether Server, Workstation or Laptop         |
| OS              | Operating System information of the agent                |
| Windows Version  | Windows build information of the agent                   |
| Latest Rollup   | Latest Rollup patch installed detail                      |
| KB              | Latest rollup KB installed detail                         |
| LastContact     | Agent Last Contact with the Automate                      |














