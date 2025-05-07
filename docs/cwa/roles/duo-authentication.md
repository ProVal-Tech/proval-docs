---
id: '36502446-c8d2-4f73-bb3d-e482fce915b2'
slug: /36502446-c8d2-4f73-bb3d-e482fce915b2
title: 'Duo Authentication'
title_meta: 'Duo Authentication'
keywords: ['duo', 'authentication', 'agent', 'detection', 'windows', 'mac']
description: 'This document provides a summary and settings for detecting the installation of the Duo Authentication app on various operating systems, including Windows and Mac. It includes a detection string and applicable settings for monitoring the presence of the application.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This role denotes that the agent has the Duo Authentication app installed.

## Settings

| Detection String | Comparator | Result | Applicable OS           |
|------------------|------------|--------|-------------------------|
|                  | Contains   |        | All OS's, Windows, Mac, etc. |

| Detection String                                                                                   |
|----------------------------------------------------------------------------------------------------|
| \{%@powershell.exe "Get-ItemProperty HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall/* | Select-Object DisplayName | Format-Table -autosize" | Find /i "Duo Authentication"@%} |


