---
id: 'e8a689d5-5075-416d-a38c-c0bb09487825'
slug: /e8a689d5-5075-416d-a38c-c0bb09487825
title: 'plugin_proval_onedrivebackupstatus'
title_meta: 'plugin_proval_onedrivebackupstatus'
keywords: ['onedrive', 'redirection', 'backup', 'user', 'audit']
description: 'This document provides detailed information about the redirection of Desktop, Documents, and Pictures folders to OneDrive for individual users, including the status of each redirection and relevant audit data.'
tags: ['backup', 'onedrive']
draft: false
unlisted: false
---

## Purpose

This document stores information about the redirection of Desktop, Documents, and Pictures to OneDrive for individual users.

## Dependencies

[OneDrive - Backup Status](/docs/bf26e767-9125-4b51-a950-ec3d3dc32f8b)

## Table

#### plugin_proval_onedrivebackupstatus

| Column           | Type     | Explanation                                         |
|------------------|----------|-----------------------------------------------------|
| ComputerID       | INT      | The computer where the audit was performed.        |
| Username         | VARCHAR  | The audited account's username.                     |
| DesktopEnabled    | TINYINT  | 1 or 0 indicating if Desktop redirection is enabled or disabled. |
| DesktopPath      | VARCHAR  | The path to the Desktop redirection.               |
| DocumentsEnabled   | TINYINT  | 1 or 0 indicating if Documents redirection is enabled or disabled. |
| DocumentsPath    | VARCHAR  | The path to the Documents redirection.             |
| PicturesEnabled    | TINYINT  | 1 or 0 indicating if Pictures redirection is enabled or disabled. |
| PicturesPath     | VARCHAR  | The path to the Pictures redirection.              |
| TimeStamp        | DATETIME | The date and time of the audit.                    |