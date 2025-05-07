---
id: 'bf5badbb-1b64-42af-bf84-1ea597926e9c'
slug: /bf5badbb-1b64-42af-bf84-1ea597926e9c
title: 'Get - Windows Session'
title_meta: 'Get - Windows Session'
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
| [CWM - Automate - Script - Windows Sessions [DV, Globals]](/docs/7d803c02-dd33-4a82-810e-02b4820ae88b) | Script       | Executes the `query session` command and fetches the result. |
| [CWM - Automate - Custom Table - pvl_windows_sessions](/docs/a5bff446-3e21-42cf-8208-d0de57f497ee)    | Custom Table | Stores the result fetched by the script.                 |
| [CWM - Automate - Dataview - Windows Sessions [Script]](/docs/7eb288b7-a87b-4f1a-a3a7-7f785f74150a)   | Dataview     | Displays the result stored in the table.                |

## Implementation

- Import the [CWM - Automate - Script - Windows Sessions [DV, Globals]](/docs/7d803c02-dd33-4a82-810e-02b4820ae88b) script.
- Import the [CWM - Automate - Dataview - Windows Sessions [Script]](/docs/7eb288b7-a87b-4f1a-a3a7-7f785f74150a) dataview.
- Execute the script against any computer to create the [CWM - Automate - Custom Table - pvl_windows_sessions](/docs/a5bff446-3e21-42cf-8208-d0de57f497ee) table.
- Reference the dataview for results.
