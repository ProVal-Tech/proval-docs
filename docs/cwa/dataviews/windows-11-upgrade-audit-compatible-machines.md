---
id: 'a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce'
slug: /a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce
title: 'Windows 11 Upgrade Audit [Compatible Machines]'
title_meta: 'Windows 11 Upgrade Audit [Compatible Machines]'
keywords: ['windows', 'readiness', 'report', 'compatibility', 'upgrade']
description: 'Displays the status of compatible Windows 10 computers upgraded by the Windows 11 Installer script'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-09
---

## Summary

Displays the status of compatible Windows 10 and 11 computers upgraded by the [Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad) monitor and [Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad) script, or the [Install Windows 11 Latest Feature Update - Compatible Machines](/docs/0a6c0ea2-f1d1-4e29-bcc5-954341d10baa) monitor and [Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec) script. It also tracks upgrades performed manually using the [Install Windows 11 Feature Update [Troubleshoot, Reboot]](/docs/27f8240b-603a-4af2-b9d9-480a560f8747) script.

## Dependencies

- [Custom Table: plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
- [Script: Windows 11 Installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)
- [Script: Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec)
- [Script: Install Windows 11 Feature Update [Troubleshoot, Reboot]](/docs/27f8240b-603a-4af2-b9d9-480a560f8747)
- [Solution : Windows 11 Installation and Feature Update](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)
- [Solution - Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)

## Columns

| Column                     | Description                                      |
|----------------------------|--------------------------------------------------|
| clientid                   | clientid (Hidden)                                |
| locationid                 | locationid (Hidden)                              |
| ComputerId                 | ComputerId                                       |
| Client                     | Client Name                                      |
| Location                   | Location Name                                    |
| Computer                   | Computer Name                                    |
| Operating System           | Operating System                                 |
| Last Contact               | Last Contact time with Automate                 |
| Last LoggedIn User         | Last LoggedIn User on the computer              |
| Form Factor                | Computer type (Physical Server/Virtual Server/Laptop/Desktop) |
| Current OS Version         | Current OS Version of the machine               |
| OS Version Before Script Run | OS Version of the machine before the upgrade script was executed |
| Upgrade Script Executed      |  Name of the upgrade script executed on the machine |
| Upgrade Script RunTime       | Most recent run time of the upgrade script |
| Upgrade Attempts             | Number of attempts                              |
| Upgrade Status               | Status/Outcome of upgrade attempt               |

## Format Control

| Column | Comparator | Value | Colour |
| ------ | ---------- | ----- | ------ |
| Upgrade Status     | Equals     | Failure   | Red    |
| Upgrade Status     | Equals     | Success    | Green  |
| Upgrade Status     | Equals     | Already UpToDate    | Green  |
| Upgrade Status     | Equals     | Not Attempted    | Orange  |

## Changelog

### 2026-03-09

- Renamed the dataview to `Windows 11 Upgrade Audit [Compatible Machines]` From `Windows 11 Installation Audit [Compatible Machines]`.
- Added new columns for better reporting on both `Windows 11 24H2 Installation` and `Windows 11 Latest Feature Update`.
- Added Format Control.

### 2025-04-10

- Initial version of the document
