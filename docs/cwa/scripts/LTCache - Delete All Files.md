---
id: 'cwa-clean-lt-caching-folder'
title: 'Clean LT Caching Folder Script'
title_meta: 'Clean LT Caching Folder Script'
keywords: ['cleanup', 'caching', 'script', 'lt', 'folder', 'automation']
description: 'This document provides details about a script designed to clean up the LT caching folder, saving approximately 10 minutes of manual effort. It includes a sample run, variable descriptions, and a step-by-step process of how the script operates, along with its output.'
tags: ['cleanup', 'caching', 'script', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This script will clean up the LT caching folder.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\LTCache---Delete-All-Files\image_1.png)

## Variables

| Variable        | Description                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------|
| CacheServerName  | This stores the SCDrive tweak name where //// replaced with blank after first //.              |

## Process

- Script will get the configured cache folder on the Location level.
- Then it will look for the machines where the LT cache was created.
- Script will check on the machine if the Cache folder exists. If it does, then it will remove all the items from the caching folder.

## Output

- Script log



