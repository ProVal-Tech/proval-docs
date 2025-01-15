---
id: 'bf5badbb-1b64-42af-bf84-1ea597926e9c'
title: 'Gather and Display Windows Sessions'
title_meta: 'Gather and Display Windows Sessions'
keywords: ['gather', 'display', 'windows', 'sessions', 'query']
description: 'This document outlines a solution to gather, store, and display the results of the query session command in a tabular format. It includes associated content such as scripts, custom tables, and dataviews necessary for implementation.'
tags: ['script', 'custom', 'table', 'dataview', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution will gather, store and display the result of the `query session` command in a tabular form.

## Associated Content

| Content                                                                 | Type         | Function                                                |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------|
| [CWM - Automate - Script - Windows Sessions [DV, Globals]](https://proval.itglue.com/DOC-5078775-12366454) | Script       | Executes the `query session` command and fetch the result. |
| [CWM - Automate - Custom Table - pvl_windows_sessions](https://proval.itglue.com/DOC-5078775-12366490)    | Custom Table | Store the result fetched by the script.                 |
| [CWM - Automate - Dataview - Windows Sessions [Script]](https://proval.itglue.com/DOC-5078775-12366483)   | Dataview     | Displays the result stored in the table.                |

## Implementation

- Import the [CWM - Automate - Script - Windows Sessions [DV, Globals]](https://proval.itglue.com/DOC-5078775-12366454) script.
- Import the [CWM - Automate - Dataview - Windows Sessions [Script]](https://proval.itglue.com/DOC-5078775-12366483) dataview.
- Execute the script against any computer to create the [CWM - Automate - Custom Table - pvl_windows_sessions](https://proval.itglue.com/DOC-5078775-12366490) table.
- Reference the dataview for results.






