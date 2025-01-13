---
id: 'cwa-auditing-windows-10-versions'
title: 'Auditing Windows 10 Versions'
title_meta: 'Auditing Windows 10 Versions for ClientID and ReleaseID'
keywords: ['auditing', 'windows', 'clientid', 'releaseid', 'metrics']
description: 'This document provides data used for auditing Windows 10 versions, displaying information grouped by ClientID and ReleaseID. It includes details on the total number of machines, online status, and patch policy compliance for various Windows 10 versions.'
tags: ['windows', 'report', 'performance', 'configuration']
draft: false
unlisted: false
---
## Purpose

Data used for auditing Windows 10 versions. Displays information grouped by ClientID and ReleaseID of Windows 10.

## Dependencies

[Windows - Windows 10 Version Metrics + Filters](https://proval.itglue.com/DOC-5078775-7789750)

## Table

#### plugin_proval_v_windows_10_version_metrics

| Column                             | Type     | Explanation                                                              |
|------------------------------------|----------|--------------------------------------------------------------------------|
| ReleaseID                          | VARCHAR  | The ReleaseID of Windows 10 (1803, 1909, etc.)                          |
| Total Machines Unfiltered           | BIGINT   | Total agents with this version of Windows 10.                           |
| % Total Unfiltered                  | DECIMAL  | Percent of Windows 10 machines with this version.                       |
| Count Machines Online               | BIGINT   | Number of machines with this version of Windows 10 that are online.    |
| % Total Online                      | DECIMAL  | The percentage of Windows 10 machines with this version that are online.|
| clientid                           | INT      | The ClientID of the audited Windows 10 versions.                        |
| Machines W/ Patch Policy            | BIGINT   | The number of Windows 10 machines with the specified version with a patching policy. |
| % Total W/ Patch Policy             | DECIMAL  | The percent of Windows 10 machines with the specified version with a patching policy. |
| Online Machines W/ Patch Policy     | BIGINT   | The number of online Windows 10 machines with the specified version with a patching policy. |
| % Total Online W/Patch Policy       | DECIMAL  | The percent of online Windows 10 machines with the specified version with a patching policy. |
| Client_Name                        | VARCHAR  | The name of the audited client.                                         |




