---
id: 'e4221ae7-3cd9-4019-9d65-1f8ae2e58d33'
title: 'Creating the plugin_proval_v_monitoraudit View'
title_meta: 'Creating the plugin_proval_v_monitoraudit View for ConnectWise Automate'
keywords: ['view', 'plugin', 'audit', 'dataview', 'monitor']
description: 'This document explains the process of creating the plugin_proval_v_monitoraudit View, which is essential for populating data in the Automate Monitor Audit dataview. It includes steps for dropping the existing view, creating a new one, and assigning permissions to users.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script creates the [View - plugin_proval_v_monitoraudit](<../views/plugin_proval_v_monitoraudit.md>) View, which populates the data in the [CWM - Automate - Dataview - Automate - Monitor Audit [View]](<../dataviews/Automate - Monitor Audit View.md>) dataview.

## Sample Run

![Sample Run](../../../static/img/MySQL---View---Create---plugin_proval_v_monitoraudit/image_1.png)

## Process

- Drops the [View - plugin_proval_v_monitoraudit](<../views/plugin_proval_v_monitoraudit.md>) if it already exists.
- Creates the [View - plugin_proval_v_monitoraudit](<../views/plugin_proval_v_monitoraudit.md>).
- Assigns View permissions to all users.

## Output

- View

