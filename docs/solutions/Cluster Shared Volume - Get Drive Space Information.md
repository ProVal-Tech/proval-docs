---
id: '957a288b-c81e-48a5-aa41-ed071e755fb5'
slug: /957a288b-c81e-48a5-aa41-ed071e755fb5
title: 'Cluster Shared Volume - Get Drive Space Information'
title_meta: 'Cluster Shared Volume - Get Drive Space Information'
keywords: ['cluster', 'volume', 'audit', 'dataview', 'script']
description: 'This document provides a detailed guide on how to display information about Cluster Shared Volumes in ConnectWise Automate, including the implementation of associated scripts and dataviews for effective monitoring and reporting.'
tags: ['cluster', 'windows']
draft: false
unlisted: false
---

## Purpose

This document displays detailed information on [Cluster Shared Volumes](https://www.minitool.com/lib/cluster-shared-volume.html) in Automate.

## Associated Content

| Content                                                                                                            | Type         | Function                                                                                                                                                                                                                                                                                    |
| ------------------------------------------------------------------------------------------------------------------ | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Cluster Volume Disk Space Audit](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490)                                      | Script       | This script collects information about Clustered Volumes and stores it in the [Plugin_ProVal_ClusterSharedVolume](/docs/dcf0c0e1-7201-4008-a1ad-98fd0a80c138) table.                                                                                                                        |
| [CWM - Automate - Custom Table - Plugin_ProVal_ClusterSharedVolume](/docs/dcf0c0e1-7201-4008-a1ad-98fd0a80c138)    | Custom Table | This table is used to store the data collected by the [Cluster Volume Disk Space Audit](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490) script, which feeds into the [Cluster Volume Disk Space Audit](/docs/99dc53c5-ca74-4988-815a-0a1ad3fad8eb) dataview.                                    |
| [CWM - Automate - Dataview - Cluster Volume Disk Space Audit [Script]](/docs/99dc53c5-ca74-4988-815a-0a1ad3fad8eb) | Dataview     | This dataview is required to display information about [Cluster Shared Volumes](https://www.minitool.com/lib/cluster-shared-volume.html). The data is populated by the [CWM - Automate - script - Cluster Volume Disk Space Audit [DV]](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490) script. |

## Implementation

- Import the [CWM - Automate - script - Cluster Volume Disk Space Audit [DV]](/docs/cbd9495c-f2a7-44f1-9f84-55cfa1ac1490) script.
- Import the [CWM - Automate - Dataview - Cluster Volume Disk Space Audit [Script]](/docs/99dc53c5-ca74-4988-815a-0a1ad3fad8eb) dataview.
- Run the script against a computer with the "Windows Cluster Services" role installed to create the custom table.
- Set up a group for all servers running Windows Server 2012 R2 and later that have the "Windows Cluster Services" role installed, then schedule the script to execute against that group once per day.