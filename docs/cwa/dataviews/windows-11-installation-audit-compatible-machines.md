---
id: 'a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce'
slug: /a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce
title: 'Windows 11 Installation Audit [Compatible Machines]'
title_meta: 'Windows 11 Installation Audit [Compatible Machines]'
keywords: ['windows', 'readiness', 'report', 'compatibility', 'upgrade']
description: 'Displays the status of compatible Windows 10 computers upgraded by the Windows 11 Installer script'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Summary
Displays the status of compatible Windows 10 computers upgraded by the [Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad) monitor and [Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad) script.

## Dependencies
[Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad)   
[Solution : Windows 11 Installation](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)   
[Solution - Windows 11 Compatibility Audit ](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)

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