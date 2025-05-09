---
id: '8c1f89c7-4858-412a-8845-9b063981f3c5'
slug: /8c1f89c7-4858-412a-8845-9b063981f3c5
title: 'Windows Update History Audit'
title_meta: 'Windows Update History Audit'
keywords: ['windows', 'update', 'audit', 'history', 'endpoint']
description: 'This document outlines the purpose and implementation of the Windows Update History Audit script, which gathers and presents data about installed Windows Updates on endpoints. It also includes associated content that enhances the functionality of the script.'
tags: ['data-collection', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to gather and present data about Windows Updates that have been installed on an endpoint.

## Associated Content

| Content                                                                                              | Type          | Function                                                                                                         |
|------------------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1)     | Agnostic      | Gathers the Windows Update data that the CWA script manipulates.                                               |
| [EPM - Script - Windows Update History Audit](/docs/d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6)     | Script        | Calls [Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1) and manipulates the data for insertion into [pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301). |
| [EPM - Custom Table - pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301)                | Custom Table  | Stores information about Windows Update history for agents.                                                     |
| [EPM - Dataview - Windows Update History](/docs/ecf832e3-2985-4079-971c-436f1c836e53)| Dataview      | Displays information about Windows Update history for agents.                                                  |
| [EPM - Internal Monitor - Patches Not Installing > X Days](/docs/663a6cf8-f3da-4a44-9725-73aae8d4d954) | Internal Monitor | Monitors that uses the [pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301) table for referencing installed updates. |

## Implementation

The script [Windows Update History Audit](/docs/d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6) should be scheduled against all compliant Windows endpoints on a weekly basis.

If required, implement the [Patches Not Installing > X Days](/docs/663a6cf8-f3da-4a44-9725-73aae8d4d954) monitor following the instructions in the documentation.