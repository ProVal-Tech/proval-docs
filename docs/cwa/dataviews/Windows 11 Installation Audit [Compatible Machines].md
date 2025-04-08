---
id: 'a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce'
title: 'Windows 11 Installation Audit [Compatible Machines]'
title_meta: 'Windows 11 Installation Audit [Compatible Machines]'
keywords: ['windows', 'readiness', 'report', 'compatibility', 'upgrade']
description: 'Displays the status of compatible Windows 10 computers upgraded by the Windows 11 Installer script'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Summary

Displays the status of compatible Windows 10 computers upgraded by the [Install Windows 11 - Compatible Machines](<../monitors/Install Windows 11 - Compatible Machines.md>) monitor and [Windows 11 installer](../scripts/Windows%20_11_Installer.md) script.

## Dependencies

[Install Windows 11 - Compatible Machines](<../monitors/Install Windows 11 - Compatible Machines.md>)  
[Solution : Windows 11 Installation](../../solutions/Windows%2011%20Installation.md)  
[Solution - Windows 11 Compatibility Audit ](<../../solutions/Windows 11 Compatibility Audit.md>)

## Columns

| Column                     | Description                                      |
|----------------------------|--------------------------------------------------|
| clientid                   | clientid (Hidden)                                |
| locationid                 | locationid (Hidden)                              |
| computerid                 | computerid                                       |
| Client                     | Client Name                                      |
| Location                   | Location Name                                    |
| Computer                   | Computer Name                                    |
| Operating System           | Operating System                                 |
| Last Contact               | Last Contact time with Automate                 |
| Last LoggedIn User         | Last LoggedIn User on the computer              |
| Minutes Since Last Contact | Minutes Since it last contacted with Automate   |
| Form Factor                | Computer type (Physical Server/Virtual Server/Laptop/Desktop) |
| Status                     | Status/Outcome of upgrade attempt               |
| Attempts                   | Number of attempts                               |
| Latest Run                 | Most recent run time of the script              |
