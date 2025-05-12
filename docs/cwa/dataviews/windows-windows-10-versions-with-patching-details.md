---
id: 'd49af856-de88-46fc-963a-8c7bc0e129ff'
slug: /d49af856-de88-46fc-963a-8c7bc0e129ff
title: 'Windows - Windows 10 Versions With Patching Details'
title_meta: 'Windows - Windows 10 Versions With Patching Details'
keywords: ['windows', 'machines', 'versions', 'patching', 'information']
description: 'This document provides a comprehensive dataview of all Windows 10 machines, detailing their versions, patching information, and setup. It includes various columns that represent critical data points such as OS version, client ID, and reboot policies.'
tags: ['patching', 'reboot', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows all Windows 10 machines alongside their versions, patching information, and setup.

## Dependencies

None

## Columns

| Column          | Description                                               |
|-----------------|-----------------------------------------------------------|
| Client Name     | Client Name                                              |
| Machine Name    | Machine Name                                             |
| OS              | OS installed on the machine                              |
| OS Version      | The major OS version number                              |
| Client ID       | Client ID in Automate                                    |
| Computer ID     | Computer ID in Automate                                  |
| Location ID     | Location ID in Automate                                  |
| Release ID      | The easy-read format of the version name                |
| Install Policy  | Shows the Microsoft Patch Install Policy set on the machine |
| Reboot Policy    | Shows the reboot policy set on the machine               |
| WUA Version     | Shows the full Windows Update Agent (WUA) install on the machine |
| Reboot Pending   | Indicates if a reboot is pending                         |
| Last Contact     | Last time the machine checked into Automate              |
| Uptime          | Time in seconds since the machine has restarted the kernel |