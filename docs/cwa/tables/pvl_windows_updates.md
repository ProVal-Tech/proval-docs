---
id: 'd1791eba-107c-4be0-8048-a1d716dae301'
slug: /d1791eba-107c-4be0-8048-a1d716dae301
title: 'pvl_windows_updates'
title_meta: 'pvl_windows_updates'
keywords: ['windows', 'update', 'history', 'agents', 'audit']
description: 'This document provides detailed information about the Windows Update history for agents, including the structure of the database table used to store update information and its dependencies on the populating script. It outlines the columns in the pvl_windows_updates table and their respective explanations.'
tags: ['database', 'installation', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores information about Windows Update history for agents.

## Dependencies

Populating script: [EPM - Script - Windows Update History Audit](/docs/d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6)

## Tables

#### pvl_windows_updates

| Column                          | Type      | Explanation                                                                                     |
|---------------------------------|-----------|-------------------------------------------------------------------------------------------------|
| Computerid                      | INT       | Associated agent's computer ID                                                                  |
| Size                            | VARCHAR   | Size of the update                                                                              |
| Status                          | VARCHAR   | Current installation status of the update                                                       |
| KB                              | VARCHAR   | Knowledge base ID of the update                                                                  |
| TitleMD5                       | CHAR      | MD5 hash of the Title string                                                                     |
| Title                           | TEXT      | Title of the update                                                                              |
| Description                     | TEXT      | Description given to the update                                                                   |
| AutoSelectOnWebSites           | TINYINT   |                                                                                                 |
| CanRequireSource                | TINYINT   |                                                                                                 |
| EulaAccepted                    | TINYINT   |                                                                                                 |
| EulaText                        | TEXT      | End User License Agreement for the update                                                       |
| HandlerID                       | VARCHAR   | Handler ID of the update                                                                         |
| IsBeta                          | TINYINT   |                                                                                                 |
| IsDownloaded                    | TINYINT   |                                                                                                 |
| IsHidden                        | TINYINT   |                                                                                                 |
| IsInstalled                     | TINYINT   |                                                                                                 |
| IsMandatory                     | TINYINT   |                                                                                                 |
| IsUninstallable                 | TINYINT   |                                                                                                 |
| LastDeploymentChangeTime        | DATETIME  | Most recent date and time that the deployment status of the update changed                      |
| MaxDownloadSize                 | DECIMAL   | Maximum possible download size of the update                                                    |
| RecommendedCpuSpeed             | INT       | Recommended CPU speed for installing the update                                                 |
| RecommendedHardDiskSpace        | INT       | Recommended free space for installing the update                                                |
| RecommendedMemory               | INT       | Recommended amount of RAM for installing the update                                             |
| ReleaseNotes                    | TEXT      | Release notes for the update                                                                     |
| MsrcSeverity                    | VARCHAR   | [MSRC severity level](https://www.microsoft.com/en-us/msrc/security-update-severity-rating-system) of the update |
| SupportUrl                      | VARCHAR   | Support URL for the update                                                                       |
| Type                            | INT       |                                                                                                 |
| UninstallNotes                  | TEXT      | Uninstall notes for the update                                                                   |
| RebootRequired                   | TINYINT   |                                                                                                 |
| IsPresent                       | TINYINT   |                                                                                                 |
| BrowseOnly                      | TINYINT   |                                                                                                 |
| PerUser                         | TINYINT   |                                                                                                 |
| ScriptRunTime                   | DATETIME  | Last date and time that the populating script was executed.                                     |



