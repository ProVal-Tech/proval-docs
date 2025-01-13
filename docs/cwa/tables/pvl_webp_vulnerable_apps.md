---
id: 'cwa_custom_table_webp_vulnerability_report'
title: 'Custom Table for WebP Vulnerability Report'
title_meta: 'Custom Table for WebP Vulnerability Report'
keywords: ['custom', 'table', 'webp', 'vulnerability', 'report', 'data', 'endpoint']
description: 'This document outlines the purpose and structure of a custom table designed to store data fetched by the WebP Vulnerability Report script. It includes details on dependencies and the schema of the table for managing vulnerable applications.'
tags: ['database', 'security', 'report', 'windows', 'installation']
draft: false
unlisted: false
---
## Purpose

The custom table serves as a container for the data fetched by the [WebP Vulnerability Report](https://proval.itglue.com/DOC-5078775-14166219) script.

## Dependencies

- [EPM - Security - Script - WebP Vulnerability Report](https://proval.itglue.com/DOC-5078775-14166219)
- [EPM - Security - Internal Monitor - Execute Script - WebP Vulnerability Report](https://proval.itglue.com/DOC-5078775-14166231)

## Tables

#### pvl_webp_vulnerable_apps

| Column                       | Type        | Explanation                                                                                     |
|------------------------------|-------------|-------------------------------------------------------------------------------------------------|
| computerid                   | int(10)    | Computerid of the endpoint                                                                      |
| installedappname             | varchar(128)| Full Name of the application installed on the endpoint                                          |
| installedappversion          | varchar(32) | Installed Version of the correspondence application                                             |
| electronappname              | varchar(128)| Application Name fetched from the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file |
| electronversion               | varchar(32) | Electron_Version available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the correspondence application |
| access_type                  | varchar(16) | Access_Type available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the correspondence application |
| date_accessed                | varchar(32) | Date_Accessed available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the correspondence application |
| vulnerable_cve_2023_4863     | varchar(32) | Vulnerable_CVE_2023_4863 status available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the correspondence application |
| vulnerable_cve_2023_5217     | varchar(32) | Vulnerable_CVE_2023_5217 status available in the [JSON](https://raw.githubusercontent.com/mttaggart/electron-app-tracker/main/electron_apps.json) file for the correspondence application |
| datetime                     | datetime    | Data Collection Time from the endpoint                                                          |



