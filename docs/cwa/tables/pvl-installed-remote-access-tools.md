---
id: '122991ce-8d88-448b-a4a2-4bde95ccc149'
slug: /122991ce-8d88-448b-a4a2-4bde95ccc149
title: 'pvl_installed_remote_access_tools'
title_meta: 'pvl_installed_remote_access_tools'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'This document outlines the setup of a table for storing data displayed in the Remote Access Tools Report Dataview, populated by the Audit - GPO Redirection Settings script. It includes details on table structure, dependencies, and SQL commands for table creation.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-05
---

## Purpose

This table will store the data to be displayed in the  [Dataview - Remote Access Tools Report](/docs/ee8f046e-a795-4850-b7f8-a18b4e1f2562). It is populated by the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e)

## Dependencies

- [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e)
- [Solution - Installed Remote Access Tools](/docs/e5150f2e-6b8a-4156-9c1b-513e602b36a1)

## Tables

### pvl_installed_remote_access_tools

| Column                           | Type            | Explanation                                                              |
|----------------------------------|-----------------|--------------------------------------------------------------------------|
| ComputerID                       | int(11)         | ComputerID of the Machine                                                |
| Name                             | VARCHAR(100)    | Name of the Remote Access Tool                                           |
| Installed                        | VARCHAR(50)     | Installation status of the Remote Access Tool                            |
| CurrentlyRunning                 | VARCHAR(50)     | Current running status of the Remote Access Tool                         |
| HasRunningService                | VARCHAR(50)     | Indicates if the Remote Access Tool has a running service                |
| UninstallString                  | VARCHAR(200)    | Uninstall string of the Remote Access Tool                               |
| ExePath                          | VARCHAR(200)    | Executable path of the Remote Access Tool                                |
| ScriptRanDate                    | DATETIME        | Date the script was run for the Remote Access Tool                       |


## Changelog

### 2026-05-05

- Initial version of the document