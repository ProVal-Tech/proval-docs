---
id: 'e7d25f05-6d80-4baa-94b8-517f81abc4a5'
title: 'Folder Redirection Audit'
title_meta: 'Folder Redirection Audit'
keywords: ['folder', 'redirection', 'audit', 'data', 'endpoint', 'backup']
description: 'This document provides an overview of the Folder Redirection Audit, detailing the information displayed related to folder redirection on endpoints, including dependencies, columns, and their descriptions.'
tags: ['backup', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will display basic information related to folder redirection on endpoints.

## Dependencies

- Script: `@Folder Redirection Audit`
- Custom Table: `@plugin_proval_folderredirection`

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Client                    | The name of the client associated with the machine                                            |
| Location                  | The name of the location associated with the machine                                          |
| Computer                  | The name of the machine related to the data                                                  |
| Username                  | The name of the user associated with the OneDrive backup                                     |
| DesktopEnabled            | True/False - Indicates if the user's "Desktop" folder is being redirected                   |
| Desktop Redirected Path    | If DesktopEnabled is True, this will display the full path to the user's desktop folder      |
| DocumentsEnabled          | True/False - Indicates if the user's "Documents" folder is being redirected                 |
| Documents Redirected Path  | If DocumentsEnabled is True, this will display the full path to the user's documents folder  |
| PicturesEnabled           | True/False - Indicates if the user's "Pictures" folder is being redirected                  |
| Pictures Redirected Path   | If PicturesEnabled is True, this will display the full path to the user's pictures folder    |
| TimeStamp                 | The last time this data was gathered                                                          |



