---
id: '904989a6-fe21-4e40-adb6-17d1168c830e'
title: 'Winget App Audit Data Storage'
title_meta: 'Winget App Audit Data Storage'
keywords: ['audit', 'data', 'storage', 'winget', 'application']
description: 'This document outlines the purpose and structure for storing audit data retrieved by the Winget App Audit script. It includes details about the dependencies, the specific database table used for storage, and descriptions of each column in the table.'
tags: ['database', 'setup', 'software', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores the audit data fetched by the [Winget App Audit](https://proval.itglue.com/DOC-5078775-17973895) script.  

## Dependencies

[SWM - Software Update - Script - Winget App Audit](https://proval.itglue.com/DOC-5078775-17973895)  

## Tables

#### pvl_winget_audit

| Column             | Type      | Explanation                                                                                     |
|--------------------|-----------|-------------------------------------------------------------------------------------------------|
| computerid         | int       | Computerid of the computer.                                                                     |
| displayName        | varchar   | DisplayName of the application.                                                                  |
| packageId          | varchar   | PackageId of the application.                                                                    |
| InstalledVersion    | varchar   | Installed version of the application.                                                            |
| AvailableVersion    | varchar   | Latest available version of the application if any.                                             |
| Source             | varchar   | Source of the application (Winget/Msstore).                                                    |
| UptoDate          | tinytext  | Is the application uptodate?(0/1)                                                               |
| Level              | varchar   | Installation level of the application (System/User).                                            |
| AutoUpdateEnabled   | tinytext  | Is the Auto Update Enabled for the application?(0/1). Refer to the [Configure Winget Auto Update](https://proval.itglue.com/DOC-5078775-17973896) script's document for detailed instructions on enabling Auto update. |
| DataCollectionTime  | datetime  | Data Collection Time.                                                                            |







