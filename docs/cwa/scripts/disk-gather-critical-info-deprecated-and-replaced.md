---
id: 'ee31c873-0d1f-42fa-b698-cdfe1cbf75a6'
slug: /ee31c873-0d1f-42fa-b698-cdfe1cbf75a6
title: 'Disk - Gather Critical Info - Deprecated and replaced'
title_meta: 'Disk - Gather Critical Info - Deprecated and replaced'
keywords: ['disk', 'critical', 'data', 'custom', 'table']
description: 'This document outlines the Automate Script designed to handle the Agnostic Script for retrieving critical disk information. It details the creation of a custom table called `plugin_proval_cdi_data` and the process of appending data from the agnostic script to this table, along with sample runs, dependencies, and output methods.'
tags: ['database', 'disk-encryption', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

Automate Script designed to handle the Agnostic Script [EPM - Disk - Agnostic - Get-CriticalDiskInfo](/docs/880d2a63-b304-40a3-8ec3-1fb13b272fa7).  
Creates a custom table called `plugin_proval_cdi_data`.  
Appends data from the agnostic script to the created table.

## Sample Run

![Sample Run](../../../static/img/docs/ee31c873-0d1f-42fa-b698-cdfe1cbf75a6/image_1.png)

## Dependencies

- [EPM - Disk - Agnostic - Get-CriticalDiskInfo](/docs/880d2a63-b304-40a3-8ec3-1fb13b272fa7)  
- [CWM - Automate - Dataview - Disk - Critical Data](/docs/8a8b76b2-aa25-419c-b193-aa98f54ef274)

## Process

Reference the Agnostic Script Process found in [EPM - Disk - Agnostic - Get-CriticalDiskInfo](/docs/880d2a63-b304-40a3-8ec3-1fb13b272fa7).

## Output

The location and method by which this script returns data:

- Script log
- Script state
- Local file on computer
- Dataview


