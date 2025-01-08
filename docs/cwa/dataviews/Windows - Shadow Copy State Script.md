---
id: 'cwa-shadow-copy-audit'
title: 'Shadow Copy Audit DataView'
title_meta: 'Shadow Copy Audit DataView for Windows Endpoints'
keywords: ['shadow', 'copy', 'audit', 'dataview', 'windows', 'statistics']
description: 'This document provides a detailed overview of a DataView that displays the Windows Shadow Copy state for endpoints with Shadow Copy enabled. It includes information gathered from the Shadow Copy - Audit Complete Statistics script and outlines the necessary dependencies, as well as the columns available in the DataView.'
tags: ['windows', 'report', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview will display the Windows Shadow Copy state for endpoints with Shadow Copy Enabled and that have run the script [Shadow Copy - Audit Complete Statistics [DV]](https://proval.itglue.com/DOC-5078775-7751337) to gather the information.

## Dependencies

- [Shadow Copy - Audit Complete Statistics [DV]](https://proval.itglue.com/DOC-5078775-7751337)
- [Custom Table - plugin_proval_shadowcopystats](https://proval.itglue.com/DOC-5078775-8157668)

## Columns

| Column                                   | Description                                                            |
|------------------------------------------|------------------------------------------------------------------------|
| Client Name                              | The name of the client associated with the machine                     |
| Location Name                            | The name of the locations associated with the machine                  |
| Computer Name                            | The name of the machine associated with the data                       |
| Operating System                         | The operating system name of the agent                                 |
| Lastcontact                              | LastContact of the agent with the CW Automate                          |
| Drive Letter                             | The Drive letter associated with the Shadow Copy                       |
| Drive Size (GB)                         | The allotted capacity for Shadow Copy on the machine                   |
| Drive Free (GB)                         | The remaining space for Shadow Copy to use on the machine              |
| ShadowCopyCount                          | The number of Shadow Copies on the machine                             |
| Oldest ShadowCopy                        | The oldest available Shadow Copy date                                   |
| Latest ShadowCopy                        | The most recent available Shadow Copy date                              |
| Used Space by Shadow Copy (GB)          | Used space size by the Shadow Copy in GB                               |
| Allocated Size of Shadow Copy (GB)      | Allocated space size for the Shadow Copy in GB                         |
| Maximum Space Provided to Shadow Copy (GB)| Maximum space provided to the Shadow Copy in GB                       |

