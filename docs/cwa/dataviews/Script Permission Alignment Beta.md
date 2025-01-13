---
id: 'cwa-script-permission-alignment'
title: 'Script Permission Alignment Overview'
title_meta: 'Script Permission Alignment Overview'
keywords: ['dataview', 'user', 'classes', 'permissions', 'scripts']
description: 'This document provides an overview of the dataview that displays user classes assigned to stock scripts after executing the Script Permission Alignment [Beta] script. It details the dependencies and the columns included in the dataview, offering insights into script access and user class permissions.'
tags: ['script', 'user', 'access', 'folder', 'path', 'database']
draft: false
unlisted: false
---
## Summary

The dataview will display the user classes which will be assigned to the stock scripts after running the [Script Permission Alignment [Beta]](https://proval.itglue.com/DOC-5078775-16760857) script.

## Dependencies

[CWM - Automate - Script - Script Permission Alignment [Beta]](https://proval.itglue.com/DOC-5078775-16760857)

## Columns

| Column                     | Description                                           |
|---------------------------|-------------------------------------------------------|
| Scriptid                  | Scriptid                                             |
| Script Name               | Script Name                                          |
| Script Parent Folder      | Name of the Script Parent Folder                     |
| Script Path               | Full Path to the Script                              |
| Access                    | Set of user classes who have permission to access this script |
| User Class                | Name of the User Class(es) with access to this script |


