---
id: '33896d60-d14a-49e0-90b8-605faf96e41f'
slug: /33896d60-d14a-49e0-90b8-605faf96e41f
title: 'Windows App Installation Audit'
title_meta: 'Windows App Installation Audit'
keywords: ['windows', 'application', 'windows-app']
description: 'Shows whether Windows App is installed and whether the desktop shortcut exists for Windows workstations with deployment enabled. This dataview uses data collected by the Install Windows App remote monitor.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-17
---

## Summary

Shows whether `Windows App` is installed and whether the desktop shortcut exists for Windows workstations with deployment enabled. This dataview uses data collected by the [Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d6033) remote monitor.

## Dependencies

- [Remote Monitor: Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336)

## Columns

| Column | Description |
| ------ | ----------- |
| ClientId | Client ID (hidden). |
| LocationId | Location ID (hidden). |
| ComputerId | Computer ID (hidden). |
| Client | Name of the client. |
| Location | Name of the location. |
| Computer | Name of the computer. |
| Operating System | Operating system reported for the computer. |
| Logged-In User | User currently logged in to the computer. |
| Windows App Installed | Indicates whether Windows App is installed (`Yes`/`No`). |
| Shortcut Created | Indicates whether the desktop shortcut is correctly configured (`Yes`/`No`). |
| Data Collection Time | Timestamp of the data collection event. |
| Script Result | Output from the most recent script execution. |
| Recent Script Run Time | Most recent time the [Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) script ran on the computer. |
| Offline for more than 7 Days | Indicates whether the computer has been offline for more than 7 days. |
| Offline Since Days | Number of days the computer has been offline in Automate. |

## Changelog

### 2026-03-17

- Initial version of the document
