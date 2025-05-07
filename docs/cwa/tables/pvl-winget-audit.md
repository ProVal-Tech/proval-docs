---
id: '904989a6-fe21-4e40-adb6-17d1168c830e'
slug: /904989a6-fe21-4e40-adb6-17d1168c830e
title: 'pvl_winget_audit'
title_meta: 'pvl_winget_audit'
keywords: ['audit', 'data', 'storage', 'winget', 'application']
description: 'This document outlines the purpose and structure for storing audit data retrieved by the Winget App Audit script. It includes details about the dependencies, the specific database table used for storage, and descriptions of each column in the table.'
tags: ['database', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores the audit data fetched by the [Winget App Audit](/docs/d5ea54f9-07c9-443b-acc2-411401cfbe91) script.

## Dependencies

[SWM - Software Update - Script - Winget App Audit](/docs/d5ea54f9-07c9-443b-acc2-411401cfbe91)

## Tables

### pvl_winget_audit

| Column               | Type      | Explanation                                                                                     |
|----------------------|-----------|-------------------------------------------------------------------------------------------------|
| computerid           | int       | Computer ID of the computer.                                                                    |
| displayName          | varchar   | Display name of the application.                                                                 |
| packageId            | varchar   | Package ID of the application.                                                                   |
| InstalledVersion      | varchar   | Installed version of the application.                                                           |
| AvailableVersion      | varchar   | Latest available version of the application, if any.                                            |
| Source               | varchar   | Source of the application (Winget/Msstore).                                                    |
| UptoDate            | tinytext  | Is the application up to date? (0/1)                                                            |
| Level                | varchar   | Installation level of the application (System/User).                                            |
| AutoUpdateEnabled      | tinytext  | Is Auto Update enabled for the application? (0/1). Refer to the [Configure Winget Auto Update](/docs/1e0c72c6-b9aa-454a-8643-ac7c7e1e7d55) script's document for detailed instructions on enabling Auto Update. |
| DataCollectionTime    | datetime  | Data collection time.                                                                            |

