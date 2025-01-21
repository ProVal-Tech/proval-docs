---
id: 'ab16db00-9f6e-4ea8-974f-8756b3bd2881'
title: 'Client-Level Patch Count Dataview'
title_meta: 'Client-Level Patch Count Dataview'
keywords: ['dataview', 'patch', 'client', 'machines', 'status']
description: 'This document outlines a solution for creating a dataview that provides a breakdown of machines at the client level that are missing a specified number of patches. It includes associated scripts and views necessary for implementation.'
tags: ['database', 'report', 'security', 'update']
draft: false
unlisted: false
---

## Purpose

This solution provides a dataview of the client-level breakdown of machines missing a certain number of patches.

## Associated Content

| Content                                                                                                                                           | Type    | Function                                                    |
|---------------------------------------------------------------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------|
| [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status.md>)         | Script  | To create the view.                                        |
| [CWM - Automate - View - Plugin_ProVal_V_Patch_Count_Status](<../cwa/views/Plugin_ProVal_V_Patch_Count_Status.md>)                                 | View    | Stores the data to be displayed by the dataview.          |
| [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](<../cwa/dataviews/Dash - Missing Patch - Count by Machines - Client Filter.md>)       | Dataview| Displays the client-level breakdown of machines missing a certain number of patches. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status.md>) script.
- Import the [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](<../cwa/dataviews/Dash - Missing Patch - Count by Machines - Client Filter.md>) Dataview.
- Execute the script against any random machine and check the dataview for the data.
- Delete the script.

