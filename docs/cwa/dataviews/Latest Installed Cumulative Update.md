---
id: '0c224e91-ca6e-49b5-b2e6-3a8fee076690'
slug: /0c224e91-ca6e-49b5-b2e6-3a8fee076690
title: 'Latest Installed Cumulative Update'
title_meta: 'Latest Installed Cumulative Update'
keywords: ['cumulative', 'update', 'data', 'view', 'installed', 'machine', 'report']
description: 'This document provides a detailed overview of the data view that displays the latest installed cumulative update for machines, excluding those for which Microsoft does not release updates. It includes dependencies, columns, and a sample screenshot for reference.'
tags: ['report', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays the data fetched by the [CWM - Automate - Script - Get Latest Installed Cumulative Update](<../scripts/Get Latest Installed Cumulative Update.md>) script. The data view explicitly excludes machines for which Microsoft does not release cumulative updates.

## Dependencies

- [CWM - Automate - Script - Get Latest Installed Cumulative Update](<../scripts/Get Latest Installed Cumulative Update.md>)
- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)

## Columns

| Column                              | Description                                         |
|-------------------------------------|-----------------------------------------------------|
| Client ID                           | Client ID (Hidden)                                 |
| Location ID                         | Location ID (Hidden)                               |
| Computer ID                         | Computer ID                                       |
| Client Name                         | Client Name                                        |
| Location Name                       | Location Name                                      |
| Computer Name                       | Computer Name                                      |
| Operating System                    | Operating System                                    |
| Release                             | OS Release Number                                   |
| Latest Installed Cumulative Update   | Name of the Latest Installed Cumulative Update     |
| OS Build                            | Full Build Number of the Operating System           |
| Patch Managed                       | Is the computer patch managed? (Yes/No)            |
| Is End of Life                      | Is the computer's Operating System End of Life? (Yes/No) |
| Last Logged In User                 | Last Logged In User                                 |
| Last Contact                        | Last Contact with RMM                              |
| Script Run Time                     | Last Run Time of the script                         |
| Patch Release Date                  | Date when the installed CU was released             |
| KBID                                | KBID of the CU                                     |
| Days Since Last Cumulative          | Age of the latest installed cumulative update in days |

## Sample Screenshot

![Sample Screenshot](../../../static/img/Latest-Installed-Cumulative-Update/image_1.png)



