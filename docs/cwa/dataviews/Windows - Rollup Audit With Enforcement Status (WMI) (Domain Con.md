---
id: '090c6eaa-06b0-4062-a3e1-e00a76fd750c'
title: 'Windows - Rollup Audit With Enforcement Status (WMI) (Domain Con'
title_meta: 'Windows - Rollup Audit With Enforcement Status (WMI) (Domain Con'
keywords: ['rollup', 'installation', 'domain', 'controllers', 'patch', 'audit']
description: 'This document provides a comprehensive overview of the latest rollup installation details on domain controllers, including dependencies, columns of data collected, and the significance of the information gathered.'
tags: ['installation', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document collects the latest rollup installation details on domain controllers.

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
| Agent Type        | Agent type (Server, Workstation, or Laptop)           |
| OS                | Operating System information of the agent              |
| Windows Version    | Windows build information of the agent                 |
| Latest Rollup     | Latest Rollup patch installed details                  |
| KB                | Latest rollup KB installed details                     |
| LastContact       | Agent's last contact with the Automate                 |
| Enforcement Status | Confirms if enforcement is enabled or not. This information is outdated as it has been fixed with the December 2020 rollup release. |



