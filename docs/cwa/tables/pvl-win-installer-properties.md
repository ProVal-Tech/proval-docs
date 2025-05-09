---
id: '14ac705d-21c7-4320-b958-3ed5281c43d6'
slug: /14ac705d-21c7-4320-b958-3ed5281c43d6
title: 'pvl_win_installer_properties'
title_meta: 'pvl_win_installer_properties'
keywords: ['sql', 'custom', 'table', 'installer', 'properties', 'windows', 'application']
description: 'This document details the "pvl_win_installer_properties" SQL custom table utilized in conjunction with the CWM Automate script for gathering and storing information about Windows Installer applications installed on a machine. It outlines the table structure, including columns for application details such as name, version, publisher, and installation paths.'
tags: ['database', 'installation', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The "pvl_win_installer_properties" is an SQL custom table that is used in conjunction with the [CWM - Automate - Script - Windows Installer Properties [DV]](/docs/d2ceaf24-a522-423a-be42-f0e120ffaba8) script and the "Windows Installer Properties [Script]" dataview. The purpose of this table is to store the gathered information about the properties of the Windows Installer applications installed on a machine. It stores the data fetched by the [CWM - Automate - Script - Windows Installer Properties [DV]](/docs/d2ceaf24-a522-423a-be42-f0e120ffaba8) script.

## Dependencies

- [CWM - Automate - Script - Windows Installer Properties [DV]](/docs/d2ceaf24-a522-423a-be42-f0e120ffaba8)

## Tables

#### pvl_win_installer_properties

| Column           | Type         | Explanation                                         |
|------------------|--------------|-----------------------------------------------------|
| computerid       | int(16)     | Computer ID                                         |
| Name             | varchar(128) | Display Name of the Application                      |
| Version          | varchar(32)  | Display Version of the Application                   |
| Publisher        | varchar(128) | Application's Publisher                              |
| InstallDate      | varchar(10)  | Install Date of the application in numerics         |
| URLInfoAbout     | varchar(256) | URL of the information related to the application    |
| URLUpdateInfo    | varchar(256) | URL of the information related to the application's updates |
| InstallSource    | varchar(512) | Path to the installer on the local machine          |
| InstallLocation  | varchar(512) | Path to the installed location of the application on the local machine |
| ScriptRunTime    | datetime     | Data Collection Time                                |
| SerialNumber     | int          | Auto-incremental column to be used as primary key   |
