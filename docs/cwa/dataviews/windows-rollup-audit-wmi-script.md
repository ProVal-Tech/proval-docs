---
id: '70484928-22c8-4aed-a32b-861646feaaaf'
slug: /70484928-22c8-4aed-a32b-861646feaaaf
title: 'Windows - Rollup Audit (WMI) Script'
title_meta: 'Windows - Rollup Audit (WMI) Script'
keywords: ['windows', 'update', 'rollup', 'patch', 'client', 'location', 'computer', 'agent', 'os', 'version', 'kb', 'contact']
description: 'This document provides a detailed dataview displaying information about the latest Windows rollup update that has been installed on various machines, including details such as client name, location, computer name, agent type, operating system, Windows version, latest rollup patch, and last contact with Automate.'
tags: ['report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays information about the latest Windows rollup update that has been installed on machines.

## Dependencies

- @plugin_proval_wmipatchesinstalled
- [EPM - Data Collection - Script - Audit WMI Patch History](/docs/113349eb-9de0-4b42-b773-cf873f87f2f0)

## Columns

| Column          | Description                                               |
|-----------------|-----------------------------------------------------------|
| Client          | Client Name                                              |
| Location        | Location Name                                            |
| Computer        | Computer Name                                            |
| Agent Type      | Agent type, whether Server, Workstation, or Laptop       |
| OS              | Operating System information of the agent                |
| Windows Version  | Windows build information of the agent                   |
| Latest Rollup   | Latest Rollup patch installed detail                      |
| KB              | Latest rollup KB installed detail                         |
| Last Contact     | Agent's Last Contact with Automate                       |