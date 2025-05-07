---
id: 'b11f38e6-4a69-4f26-9317-46c30f531640'
slug: /b11f38e6-4a69-4f26-9317-46c30f531640
title: 'OneDrive - Backup Status'
title_meta: 'OneDrive - Backup Status'
keywords: ['onedrive', 'backup', 'status', 'dataview', 'endpoint']
description: 'This document provides a detailed overview of a dataview that displays essential information related to OneDrive backups on endpoints, including dependencies, columns, and their descriptions.'
tags: ['backup', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays basic information related to OneDrive on endpoints.

## Dependencies

- Script: `@OneDrive - Backup Status`
- Custom Table: `@plugin_proval_onedrivebackupstatus`

## Columns

| Column            | Description                                                                                          |
|-------------------|------------------------------------------------------------------------------------------------------|
| Client            | The name of the client associated with the machine                                                  |
| Location          | The name of the location associated with the machine                                                |
| Computer          | The name of the machine related to the data                                                         |
| Username          | The name of the user associated with the OneDrive backup                                            |
| DesktopEnabled     | True/False - Indicates if the user's "Desktop" folder is being backed up to OneDrive               |
| DesktopPath       | If DesktopEnabled is True, this displays the full path to the user's desktop folder                 |
| DocumentsEnabled   | True/False - Indicates if the user's "Documents" folder is being backed up to OneDrive             |
| DocumentsPath     | If DocumentsEnabled is True, this displays the full path to the user's documents folder             |
| PicturesEnabled    | True/False - Indicates if the user's "Pictures" folder is being backed up to OneDrive              |
| PicturesPath      | If PicturesEnabled is True, this displays the full path to the user's pictures folder               |
| TimeStamp         | The last time this data was gathered                                                                  |

