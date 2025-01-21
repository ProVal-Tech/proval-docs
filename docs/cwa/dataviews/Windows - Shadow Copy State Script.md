---
id: '69110f54-d14f-4691-a68f-56bbc88b5fb3'
title: 'Windows - Shadow Copy State Script'
title_meta: 'Windows - Shadow Copy State Script'
keywords: ['shadow', 'copy', 'audit', 'dataview', 'windows', 'statistics']
description: 'This document provides a detailed overview of a DataView that displays the Windows Shadow Copy state for endpoints with Shadow Copy enabled. It includes information gathered from the Shadow Copy - Audit Complete Statistics script and outlines the necessary dependencies, as well as the columns available in the DataView.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This DataView displays the Windows Shadow Copy state for endpoints with Shadow Copy enabled that have run the script [Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>) to gather the information.

## Dependencies

- [Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>)
- [Custom Table - plugin_proval_shadowcopystats](<../tables/plugin_proval_shadowcopystats.md>)

## Columns

| Column                                      | Description                                                            |
|---------------------------------------------|------------------------------------------------------------------------|
| Client Name                                 | The name of the client associated with the machine                     |
| Location Name                               | The name of the locations associated with the machine                  |
| Computer Name                               | The name of the machine associated with the data                       |
| Operating System                            | The operating system name of the agent                                 |
| Last Contact                                | Last contact of the agent with CW Automate                             |
| Drive Letter                                | The drive letter associated with the Shadow Copy                       |
| Drive Size (GB)                            | The allotted capacity for Shadow Copy on the machine                   |
| Drive Free (GB)                            | The remaining space for Shadow Copy to use on the machine              |
| Shadow Copy Count                           | The number of Shadow Copies on the machine                             |
| Oldest Shadow Copy                          | The oldest available Shadow Copy date                                   |
| Latest Shadow Copy                          | The most recent available Shadow Copy date                              |
| Used Space by Shadow Copy (GB)             | Used space size by the Shadow Copy in GB                               |
| Allocated Size of Shadow Copy (GB)         | Allocated space size for the Shadow Copy in GB                         |
| Maximum Space Provided to Shadow Copy (GB) | Maximum space provided to the Shadow Copy in GB                        |




