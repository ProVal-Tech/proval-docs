---
id: '9ee3657f-dff8-4599-a4c3-68ca3ba171f4'
title: 'Denied Patch Table for Windows Patching'
title_meta: 'Denied Patch Table for Windows Patching'
keywords: ['patch', 'windows', 'table', 'security', 'update']
description: 'This document provides a detailed overview of the denied patch table used for Windows patching, including its purpose, dependencies, and structure. It is essential for managing patches that should not be applied, ensuring system stability and security.'
tags: ['database', 'security', 'update', 'windows']
draft: false
unlisted: false
---
## Purpose

This table holds information on patches to deny as per [denied patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records). The [SEC - Windows Patching - Script - Fetch Denied Patch List From Centralized ITGLue KBIDs](<../scripts/Fetch Denied Patch List From Centralized ITGLue KBIDs.md>) script will create and update this table.

## Dependencies

[SEC - Windows Patching - Script - Fetch Denied Patch List From Centralized ITGLue KBIDs](<../scripts/Fetch Denied Patch List From Centralized ITGLue KBIDs.md>)

## Tables

#### plugin_proval_denied_patches

| Column | Type        | Explanation                           |
|--------|-------------|---------------------------------------|
| KBID   | varchar(20) | KBID of the patch to deny.           |
| Title  | varchar(2000) | Title of the patch to deny.        |
| Reason | varchar(2000) | Reason behind denying the patch.    |












