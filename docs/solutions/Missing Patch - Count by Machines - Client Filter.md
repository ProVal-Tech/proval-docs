---
id: 'cwa-client-level-patch-count'
title: 'Client-Level Patch Count Dataview'
title_meta: 'Client-Level Patch Count Dataview'
keywords: ['dataview', 'patch', 'client', 'machines', 'status']
description: 'This document outlines a solution for creating a dataview that provides a breakdown of machines at the client level that are missing a specified number of patches. It includes associated scripts and views necessary for implementation.'
tags: ['database', 'report', 'security', 'configuration', 'update']
draft: false
unlisted: false
---
## Purpose

This solution provides a dataview of the Client-Level breakdown of machines missing a certain number of patches.

## Associated Content

| Content                                                                                                                                           | Type    | Function                                                    |
|---------------------------------------------------------------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------|
| [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](https://proval.itglue.com/DOC-5078775-11867748)         | Script  | To create the view.                                        |
| [CWM - Automate - View - Plugin_ProVal_V_Patch_Count_Status](https://proval.itglue.com/DOC-5078775-11867749)                                 | View    | Stores the data to be displayed by the dataview.          |
| [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](https://proval.itglue.com/DOC-5078775-11867771)       | Dataview| Displays the Client-Level breakdown of machines missing a certain amount of patches. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](https://proval.itglue.com/DOC-5078775-11867748) script.
- Import the [CWM - Automate - Dataview - Dash - Missing Patch - Count by Machines - Client Filter](https://proval.itglue.com/DOC-5078775-11867771) Dataview.
- Execute the script against any random machine and check the dataview for the data.
- Delete the script.


