---
id: '6eddbb86-86a9-4812-8a5e-3302933800c9'
slug: /6eddbb86-86a9-4812-8a5e-3302933800c9
title: 'EPM - Windows Configuration - Windows Explorer View - List'
title_meta: 'EPM - Windows Configuration - Windows Explorer View - List'
keywords: ['windows', 'explorer', 'list', 'view', 'shell', 'registry']
description: 'This script configures Windows Explorer to display files and folders in List View by modifying specific registry settings. It ensures that the changes apply to all users and creates the necessary registry keys for the desired view mode.'
tags: ['registry', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will set the Windows Explorer view to List View.

## Sample Run

![Sample Run](../../../static/img/docs/6eddbb86-86a9-4812-8a5e-3302933800c9/image_1.webp)

## Variables

| Name            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| RemovalBagMRU   | This includes information on the removal of the HKCU bagmru key.          |
| RemovalBags     | This includes information on the removal of the HKCU bags key.             |
| ListView        | This includes the list value setting at the HKLM system level for all Windows Explorer. |
| OutCome         | Output of the PowerShell script performing the changes.                    |

## Process

This script performs the following actions:
- Modifies `HKCU:/Software/Classes/Local Settings/Software/Microsoft/Windows/Shell/BagMRU` for all users.
- Modifies `HKCU:/Software/Classes/Local Settings/Software/Microsoft/Windows/Shell/Bags`
  - It creates 'Mode' with a value of 3 and 'LogicalViewMode' with a value of 4 at `HKLM:/SOFTWARE/Microsoft/Windows/Shell/Bags/AllFolders/Shell/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/FolderTypes/TopView`, then GUID.

## Output

- Script log
