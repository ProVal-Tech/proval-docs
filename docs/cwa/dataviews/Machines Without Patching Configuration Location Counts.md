---
id: '56f0bbc5-b7ae-4d23-a711-40489a9a5603'
slug: /56f0bbc5-b7ae-4d23-a711-40489a9a5603
title: 'Machines Without Patching Configuration Location Counts'
title_meta: 'Machines Without Patching Configuration Location Counts'
keywords: ['machines', 'location', 'update', 'policy', 'count']
description: 'This document provides a detailed overview of the count of machines per location where the Microsoft update policy is not set, including various metrics related to patching and onboarding status.'
tags: ['patching', 'report', 'update']
draft: false
unlisted: false
---

## Summary

This dataview displays the count of machines per location where the Microsoft update policy is not set.

## Columns

| Column                        | Description                                                                                       |
|-------------------------------|---------------------------------------------------------------------------------------------------|
| Client                        | Client name                                                                                       |
| Location                      | Location name                                                                                     |
| TotalAgents                   | Number of Agents per Location                                                                     |
| NoPatchPolicyCount            | Number of Agents per Location without Patch Policy set on them                                   |
| NotOnboardedCount            | Number of Agents per Location where onboarding is not completed                                   |
| DisableAutomatedPatchInstallCount | Number of Agents per Location where the Computer EDF 'Disable Automated Patch Install' is selected |
| DisableAllPatchApprovalCount  | Number of Agents per Location where the Computer EDF `Disable All Patch Approval` is selected     |
| ClusterMachinesCount          | Number of Agents per Location where cluster role detected is True                                 |
| DoNotPatchCount              | Number of Agents per Location with `Applied Patching Agent Templates` as 'DO NOT PATCH'         |
| DisabledPatchingCount         | Number of Agents per Location where location EDF `Enable Patching Servers` for servers and `Enable Patching Workstations` for workstations is not enabled |
| Attention                     | Calculates the difference between `NoPatchPolicyCount` and `NotOnboardedCount` and highlights those rows where the difference is greater than 0. |


