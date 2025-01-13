---
id: 'cwa-store-latest-installed-cu'
title: 'Store Latest Installed Cumulative Update Data'
title_meta: 'Store Latest Installed Cumulative Update Data'
keywords: ['cumulative', 'update', 'data', 'installed', 'script']
description: 'This document outlines the purpose and structure of the database table used to store data fetched by the CWM - Automate script that retrieves the latest installed cumulative update on computers. It includes dependencies and details about the table columns.'
tags: ['database', 'update', 'windows', 'script', 'installation']
draft: false
unlisted: false
---
## Purpose

Stores the data fetched by the [CWM - Automate - Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script.

## Dependencies

[CWM - Automate - Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)

## Tables

#### pvl_win_latest_installed_cu

| Column         | Type        | Explanation                                       |
|----------------|-------------|---------------------------------------------------|
| computerid     | int(11)    | Computerid                                        |
| CU             | varchar(128)| Name of the latest installed Cumulative Update    |
| OSBuild        | varchar(128)| Full OS Build Number                              |
| ScriptRunTime  | datetime    | Last run time of the script                       |
| KBid           | varchar(128)| KBID of the latest installed Cumulative Update    |
| ReleaseDate    | Date        | Release date of the latest installed Cumulative Update |


