---
id: 'e7d25f05-6d80-4baa-94b8-517f81abc4a5'
slug: /e7d25f05-6d80-4baa-94b8-517f81abc4a5
title: 'Folder Redirection Audit [Script]'
title_meta: 'Folder Redirection Audit [Script]'
keywords: ['folder', 'redirection', 'audit', 'data', 'endpoint', 'backup']
description: 'This document provides an overview of the Folder Redirection Audit, detailing the information displayed related to folder redirection on endpoints, including dependencies, columns, and their descriptions.'
tags: ['backup', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This DataView will display basic information related to folder redirection on endpoints.

## Dependencies

[Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69)  
[Table - pvl_folder_redirection_audit](/docs/1c5bd6c3-ed3e-49df-884c-b3cd6c90f629)  
[Solution - Folder Redirection Audit](/docs/37f95f1c-ee3e-43d5-a530-ab5023fec2c5) 

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Client Name                   | The name of the client associated with the machine                                            |
| Location Name                 | The name of the location associated with the machine                                          |
| Computer Name                  | The name of the machine related to the data                                                  |
| Username                  | Stores the username for which the folder redirection was audited                                     |
| Operating System            | This stores the operating system name of the agent                   |
| LastContact    | This shows the agent LastContact status with the CW Automate      |
| FolderName          | Stores the name of the folder that was redirected                 |
| Redirected_Path  | Stores the path where the folder was redirected for a user on the computer   |
| ScriptRanDate           | Stores the date and time when the folder redirection was last detected by the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69)                  |


