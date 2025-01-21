---
id: 'f1a8a745-3c9f-4505-b17e-778e3399d7aa'
title: 'Admin - Broken Monitor Audit'
title_meta: 'Admin - Broken Monitor Audit'
keywords: ['audit', 'monitor', 'group', 'sql', 'alert']
description: 'This document provides an overview of the dataview used for auditing internal monitors, highlighting issues with broken group mappings, and detailing the relevant columns and their descriptions.'
tags: ['sql']
draft: false
unlisted: false
---

## Summary

The dataview helps to audit the internal monitors where their group mapping is broken.

## Columns

| Column        | Description                                        |
|---------------|----------------------------------------------------|
| Agentid      | Displays the Monitor ID of the internal monitor.   |
| Name         | Displays the name of the internal monitor.         |
| Dataout      | Displays the SQL query running on the monitor.     |
| Groupid      | Displays the group ID on which the monitor is applied. |
| Group Applied | Displays the group name on which the monitor is applied. |
| Notes        | Displays the notes mentioned about the group.      |
| AlertAction  | Displays the ID of the applied alert template.     |



