---
id: 'cwa_onedrive_redirection_info'
title: 'OneDrive Redirection Information'
title_meta: 'OneDrive Redirection Information'
keywords: ['onedrive', 'redirection', 'backup', 'user', 'audit']
description: 'This document provides detailed information about the redirection of Desktop, Documents, and Pictures folders to OneDrive for individual users, including the status of each redirection and relevant audit data.'
tags: ['onedrive', 'backup', 'user', 'audit', 'configuration']
draft: false
unlisted: false
---
## Purpose

Stores information about redirection of Desktop, Documents, and Pictures to OneDrive per user.

## Dependencies

[OneDrive - Backup Status](https://proval.itglue.com/DOC-5078775-8060348)

## Table

#### plugin_proval_onedrivebackupstatus

| Column           | Type     | Explanation                                         |
|------------------|----------|-----------------------------------------------------|
| ComputerID       | INT      | The Computer where the audit was performed.        |
| Username         | VARCHAR  | The audited account's username.                     |
| DesktopEnabled    | TINYINT  | 1 or 0 if Desktop redirection is enabled or disabled. |
| DesktopPath      | VARCHAR  | The path to the Desktop redirection.               |
| DocumentsEnabled   | TINYINT  | 1 or 0 if Documents redirection is enabled or disabled. |
| DocumentsPath    | VARCHAR  | The path to the Documents redirection.             |
| PicturesEnabled    | TINYINT  | 1 or 0 if Pictures redirection is enabled or disabled. |
| PicturesPath     | VARCHAR  | The path to the Pictures redirection.              |
| TimeStamp        | DATETIME | The date and time of the audit.                    |



