---
id: '399a36e3-da83-4437-914b-71e9b844c0d2'
title: 'Winget App Audit'
title_meta: 'Winget App Audit'
keywords: ['winget', 'audit', 'applications', 'software', 'update']
description: 'This document provides a summary of the Winget App Audit script, detailing the information displayed for applications supported by Winget. It includes dependencies, explanations of key columns, and insights into application management and updates.'
tags: ['report', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays the information of `Winget` supported applications fetched by the [Winget App Audit](<../scripts/Winget App Audit.md>) script.

## Dependencies

- [SWM - Software Update - Script - Winget App Audit](<../scripts/Winget App Audit.md>)
- [SWM - Software Update - Custom Table - pvl_winget_audit](<../tables/pvl_winget_audit.md>)

## Columns

| Column                     | Explanation                                                                                               |
|---------------------------|-----------------------------------------------------------------------------------------------------------|
| clientid                  | Client ID (Hidden)                                                                                       |
| locationid                | Location ID (Hidden)                                                                                     |
| computerid                | Computer ID (Hidden)                                                                                     |
| Client                    | Client Name                                                                                              |
| Location                  | Location Name                                                                                            |
| Computer                  | Computer Name                                                                                            |
| Operating System          | Operating System                                                                                         |
| Last Contact              | Last Contact with RMM                                                                                    |
| Last Logged In User       | Last Logged In User                                                                                      |
| Form Factor               | Form Factor (Laptop/Desktop/Virtual Server/Physical Server/Hyper-V Host)                                 |
| Display Name              | Display Name of the application.                                                                          |
| Package ID                | Package ID of the application.                                                                            |
| Installed Version         | Installed version of the application.                                                                    |
| Available Version         | Latest available version of the application, if any.                                                     |
| Source                    | Source of the application (Winget/Msstore).                                                             |
| Is Updated                | Is the application up to date? (0/1)                                                                     |
| App Level                 | Installation level of the application (System/User).                                                    |
| Auto Update Enabled       | Is Auto Update enabled for the application? (0/1). Refer to the [Configure Winget Auto Update](<../scripts/Configure Winget Auto Update.md>) document for detailed instructions on enabling Auto Update. |
| Data Collection Time      | Data Collection Time.                                                                                    |





