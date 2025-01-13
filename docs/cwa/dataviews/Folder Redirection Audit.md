---
id: 'cwa-folder-redirection-audit'
title: 'Folder Redirection Audit'
title_meta: 'Folder Redirection Audit'
keywords: ['folder', 'redirection', 'audit', 'data', 'endpoint', 'backup']
description: 'This document provides an overview of the Folder Redirection Audit, detailing the information displayed related to folder redirection on endpoints, including dependencies, columns, and their descriptions.'
tags: ['configuration', 'backup', 'security', 'windows', 'report']
draft: false
unlisted: false
---
## Summary

This datatview will display basic information related to folder redirection on endpoints.

## Dependencies

- Script: `@Folder Redirection Audit`
- Custom Table: `@plugin_proval_folderredirection`

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Client                    | The name of the client associated with the machine                                            |
| Location                  | The name of the location associated with the machine                                          |
| Computer                  | The name of the machine related to the data                                                  |
| Username                  | The name of the user associated with the onedrive backup                                     |
| DesktopEnabled             | True|False - Will display if the users "Desktop" folder is being redirected                   |
| Desktop Redirected Path   | If DesktopEnabled is True, this will display the full path to the user's desktop folder      |
| DocumentsEnabled          | True|False - Will display if the users "Documents" folder is being redirected                  |
| Documents Redirected Path | If DocumentsEnabled is True, this will display the full path to the user's documents folder  |
| PicturesEnabled           | True|False - Will display if the users "Pictures" folder is being redirected                   |
| Pictures Redirected Path  | If PicturesEnabled is True, this will display the full path to the user's pictures folder    |
| TimeStamp                 | The last time this data was gathered                                                          |



