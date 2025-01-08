---
id: 'cwa_proval_internal_monitor_audit'
title: 'ProVal Internal Monitor Audit Data Summary'
title_meta: 'ProVal Internal Monitor Audit Data Summary'
keywords: ['monitor', 'proval', 'custom', 'sync', 'status', 'scan', 'fail', 'group']
description: 'This document provides a comprehensive overview of internal monitors containing "proval" or "custom" in their names, detailing their synchronization status with the ProSync plugin, last scan times, failure counts, and the associated group IDs for each monitor.'
tags: ['monitor', 'sync', 'status', 'scan', 'fail', 'group', 'plugin']
draft: false
unlisted: false
---
## Summary

Lists all the internal monitors which contains 'proval' or 'custom' in their names. It depicts their sync status with ProSync plugin. It also details the last scan, fail count and the groups id it is applied for the monitor.

## Dependencies

plugin_prosync_monitors

## Columns

| Column                       | Description                                           |
|------------------------------|-------------------------------------------------------|
| Monitor ID                   | Monitor ID                                           |
| Monitor Name                 | Name of the monitor.                                 |
| DriveID                      | Group IDs to which internal monitor is applied to.   |
| Synced In ProVal Plugin      | Is script synced with prosync plugin or not.        |
| Last Scan                    | Last time monitor ran in the environment.            |
| Fail Count                   | Total number of times monitor failed in the environment. |
| GUID                         | Script GUID                                          |
| Agent Default GUID           | Script Default GUID                                  |

## Reference Tables

- plugin_prosync_monitors
- agents
- h_agents

## Sample Screenshot

[![Sample Screenshot](thumbnail/2023-02-10_08_59_52-ProVal_Internal_Monitor_Audit_Data_Summary.png)](large/2023-02-10_08_59_52-ProVal_Internal_Monitor_Audit_Data_Summary.png)

