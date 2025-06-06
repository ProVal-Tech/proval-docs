---
id: '99dc53c5-ca74-4988-815a-0a1ad3fad8eb'
slug: /99dc53c5-ca74-4988-815a-0a1ad3fad8eb
title: 'Windows Cluster Volume Space Audit'
title_meta: 'Windows Cluster Volume Space Audit'
keywords: ['audit', 'cluster', 'disk', 'space', 'report', 'hyper-v']
description: 'This document provides a detailed overview of the cluster disk space audit report generated from the pvl_cluster_volumes table. It includes information on the client, location, computer, operating system, and various metrics related to cluster volume sizes and usage, as well as dependencies on the relevant CWA script.'
tags: ['cluster', 'disk', 'hyper-v', 'performance', 'report']
draft: false
unlisted: false
---

## Summary

This dataview is built to show the cluster disk space audit report fetched from the table **pvl_cluster_volumes**, where the script [CWA Script - Windows Cluster Volume Space Audit](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490) performs the audit.

## Dependencies

[CWA Script - Windows Cluster Volume Space Audit](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490)

## Columns

| Column                                   | Description                                                               |
|------------------------------------------|---------------------------------------------------------------------------|
| Client                                   | Client name of the agent                                                  |
| Location                                 | Location name of the agent                                               |
| Computer                                 | The computer name of the agent                                           |
| Operating System                         | The operating system name of the agent                                   |
| Last Contact                             | Last contact of the agent with the RMM tool                             |
| Cluster Name                             | The cluster name of the Hyper-V cluster server                           |
| Cluster Path                             | The cluster path of the Hyper-V cluster server                           |
| Cluster Volume Total Size (GB)          | The cluster volume total size on the Hyper-V cluster server              |
| Cluster Volume Free Space (GB)          | The cluster volume available size on the Hyper-V cluster server          |
| Cluster Volume Used Space (GB)          | The cluster volume used size on the Hyper-V cluster server               |
| Cluster Volume Free Percent              | The cluster volume available in percent of the Hyper-V cluster server    |
| Script Last Run Time                     | Script last run time when the latest audit was done on the Hyper-V cluster server. |