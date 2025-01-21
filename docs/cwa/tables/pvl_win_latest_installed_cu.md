---
id: 'c03e4def-7efe-4a8b-99e9-d99ac2c65f5a'
title: 'pvl_win_latest_installed_cu'
title_meta: 'pvl_win_latest_installed_cu'
keywords: ['cumulative', 'update', 'data', 'installed', 'script']
description: 'This document outlines the purpose and structure of the database table used to store data fetched by the CWM - Automate script that retrieves the latest installed cumulative update on computers. It includes dependencies and details about the table columns.'
tags: ['database', 'installation', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores the data fetched by the [CWM - Automate - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script.

## Dependencies

[CWM - Automate - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)

## Tables

#### pvl_win_latest_installed_cu

| Column         | Type        | Explanation                                       |
|----------------|-------------|---------------------------------------------------|
| computerid     | int(11)    | Computer ID                                       |
| CU             | varchar(128)| Name of the latest installed Cumulative Update    |
| OSBuild        | varchar(128)| Full OS Build Number                              |
| ScriptRunTime  | datetime    | Last run time of the script                       |
| KBid           | varchar(128)| KBID of the latest installed Cumulative Update    |
| ReleaseDate    | date        | Release date of the latest installed Cumulative Update |





