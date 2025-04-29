---
id: 37f95f1c-ee3e-43d5-a530-ab5023fec2c5'
slug: /37f95f1c-ee3e-43d5-a530-ab5023fec2c5
title: 'Folder Redirection Audit'
title_meta: 'Folder Redirection Audit'
keywords: ['redirection', 'folder', 'sharing', 'fileshare', 'document', 'picture', 'desktop', 'backup']
description: 'This solution shows the folder redirection auditing of the active user folders on the computer'
tags: ['redirection', 'folder', 'sharing', 'fileshare', 'document', 'picture', 'desktop', 'backup']
draft: false
unlisted: false
---

## Purpose
This solution is built to gather the folder redirection auditing of the active user folders on the computers.

## Associated Content

| Content | Type | Function |
| ------ | ---- | ----------- |
| [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69) | Script | This script performs the folder redirection audit for the redirected folders of all users of the Windows machines. The folders which are used for audit are (Desktop, Document, Download, My Picture, My Video,  My Pictures,  Local AppData,  History,  Cookies,  Cache,  AppData,  Favorites,  Fonts,  CD Burning,  Administrative Tools,  NetHood,  Personal,  PrintHood,  Programs,  Recent,  SentTo,  Start Menu,  StartUp,  Templates) |
| [DataView - Folder Redirection Audit [Script]](/docs/e7d25f05-6d80-4baa-94b8-517f81abc4a5) | DataView | This document provides an overview of the Folder Redirection Audit, detailing the information displayed related to folder redirection on endpoints, including dependencies, columns, and their descriptions. | 
| [Table - pvl_folder_redirection_audit](/docs/1c5bd6c3-ed3e-49df-884c-b3cd6c90f629) | Table | This table is build to store the folder redirection of users of the computers obtained from the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69) |

## Implementation

- Import the [Script - Folder Redirection Detection [DV]](/docs/7ed018ec-c912-4c93-9b90-c74b7b383b69)
- Import the [DataView - Folder Redirection Audit [Script]](/docs/e7d25f05-6d80-4baa-94b8-517f81abc4a5)
- Schedule the script to the group or set of computers as per the requirement to trace the redirection of the folders.

## FAQ
