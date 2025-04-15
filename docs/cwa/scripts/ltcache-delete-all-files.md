---
id: 'e0706097-bc34-4648-b117-8fa1706a21e5'
slug: /e0706097-bc34-4648-b117-8fa1706a21e5
title: 'LTCache - Delete All Files'
title_meta: 'LTCache - Delete All Files'
keywords: ['cleanup', 'caching', 'script', 'lt', 'folder', 'automation']
description: 'This document provides details about a script designed to clean up the LT caching folder, saving approximately 10 minutes of manual effort. It includes a sample run, variable descriptions, and a step-by-step process of how the script operates, along with its output.'
tags: ['caching', 'cleanup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will clean up the LT caching folder.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/LTCache---Delete-All-Files/image_1.png)

## Variables

| Variable        | Description                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------|
| CacheServerName  | This stores the SCDrive tweak name where `//` is replaced with a blank after the first `//`.  |

## Process

- The script will get the configured cache folder at the location level.
- Then it will look for the machines where the LT cache was created.
- The script will check if the cache folder exists on the machine. If it does, it will remove all the items from the caching folder.

## Output

- Script log


