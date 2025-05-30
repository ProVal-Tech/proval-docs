---
id: 'dd58d567-cc2a-4d71-831b-32f4079c2534'
slug: /dd58d567-cc2a-4d71-831b-32f4079c2534
title: 'Admin - Machines Without Patching Configuration'
title_meta: 'Admin - Machines Without Patching Configuration'
keywords: ['microsoft', 'update', 'policy', 'report', 'machines']
description: 'This document provides a detailed overview of a dataview that displays machines where the Microsoft update policy is not set, including various columns that provide insights into the client, location, computer details, and patching status.'
tags: ['patching', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays any machines where the Microsoft update policy is not set.

## Columns

| Column                             | Description                                                                                     |
|------------------------------------|-------------------------------------------------------------------------------------------------|
| Client                             | Client name                                                                                    |
| Location                           | Location name                                                                                  |
| Computer                           | Computer name                                                                                  |
| OS                                 | The operating system of the computer                                                           |
| Last Contact                       | The last contact date of the agent                                                              |
| Install Policy                     | Displays the current Microsoft update policy set on the agent                                  |
| Onboarding Completed                | Displays the onboarding status of the agent                                                    |
| Patching Checkbox Enabled           | Displays whether patching is enabled or disabled for the computer's location                   |
| Effective Service Plan             | Displays the applied service plan                                                                |
| All Patch Approvals                | Displays whether the patch approvals are enabled or disabled for the computer                  |
| Applied Patching Agent Templates    | Name of the applied patching-related agent templates                                            |
| Patch Exclusion Checkbox           | Displays whether the `Disable Automated Patch Install` EDF is `Checked` or `Unchecked`         |
| Cluster Role Detected              | Displays whether the cluster role detected is True                                             |
| Last User Name                     | Displays the last username of the machine                                                      |