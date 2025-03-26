---
id: 'e7ef3c95-960a-430c-803e-665b1d7f677c'
slug: /e7ef3c95-960a-430c-803e-665b1d7f677c
title: 'plugin_proval_v_windows_10_version_metrics'
title_meta: 'plugin_proval_v_windows_10_version_metrics'
keywords: ['auditing', 'windows', 'clientid', 'releaseid', 'metrics']
description: 'This document provides data used for auditing Windows 10 versions, displaying information grouped by ClientID and ReleaseID. It includes details on the total number of machines, online status, and patch policy compliance for various Windows 10 versions.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document provides data used for auditing Windows 10 versions. It displays information grouped by ClientID and ReleaseID of Windows 10.

## Dependencies

[Windows - Windows 10 Version Metrics + Filters](/docs/d78ab24a-3a09-4712-95f5-bb18f4c05f67)

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
| Machines W/ Patch Policy            | BIGINT   | The number of Windows 10 machines with the specified version that have a patching policy. |
| % Total W/ Patch Policy             | DECIMAL  | The percent of Windows 10 machines with the specified version that have a patching policy. |
| Online Machines W/ Patch Policy     | BIGINT   | The number of online Windows 10 machines with the specified version that have a patching policy. |
| % Total Online W/Patch Policy       | DECIMAL  | The percent of online Windows 10 machines with the specified version that have a patching policy. |
| Client_Name                        | VARCHAR  | The name of the audited client.                                         |


