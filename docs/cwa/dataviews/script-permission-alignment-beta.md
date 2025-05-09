---
id: 'c7532677-9914-419a-b6cc-da381393c68c'
slug: /c7532677-9914-419a-b6cc-da381393c68c
title: 'Script Permission Alignment Beta'
title_meta: 'Script Permission Alignment Beta'
keywords: ['dataview', 'user', 'classes', 'permissions', 'scripts']
description: 'This document provides an overview of the dataview that displays user classes assigned to stock scripts after executing the Script Permission Alignment [Beta] script. It details the dependencies and the columns included in the dataview, offering insights into script access and user class permissions.'
tags: ['database']
draft: false
unlisted: false
---

## Summary

The dataview will display the user classes that will be assigned to the stock scripts after running the [Script Permission Alignment [Beta]](/docs/46412261-f40b-456f-92db-500d166c41ca) script.

## Dependencies

[CWM - Automate - Script - Script Permission Alignment [Beta]](/docs/46412261-f40b-456f-92db-500d166c41ca)

## Columns

| Column                     | Description                                           |
|---------------------------|-------------------------------------------------------|
| Script ID                 | Script ID                                            |
| Script Name               | Script Name                                          |
| Script Parent Folder      | Name of the Script Parent Folder                     |
| Script Path               | Full Path to the Script                              |
| Access                    | Set of user classes who have permission to access this script |
| User Class                | Name of the User Class(es) with access to this script |