---
id: '7710c476-c3a8-4432-883c-873c5fd2c4a9'
title: 'StorageCraft Version Check Role'
title_meta: 'StorageCraft Version Check Role for Automate'
keywords: ['storagecraft', 'version', 'check', 'automate', 'database']
description: 'This document outlines a role that checks the installed version of StorageCraft and ensures it meets the requirement of version 6.5 or higher before applying it to the Automate database.'
tags: ['database', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This role checks the installed version of StorageCraft. If it matches version 6.5 or higher, the role can be applied in the Automate database.

## Settings

| Detection String                                         | Comparator    | Result | Applicable OS |
|---------------------------------------------------------|---------------|--------|----------------|
| \{%-HKLM/SOFTWARE/StorageCraft Technology Corporation/spx:InstalledVersion-%} | Regex Match | ^6/.. | Windows        |

