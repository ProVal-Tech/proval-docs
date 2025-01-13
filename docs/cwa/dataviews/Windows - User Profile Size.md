---
id: 'cwa-user-profile-sizes'
title: 'User Profile Sizes on Windows Machine'
title_meta: 'User Profile Sizes on Windows Machine'
keywords: ['user', 'profile', 'sizes', 'windows', 'machine', 'folder', 'size', 'os']
description: 'This document provides a detailed overview of the available user profile sizes on a Windows machine, including dependencies, columns, and their descriptions for better understanding and utilization.'
tags: ['windows', 'configuration', 'report', 'performance', 'software']
draft: false
unlisted: false
---
## Summary

This dataview displays all the available User Profile sizes on the windows machine.

## Dependencies

- `@plugin_proval_userfoldersizes` - custom Table
- `@Get User Folder Sizes` (script)

## Columns

| Column            | Description                                      |
|-------------------|--------------------------------------------------|
| ComputerID       | Display the computerID.                          |
| Machine          | Display the computer name.                       |
| Client           | Display the client name.                         |
| Profile Path     | Display the user profile folder path.            |
| Profile Size (MB)| Display the user profile folder size in MB.     |
| OS               | Display the computer operating system.           |



