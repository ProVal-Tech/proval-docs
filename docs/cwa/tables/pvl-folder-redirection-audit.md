---
id: '1c5bd6c3-ed3e-49df-884c-b3cd6c90f629'
slug: /1c5bd6c3-ed3e-49df-884c-b3cd6c90f629
title: 'pvl_folder_redirection_audit'
title_meta: 'pvl_folder_redirection_audit'
keywords: ['redirection', 'folder', 'sharing', 'fileshare', 'document', 'picture', 'desktop']
description: 'This table is build to store the folder redirection of users of the computers obtained from the script'
tags: ['redirection', 'folder', 'sharing', 'fileshare', 'document', 'picture', 'desktop']
draft: true
unlisted: false
---

## Purpose
This table is build to store the folder redirection of users of the computers obtained from the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69) so that it can used via DataView to populate the data in a formatted way.

## Dependencies
[Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69)

## Tables

### pvl_folder_redirection_audit

| Column          | Type     | Description                                                                 |
| --------------- | -------- | --------------------------------------------------------------------------- |
| computerid      | INT      | Stores the ID of the computer where the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69) is deployed                  |
| UserName        | VARCHAR  | Stores the username for which the folder redirection was audited            |
| FolderName      | VARCHAR  | Stores the name of the folder that was redirected                           |
| Redirection_Path| VARCHAR  | Stores the path where the folder was redirected for a user on the computer  |
| ScriptRanDate   | DATETIME | Stores the date and time when the folder redirection was last detected by the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69) |
