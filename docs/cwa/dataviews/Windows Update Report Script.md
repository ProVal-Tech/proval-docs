---
id: '88f63da5-1a24-4545-b322-f6a3dfbc79cf'
title: 'Windows Update Report Dataview'
title_meta: 'Windows Update Report Dataview'
keywords: ['patches', 'windows', 'report', 'dataview', 'update', 'installed', 'available']
description: 'This document provides a detailed overview of the Windows Update Report Dataview, including its dependencies, columns, and descriptions of each column. It is essential for displaying a list of patches installed or available on local machines, populated by specific scripts and solutions.'
tags: ['report', 'software', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview was required to display a detailed list of patches that are installed or available on the local machine. The data is being populated by the [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>) script.

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](<../../powershell/Get-WindowsUpdateReport.md>)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](<../tables/plugin_proval_windows_update_report.md>)

## Columns

| Column                          | Description                                           |
|---------------------------------|-------------------------------------------------------|
| Client Name                     | Client Name                                          |
| Location Name                   | Location Name                                        |
| Computer Name                   | Computer Name                                        |
| Operating System                | Operating System                                     |
| OS Type                         | OS Type (Server|Workstation)                        |
| Last Contact                    | Last Contact with RMM                                |
| Days Since Last Contact         | Days Since Last Contact with RMM                     |
| KB                              | KBID of the Patch                                    |
| Title                           | Title of the Patch                                   |
| Description                     | Description of the Patch                             |
| Size                            | Size of the Patch in MB                              |
| Type                            | Type of the Patch (Windows Update | Driver | Third Party) |
| Is Beta                         | Is Beta? (True | False)                             |
| Is Installed                    | Is Installed? (True | False)                        |
| Is Mandatory                    | Is Mandatory? (True | False)                        |
| Is Reboot Required              | Is Reboot Required? (True | False)                  |
| Is Uninstallable                | Is Uninstallable? (True | False)                    |
| Is Downloaded                   | Is Downloaded? (True | False)                       |
| Is Hidden                       | Is Hidden? (True | False)                           |
| Severity                        | Severity of the Patch                                |
| Last Deployment Change Time     | Last Deployment Change Time for the Patch           |
| Support URL                     | Support URL for the Patch                            |
| Auto Select On WebSites         | Auto Select On WebSites? (True | False)             |
| Can require Source              | Can require Source to install? (True | False)       |
| Is Eula Accepted                | Is Eula Accepted? (True | False)                    |
| Is Present                      | Is Present on the Machine? (True | False)           |
| Is Browse Only                  | Is Browse Only? (True | False)                      |
| Is Per User                     | Is Per User? (True | False)                         |
| Dead Line                       | Dead Line to install the Patch/Support End Date for the Patch |
| Recommended CPU Speed           | Recommended CPU Speed to install the Patch          |
| Recommended Hard Disk Space     | Recommended Hard Disk Space to Install the Patch    |
| Recommended Memory              | Recommended Memory to Install the Patch              |

Note: Any of the aforementioned columns can be added from the Field Chooser if they are not already present in the Dataview.













