---
id: '75c18bf0-9ebc-43c7-a5a3-03510d131af5'
slug: /75c18bf0-9ebc-43c7-a5a3-03510d131af5
title: 'plugin_proval_windows10_upgradestats'
title_meta: 'plugin_proval_windows10_upgradestats'
keywords: ['windows', 'update', 'installation', 'success', 'failures', 'statistics']
description: 'This document provides historical data on the success and failure rates of the Windows 10 Feature Update Install Latest script. It includes dependencies, relevant tables, and a detailed explanation of the installation states and statistics related to the update process.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This document contains data regarding the historical success and failure rates of the Windows 10 Feature Update - Install Latest script.

## Dependencies

- [SEC - Windows Patching - Agnostic - Update-Windows10](/docs/7fdd2a3b-2dca-43db-8a1d-f350967f1055)
- [SEC - Windows Patching - Windows 10 Update](/docs/16c09937-d57e-4d56-8367-fb5551d1c386)

## Tables

#### plugin_proval_windows10_upgradestats

| Column            | Type      | Explanation                                                                                     |
|-------------------|-----------|-------------------------------------------------------------------------------------------------|
| ComputerID        | INT       | The computer ID in the system for the target machine (Primary and foreign key cascading)       |
| WindowsVersion     | VarChar   | The currently installed version as seen by the reporting process. (Primary Key)                |
| InstallationDate   | DateTime  | The day and time recorded when the upgrade was run.                                           |
| InstallationState  | TinyInt   | The state of the installation (0 - Not attempted, 1 - Attempted, 2 - Failed, 3 - Successful). |
| Successes          | TinyInt   | The count of successful installations for this version.                                        |
| Failures           | TinyInt   | The count of failed attempts to install this version.                                          |
| TotalAttempts      | INT       | The total attempts it took to upgrade to this version.                                         |

