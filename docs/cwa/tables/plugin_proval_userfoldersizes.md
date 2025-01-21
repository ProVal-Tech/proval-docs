---
id: 'e47be58e-d72d-4396-aa0c-edef63f056e8'
title: 'plugin_proval_userfoldersizes'
title_meta: 'plugin_proval_userfoldersizes'
keywords: ['user', 'folder', 'size', 'information', 'script']
description: 'This document outlines the purpose and dependencies of the Get User Folder Sizes script, detailing how it stores user folder size information and the structure of the data it collects.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores user folder size information from the script **Get User Folder Sizes**.

## Dependencies

This script depends on **Get User Folder Sizes**.

## Table

#### plugin_proval_userfoldersizes

| Column        | Type    | Explanation                           |
|---------------|---------|---------------------------------------|
| ComputerID    | INT     | The audited agent's computer ID.     |
| ProfilePath   | VARCHAR | The path of the audited profile.     |
| ProfileSize   | FLOAT   | The size of the profile in GB.       |



