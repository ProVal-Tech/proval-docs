---
id: 'bf5badbb-1b64-42af-bf84-1ea597926e9c'
title: 'Gather and Display Windows Sessions'
title_meta: 'Gather and Display Windows Sessions'
keywords: ['gather', 'display', 'windows', 'sessions', 'query']
description: 'This document outlines a solution to gather, store, and display the results of the query session command in a tabular format. It includes associated content such as scripts, custom tables, and dataviews necessary for implementation.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This solution will gather, store, and display the result of the `query session` command in a tabular format.

## Associated Content

| Content                                                                 | Type         | Function                                                |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------|
| [CWM - Automate - Script - Windows Sessions [DV, Globals]](<../cwa/scripts/Windows Sessions DV, Globals.md>) | Script       | Executes the `query session` command and fetches the result. |
| [CWM - Automate - Custom Table - pvl_windows_sessions](<../cwa/tables/pvl_windows_sessions.md>)    | Custom Table | Stores the result fetched by the script.                 |
| [CWM - Automate - Dataview - Windows Sessions [Script]](<../cwa/dataviews/Windows Sessions Script.md>)   | Dataview     | Displays the result stored in the table.                |

## Implementation

- Import the [CWM - Automate - Script - Windows Sessions [DV, Globals]](<../cwa/scripts/Windows Sessions DV, Globals.md>) script.
- Import the [CWM - Automate - Dataview - Windows Sessions [Script]](<../cwa/dataviews/Windows Sessions Script.md>) dataview.
- Execute the script against any computer to create the [CWM - Automate - Custom Table - pvl_windows_sessions](<../cwa/tables/pvl_windows_sessions.md>) table.
- Reference the dataview for results.

