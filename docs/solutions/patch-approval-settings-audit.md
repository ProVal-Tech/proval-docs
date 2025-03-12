---
id: '9029e4ae-478e-4f04-8138-b632a2dd5a16'
title: 'Patch Approval Settings Audit'
title_meta: 'Patch Approval Settings Audi'
keywords: ['patch', 'patch-manager', 'windows', 'audit', 'alert', 'denied', 'approved', 'ignored', 'unapproved']
description: 'This document outlines the process of implementing the content to keep track of patches approval and denials.'
tags: ['patch', 'database',]
draft: false
unlisted: false
---

## Purpose

The aim of the solution is to provide a way to keep track of the approval and denials of the patches and keep the approval policies in check.

## Associated Contents

| Content | Type | Function |
| ------- | ---- | -------- |
| [Patch Approval Count](<../cwa/dataviews/patch-approval-count.md>) | Dataview | Provides a basic metrics view of patches in each approval category, excluding drivers and third-party patches. |
| [Auto Approval Policies](<../cwa/dataviews/auto-approval-policies.md>) | Dataview | Displays the Auto Approve, Auto Ignore, and Auto Deny settings of all approval policies. |
| [Patch Approval Categories](<../cwa/dataviews/patch-approval-categories.md>) | Dataview | Provides detailed information about patches that are auto-approved, denied, or ignored based on their category for each approval policy. |
| [Denied Patch Audit](<../cwa/dataviews/denied-patch-audit.md>) | Dataview | Displays the list of denied patches in the environment. |
| [Denied CU Patch Audit](<../cwa/dataviews/denied-cu-audit.md>) | Dataview | Displays the list of denied cumulative updates in the environment. |
| [plugin_proval_auto_approval_status](<../cwa/views/plugin_proval_auto_approval_status.md>) | Custom Table | Presents auto-approve category information about approval policies. |
| [MySQL - View - Create (plugin_proval_auto_approval_status)](<../cwa/scripts/mysql-view-create-plugin_proval_auto_approval_status.md>) | Script | Creates the `plugin_proval_auto_approval_status` view. |
| [Unapproved Patches Count Audit](<../cwa/scripts/unapproved-patches-count-audit.md>) | Script | Creates an urgent ticket for ProVal if the number of unapproved patches changes by a certain percentage within a day or week. |

## Implementation

### Step 1

Import the following content from the `ProSync` plugin:

- [Dataview - Patch Approval Count](<../cwa/dataviews/patch-approval-count.md>)
- [Dataview - Auto Approval Policies](<../cwa/dataviews/auto-approval-policies.md>)
- [Dataview - Patch Approval Categories](<../cwa/dataviews/patch-approval-categories.md>)
- [Dataview - Denied Patch Audit](<../cwa/dataviews/denied-patch-audit.md>)
- [Dataview - Denied CU Patch Audit](<../cwa/dataviews/denied-cu-audit.md>)
- [Script - MySQL - View - Create (plugin_proval_auto_approval_status)](<../cwa/scripts/mysql-view-create-plugin_proval_auto_approval_status.md>)
- [Script - Unapproved Patches Count Audit](<../cwa/scripts/unapproved-patches-count-audit.md>)

### Step 2

Reload System Cache  
![Reload System Cache](<../../static/img/cwa-reload-system-cache/image_2.png>)

### Step 3

Run the [Script - MySQL - View - Create (plugin_proval_auto_approval_status)](<../cwa/scripts/mysql-view-create-plugin_proval_auto_approval_status.md>) against any agent to create the [plugin_proval_auto_approval_status](<../cwa/views/plugin_proval_auto_approval_status.md>) view. 

*Delete the script after creating the view*

### Step 4

Schedule the [Unapproved Patches Count Audit](<../cwa/scripts/unapproved-patches-count-audit.md>) script to run once per day as demonstrated in the [script's](<../cwa/scripts/unapproved-patches-count-audit.md#sample-run>) document.