---
id: '845fe569-12ec-48e3-86f4-34377aba03ec'
title: 'Windows Update Report Storage for ConnectWise Automate'
title_meta: 'Windows Update Report Storage for ConnectWise Automate'
keywords: ['connectwise', 'windows', 'update', 'report', 'storage', 'script']
description: 'This document outlines the purpose and dependencies for storing data from the Windows Update Report script in ConnectWise Automate. It includes a detailed table structure for the Plugin_ProVal_Windows_Update_Report, which captures essential information about Windows updates, including size, status, and recommended system requirements.'
tags: ['connectwise', 'database', 'report', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores the data captured by the [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>) script to feed into the [CWM - Automate - Dataview - Windows Update Report [Script]](<../dataviews/Windows Update Report Script.md>) dataview.

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](<../../powershell/Get-WindowsUpdateReport.md>)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Dataview - Windows Update Report [Script]](<../dataviews/Windows Update Report Script.md>)
- [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>)

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
