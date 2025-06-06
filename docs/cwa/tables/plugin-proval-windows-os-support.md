---
id: '938cd822-f6a3-4ee3-add2-62b407e45622'
slug: /938cd822-f6a3-4ee3-add2-62b407e45622
title: 'plugin_proval_windows_os_support'
title_meta: 'plugin_proval_windows_os_support'
keywords: ['windows', 'support', 'end', 'dates', 'build', 'version']
description: 'This document provides a detailed table of Windows operating systems, including their support end dates, build numbers, and release information. It serves as a reference for users looking to understand the lifecycle of various Windows versions and how to manage updates and support effectively.'
tags: ['database', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This table is a manually updated resource that displays Windows operating systems' support end dates, build numbers, and their respective release information.

References:
- [Microsoft Windows | endoflife.date](https://endoflife.date/windows)
- [Windows 10 version history - Wikipedia](https://en.wikipedia.org/wiki/Windows_10_version_history)
- [Windows 11 version history - Wikipedia](https://en.wikipedia.org/wiki/Windows_11_version_history)
- [Microsoft Windows Server | endoflife.date](https://endoflife.date/windows-server)

## Dependencies

[CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)

## Table

#### plugin_proval_windows_os_support

| Column                     | Type    | Explanation                                                                 |
|---------------------------|---------|-----------------------------------------------------------------------------|
| BaseOS                    | varchar | The name of the operating system                                            |
| ReleaseID                 | varchar | The Windows 10 Build number/name associated with the Build column          |
| Build                     | varchar | The version of Windows associated with the ReleaseID column                |
| ReleaseDate               | date    | The date the version was released                                          |
| SupportMainstreamEnd      | date    | The date the version will no longer be supported for Mainstream devices    |
| SupportEnterpriseEnd       | date    | The date the version will no longer be supported for Enterprise devices     |
| SupportLTSBEnd           | date    | The date the version will no longer be supported for LTSB devices.         |

## FAQ

**Q:** I need to add more versions to this list. How do I do that?  
**A:** Open the [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) script and modify line 1 to add the new item.

## For CW RMM

Needs Revision