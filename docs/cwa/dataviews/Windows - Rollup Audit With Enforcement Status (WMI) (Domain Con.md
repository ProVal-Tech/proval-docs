---
id: 'cwa-latest-rollup-installation-details'
title: 'Latest Rollup Installation Details on Domain Controllers'
title_meta: 'Latest Rollup Installation Details on Domain Controllers'
keywords: ['rollup', 'installation', 'domain', 'controllers', 'patch', 'audit']
description: 'This document provides a comprehensive overview of the latest rollup installation details on domain controllers, including dependencies, columns of data collected, and the significance of the information gathered.'
tags: ['installation', 'update', 'windows', 'security', 'audit']
draft: false
unlisted: false
---
## Summary

This dataview collects latest rollup installation detail on domain controllers.

## Dependencies

- @CVE-2020-1472 Enforcement Mode Disabled -- Role
- @CVE-2020-1472 Enforcement Mode Enabled -- Role
- @plugin_proval_wmipatchesinstalled -- Table
- @Audit WMI Patch History [DV] -- Script

## Columns

| Column            | Description                                             |
|-------------------|---------------------------------------------------------|
| Client            | Client Name                                            |
| Location          | Location Name                                          |
| Computer          | Computer Name                                          |
| Agent Type        | Agent type whether Server, Workstation or Laptop       |
| OS                | Operating System information of the agent              |
| Windows Version    | Windows build information of the agent                 |
| Latest Rollup     | Latest Rollup patch installed detail                   |
| KB                | Latest rollup KB installed detail                      |
| LastContact       | Agent Last Contact with the Automate                   |
| Enforcement Status | Confirms if Enforcement enabled or not. This is outdated info as it has been fixed with Dec 2020 rollup release. |

