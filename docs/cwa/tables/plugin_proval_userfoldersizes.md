---
id: 'cwa-get-user-folder-sizes'
title: 'Get User Folder Sizes'
title_meta: 'Get User Folder Sizes - Script Overview'
keywords: ['user', 'folder', 'size', 'information', 'script']
description: 'This document outlines the purpose and dependencies of the Get User Folder Sizes script, detailing how it stores user folder size information and the structure of the data it collects.'
tags: ['database', 'configuration', 'report', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores user folder size information from the script @Get User Folder Sizes (Script)

## Dependencies

@Get User Folder Sizes (Script)

## Table

#### plugin_proval_userfoldersizes

| Column        | Type    | Explanation                           |
|---------------|---------|---------------------------------------|
| ComputerID    | INT     | The audited agent's computer ID.     |
| ProfilePath   | VARCHAR | The path of the audited profile.     |
| ProfileSize   | FLOAT   | The size of the profile in GB.       |




