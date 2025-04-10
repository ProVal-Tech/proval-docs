---
id: '9029e4ae-478e-4f04-8138-b632a2dd5a16'
slug: /9029e4ae-478e-4f04-8138-b632a2dd5a16
title: 'Patch Approval Settings Audit'
title_meta: 'Patch Approval Settings Audi'
keywords: ['patch', 'patch-manager', 'windows', 'audit', 'alert', 'denied', 'approved', 'ignored', 'unapproved']
description: 'This document outlines the process of implementing the content to keep track of patches approval and denials.'
tags: ['database',]
draft: false
unlisted: false
---

## Purpose

The aim of the solution is to provide a way to keep track of the approval and denials of the patches and keep the approval policies in check.

## Associated Contents

| Content | Type | Function |
| ------- | ---- | -------- |
| [Patch Approval Count](/docs/e575739f-77a8-481a-bae3-3abb18447b92) | Dataview | Provides a basic metrics view of patches in each approval category, excluding drivers and third-party patches. |
| [Auto Approval Policies](/docs/1b296878-9915-4c2b-9d2e-f9ee09059cc9) | Dataview | Displays the Auto Approve, Auto Ignore, and Auto Deny settings of all approval policies. |
| [Patch Approval Categories](/docs/43b35510-f264-429f-a06e-e0ea7822cfc1) | Dataview | Provides detailed information about patches that are auto-approved, denied, or ignored based on their category for each approval policy. |
| [Denied Patch Audit](/docs/485b29e0-cf9e-4933-846c-bb83b52b115d) | Dataview | Displays the list of denied patches in the environment. |
| [Denied CU Patch Audit](/docs/63ec0e5f-417c-452b-88fd-1c95969ac25c) | Dataview | Displays the list of denied cumulative updates in the environment. |
| [plugin_proval_auto_approval_status](/docs/ae8ce64f-816a-4e84-8052-f8e131dde389) | Custom Table | Presents auto-approve category information about approval policies. |
| [MySQL - View - Create (plugin_proval_auto_approval_status)](/docs/2f451b19-e8af-4a24-9032-17d65ba2b40d) | Script | Creates the `plugin_proval_auto_approval_status` view. |
| [Unapproved Patches Count Audit](/docs/595e85de-299d-4242-a569-f5367be6b1c9) | Script | Creates an urgent ticket for ProVal if the number of unapproved patches changes by a certain percentage within a day or week. |

## Implementation

### Step 1

Import the following content from the `ProSync` plugin:

- [Dataview - Patch Approval Count](/docs/e575739f-77a8-481a-bae3-3abb18447b92)
- [Dataview - Auto Approval Policies](/docs/1b296878-9915-4c2b-9d2e-f9ee09059cc9)
- [Dataview - Patch Approval Categories](/docs/43b35510-f264-429f-a06e-e0ea7822cfc1)
- [Dataview - Denied Patch Audit](/docs/485b29e0-cf9e-4933-846c-bb83b52b115d)
- [Dataview - Denied CU Patch Audit](/docs/63ec0e5f-417c-452b-88fd-1c95969ac25c)
- [Script - MySQL - View - Create (plugin_proval_auto_approval_status)](/docs/2f451b19-e8af-4a24-9032-17d65ba2b40d)
- [Script - Unapproved Patches Count Audit](/docs/595e85de-299d-4242-a569-f5367be6b1c9)

### Step 2

Reload System Cache  
![Reload System Cache](<../../static/img/cwa-reload-system-cache/image_2.png>)

### Step 3

Run the [Script - MySQL - View - Create (plugin_proval_auto_approval_status)](/docs/2f451b19-e8af-4a24-9032-17d65ba2b40d) against any agent to create the [plugin_proval_auto_approval_status](/docs/ae8ce64f-816a-4e84-8052-f8e131dde389) view. 

*Delete the script after creating the view*

### Step 4

Schedule the [Unapproved Patches Count Audit](/docs/595e85de-299d-4242-a569-f5367be6b1c9) script to run once per day as demonstrated in the [script's](/docs/595e85de-299d-4242-a569-f5367be6b1c9#sample-run>) document.
