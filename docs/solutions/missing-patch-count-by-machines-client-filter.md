---
id: 'ab16db00-9f6e-4ea8-974f-8756b3bd2881'
slug: /ab16db00-9f6e-4ea8-974f-8756b3bd2881
title: 'Missing Patch - Count by Machines - Client Filter'
title_meta: 'Missing Patch - Count by Machines - Client Filter'
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
| [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](/docs/7b802d5b-f445-41d6-b3e4-30986c3102a0)         | Script  | To create the view.                                        |
| [CWM - Automate - View - Plugin_ProVal_V_Patch_Count_Status](/docs/c1fad1cd-7320-472e-b20e-3d8fa620f0db)                                 | View    | Stores the data to be displayed by the dataview.          |
| [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](/docs/0fd0215c-d6d5-40c8-9ba6-79b69721f4c1)       | Dataview| Displays the client-level breakdown of machines missing a certain number of patches. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](/docs/7b802d5b-f445-41d6-b3e4-30986c3102a0) script.
- Import the [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](/docs/0fd0215c-d6d5-40c8-9ba6-79b69721f4c1) Dataview.
- Execute the script against any random machine and check the dataview for the data.
- Delete the script.