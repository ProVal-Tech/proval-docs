---
id: '845fe569-12ec-48e3-86f4-34377aba03ec'
slug: /845fe569-12ec-48e3-86f4-34377aba03ec
title: 'plugin_proval_windows_update_report'
title_meta: 'plugin_proval_windows_update_report'
keywords: ['connectwise', 'windows', 'update', 'report', 'storage', 'script']
description: 'This document outlines the purpose and dependencies for storing data from the Windows Update Report script in ConnectWise Automate. It includes a detailed table structure for the Plugin_ProVal_Windows_Update_Report, which captures essential information about Windows updates, including size, status, and recommended system requirements.'
tags: ['connectwise', 'database', 'report', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores the data captured by the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script to feed into the [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf) dataview.

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1)
- [CWM - Automate - Solution - Windows Update Report](/docs/affc0b47-f0fe-43f9-95f6-0e0d1205b4d6)
- [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf)
- [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f)

## Tables

### Plugin_ProVal_Windows_Update_Report

| Column                       | Type           | Explanation                                        |
|------------------------------|----------------|----------------------------------------------------|
| Computerid                   | int(10)        | Computer ID                                       |
| Size                         | varchar(15)    | Size of the patch in MB                           |
| KB                           | varchar(20)    | KBID of the patch                                 |
| Title                        | varchar(500)   | Title of the patch                                |
| Description                  | varchar(4096)  | Description of the patch                          |
| Status                       | varchar(15)    | Installed | Not Installed                          |
| AutoSelectOnWebSites        | varchar(10)    | True | False                                     |
| CanRequireSource             | varchar(10)    | True | False                                     |
| Deadline                     | varchar(20)    | End support date of the patch                     |
| EulaAccepted                 | varchar(10)    | True | False                                     |
| EulaText                     | varchar(4096)  | End User License Agreement                         |
| HandlerID                    | varchar(1024)  | Handler ID of the patch                           |
| IsBeta                       | varchar(10)    | True | False                                     |
| IsDownloaded                 | varchar(10)    | True | False                                     |
| IsHidden                     | varchar(10)    | True | False                                     |
| IsInstalled                  | varchar(10)    | True | False                                     |
| IsMandatory                  | varchar(10)    | True | False                                     |
| IsUninstallable              | varchar(10)    | True | False                                     |
| LastDeploymentChangeTime     | varchar(50)    | Last deployment change time of the patch         |
| MaxDownloadSize              | double         | Maximum download size of the patch in MB         |
| RecommendedCpuSpeed          | varchar(20)    | Recommended CPU speed                              |
| RecommendedHardDiskSpace     | varchar(20)    | Recommended hard disk space to install the patch  |
| RecommendedMemory            | varchar(20)    | Recommended memory to install the patch           |
| ReleaseNotes                 | varchar(4096)  | Release notes of the patch                        |
| MsrcSeverity                 | varchar(50)    | Severity of the patch: Important | Critical | etc |
| SupportUrl                   | varchar(1024)  | Support URL for the patch                         |
| Type                         | varchar(20)    | Windows Update | Driver | Third Party             |
| UninstallNotes               | varchar(4096)  | Uninstall notes for the patch                     |
| RebootRequired                | varchar(10)    | True | False                                     |
| IsPresent                    | varchar(10)    | True | False                                     |
| BrowseOnly                   | varchar(10)    | True | False                                     |
| PerUser                      | varchar(10)    | True | False                                     |
| ScriptRunTime                | varchar(50)    | Script run time                                   |