---
id: 'cwa-windows-update-report-storage'
title: 'Windows Update Report Storage for ConnectWise Automate'
title_meta: 'Windows Update Report Storage for ConnectWise Automate'
keywords: ['connectwise', 'windows', 'update', 'report', 'storage', 'script']
description: 'This document outlines the purpose and dependencies for storing data from the Windows Update Report script in ConnectWise Automate. It includes a detailed table structure for the Plugin_ProVal_Windows_Update_Report, which captures essential information about Windows updates, including size, status, and recommended system requirements.'
tags: ['connectwise', 'windows', 'report', 'update', 'database', 'setup']
draft: false
unlisted: false
---
## Purpose

Stores the data grabbed by [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script in order to feed into the [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701) dataview.

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701)
- [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682)

## Tables

### Plugin_ProVal_Windows_Update_Report

| Column                       | Type           | Explanation                                        |
|------------------------------|----------------|----------------------------------------------------|
| Computerid                   | int(10)        | Computerid                                        |
| Size                         | varchar(15)    | Size of the Patch in MB                           |
| KB                           | varchar(20)    | KBID of the Patch                                 |
| Title                        | varchar(500)   | Title of the Patch                                |
| Description                  | varchar(4096)  | Description of the Patch                          |
| Status                       | Varchar(15)    | Installed | Not Installed                          |
| AutoSelectOnWebSites        | varchar(10)    | True | False                                     |
| CanRequireSource             | varchar(10)    | True | False                                     |
| Deadline                     | varchar(20)    | End Support Date of the Patch                     |
| EulaAccepted                 | varchar(10)    | True | False                                     |
| EulaText                     | varchar(4096)  | End User License Agreement                         |
| HandlerID                    | varchar(1024)  | Handler ID of the Patch                           |
| IsBeta                       | varchar(10)    | True | False                                     |
| IsDownloaded                 | varchar(10)    | True | False                                     |
| IsHidden                     | varchar(10)    | True | False                                     |
| IsInstalled                  | varchar(10)    | True | False                                     |
| IsMandatory                  | varchar(10)    | True | False                                     |
| IsUninstallable              | varchar(10)    | True | False                                     |
| LastDeploymentChangeTime     | varchar(50)    | Last Deployment Change Time of the Patch         |
| MaxDownloadSize              | double         | Maximum Download Size of the patch in MB         |
| RecommendedCpuSpeed          | varchar(20)    | Recommended Cpu Speed                              |
| RecommendedHardDiskSpace     | varchar(20)    | Recommended Hard Disk Space to Install the Patch  |
| RecommendedMemory            | varchar(20)    | Recommended Memory to Install the Patch           |
| ReleaseNotes                 | varchar(4096)  | Release Notes of the Patch                        |
| MsrcSeverity                 | varchar(50)    | Severity of the patch, Important | Critical | etc |
| SupportUrl                   | varchar(1024)  | Support URL for the Patch                         |
| Type                         | varchar(20)    | Windows Update | Driver | Third Party             |
| UninstallNotes               | varchar(4096)  | Uninstall Notes for the Patch                     |
| RebootRequired                | varchar(10)    | True | False                                     |
| IsPresent                    | varchar(10)    | True | False                                     |
| BrowseOnly                   | varchar(10)    | True | False                                     |
| PerUser                      | varchar(10)    | True | False                                     |
| ScriptRunTime                | varchar(50)    | Script Run Time                                   |



