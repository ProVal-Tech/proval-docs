---
id: '449ae721-2fbc-413d-b0a2-09efb2f0d9e9'
title: 'ProVal Internal Monitor Audit'
title_meta: 'ProVal Internal Monitor Audit'
keywords: ['monitor', 'proval', 'custom', 'sync', 'status', 'scan', 'fail', 'group']
description: 'This document provides a comprehensive overview of internal monitors containing "proval" or "custom" in their names, detailing their synchronization status with the ProSync plugin, last scan times, failure counts, and the associated group IDs for each monitor.'
tags: []
draft: false
unlisted: false
---

## Summary

This document lists all the internal monitors that contain 'proval' or 'custom' in their names. It depicts their synchronization status with the ProSync plugin and details the last scan time, failure count, and the group IDs to which each monitor is applied.

## Dependencies

- plugin_prosync_monitors

## Columns

| Column                       | Description                                           |
|------------------------------|-------------------------------------------------------|
| Monitor ID                   | Monitor ID                                           |
| Monitor Name                 | Name of the monitor.                                 |
| DriveID                      | Group IDs to which the internal monitor is applied.  |
| Synced In ProVal Plugin      | Indicates whether the script is synced with the ProSync plugin. |
| Last Scan                    | The last time the monitor ran in the environment.    |
| Fail Count                   | Total number of times the monitor has failed in the environment. |
| GUID                         | Script GUID                                          |
| Agent Default GUID           | Script Default GUID                                  |

## Reference Tables

- plugin_prosync_monitors
- agents
- h_agents



