---
id: 'cwa_win_installer_properties'
title: 'Windows Installer Properties SQL Custom Table'
title_meta: 'Windows Installer Properties SQL Custom Table for CWM Automate'
keywords: ['sql', 'custom', 'table', 'installer', 'properties', 'windows', 'application']
description: 'This document details the "pvl_win_installer_properties" SQL custom table utilized in conjunction with the CWM Automate script for gathering and storing information about Windows Installer applications installed on a machine. It outlines the table structure, including columns for application details such as name, version, publisher, and installation paths.'
tags: ['database', 'installation', 'software', 'windows']
draft: false
unlisted: false
---
## Purpose

The "pvl_win_installer_properties" is an SQL custom table that is used in conjunction with the [CWM - Automate - Script - Windows Installer Properties [DV]](https://proval.itglue.com/DOC-5078775-12404266) script and the "Windows Installer Properties [Script]" dataview. The purpose of this table is to store the gathered information about the properties of the Windows Installer applications installed on a machine. Stores the data fetched by [CWM - Automate - Script - Windows Installer Properties [DV]](https://proval.itglue.com/DOC-5078775-12404266) script.

## Dependencies

[CWM - Automate - Script - Windows Installer Properties [DV]](https://proval.itglue.com/DOC-5078775-12404266)

## Tables

#### pvl_win_installer_properties

| Column           | Type         | Explanation                                         |
|------------------|--------------|-----------------------------------------------------|
| computerid       | int(16)     | computerid                                         |
| Name             | varchar(128) | Display Name of the Application                      |
| Version          | varchar(32)  | Display Version of the Application                   |
| Publisher        | varchar(128) | Application's publisher                              |
| InstallDate      | varchar(10)  | Install Date of the application in numerics         |
| URLInfoAbout     | varchar(256) | URL of the information related to the application    |
| URLUpdateInfo    | varchar(256) | URL of the information related to the application's updates |
| InstallSource     | varchar(512) | Path to the installer on local machine              |
| InstallLocation   | varchar(512) | Path to the installed location of the application on local machine |
| ScriptRunTime    | datetime     | Data Collection Time                                |
| SerialNumber     | int          | Auto_Incremental Column to be used as primary key   |

