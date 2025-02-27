---
id: '8701c002-7541-4e59-bf39-3aa2ad8d1bd5'
title: 'pvl_webp_vulnerable_apps'
title_meta: 'pvl_webp_vulnerable_apps'
keywords: ['custom', 'table', 'webp', 'vulnerability', 'report', 'data', 'endpoint']
description: 'This document outlines the purpose and structure of a custom table designed to store data fetched by the WebP Vulnerability Report script. It includes details on dependencies and the schema of the table for managing vulnerable applications.'
tags: ['database', 'installation', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The custom table serves as a container for the data fetched by the [WebP Vulnerability Report](<../scripts/WebP Vulnerability Report.md>) script.

## Dependencies

- [EPM - Security - Script - WebP Vulnerability Report](<../scripts/WebP Vulnerability Report.md>)
- [EPM - Security - Internal Monitor - Execute Script - WebP Vulnerability Report](<../monitors/Execute Script - WebP Vulnerability Report.md>)

## Tables

#### pvl_webp_vulnerable_apps

| Column                       | Type        | Explanation                                                                                     |
|------------------------------|-------------|-------------------------------------------------------------------------------------------------|
| computerid                   | int(10)    | Computer ID of the endpoint                                                                      |
| installedappname             | varchar(128)| Full name of the application installed on the endpoint                                          |
| installedappversion          | varchar(32) | Installed version of the corresponding application                                             |
| electronappname              | varchar(128)| Application name fetched from the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file |
| electronversion               | varchar(32) | Electron version available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the corresponding application |
| access_type                  | varchar(16) | Access type available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the corresponding application |
| date_accessed                | varchar(32) | Date accessed available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the corresponding application |
| vulnerable_cve_2023_4863     | varchar(32) | Vulnerable CVE 2023-4863 status available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the corresponding application |
| vulnerable_cve_2023_5217     | varchar(32) | Vulnerable CVE 2023-5217 status available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the corresponding application |
| datetime                     | datetime    | Data collection time from the endpoint                                                          |




