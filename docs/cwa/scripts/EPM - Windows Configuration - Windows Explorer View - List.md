---
id: '6eddbb86-86a9-4812-8a5e-3302933800c9'
title: 'Set Windows Explorer to List View'
title_meta: 'Set Windows Explorer to List View'
keywords: ['windows', 'explorer', 'list', 'view', 'shell', 'registry']
description: 'This script configures Windows Explorer to display files and folders in List View by modifying specific registry settings. It ensures that the changes apply to all users and creates the necessary registry keys for the desired view mode.'
tags: ['registry', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script will set the Windows explorer view to List View.

## Sample Run

![Sample Run](../../../static/img/EPM---Windows-Configuration---Windows-Explorer-View---List/image_1.png)

## Variables

| Name            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| RemovalBagMRU   | This includes info on Remove of HKCU bagmru key                            |
| RemovalBags     | This includes info on Remove of HKCU bags key                               |
| ListView        | This includes the list value setting at the HKLM system level for all Windows explorer. |
| OutCome         | Output of the PowerShell script performing the changes.                    |

## Process

This script performs below action:
- HKCU:/Software/Classes/Local Settings/Software/Microsoft/Windows/Shell/BagMRU for all users.
- HKCU:/Software/Classes/Local Settings/Software/Microsoft/Windows/Shell/Bags
  - It creates 'Mode' -Value 3 and 'LogicalViewMode' -Value 4 at the HKLM:/SOFTWARE/Microsoft/Windows/Shell/Bags/AllFolders/Shell/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/FolderTypes/TopView, then guid.

## Output

- Script log












