---
id: 'fda5f79b-3e83-4561-af2b-2533f41c7443'
slug: /fda5f79b-3e83-4561-af2b-2533f41c7443
title: 'Remove-PUA'
title_meta: 'Remove-PUA'
keywords: ['remove', 'bloatware', 'cleanup', 'software']
description: 'Documentation for the Remove-PUA command to remove potentially unwanted applications (PUA) from computers.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Description
Removes bloatware from computers agnostically in a single PowerShell script.

## Requirements
Parameters are required at minimum. This script contains six system objects, five of which are specific to listing potential bloatware by category. The final object contains potential `.exe` silent switches. As we identify more items to list, this script will need to be modified to add such items.

## Usage
1. What initial switch was used
    1. **RemoveAll**
        1. There is an additional switch
            1. Category selected
                1. Populate a list of all items in that category
                    1. Is there an additional switch?
                        1. Except is selected
                            1. Remove the item(s) excepted from the items list for that category
                            2. Uninstall all other installed items from that list
                        2. Except is not selected
                            1. Filter list down to only installed items
                            2. Uninstall those items
            2. Except selected
                1. Remove the item(s) excepted from the list it belongs to
                2. Uninstall all other items from that list
        2. There is no additional switch
            1. Check all items in all lists
            2. Filter down to only installed applications
            3. Uninstall the items
    2. **Remove**
        1. Are the item(s) in a list?
            1. No
                1. Error out in error log: could not find item
            2. Yes
                1. Uninstall item(s) listed in string array
    3. **ListBloatware**
        1. Display a list of all potential installed items

See what potential bloatware is installed:
```powershell
.\Remove-PUA.ps1 -ListBloatware 
```
I intend to remove specific software:
```powershell
.\Remove-PUA.ps1 -Remove "this software","and that software" 
```
I intend to remove all bloatware:
```powershell
.\Remove-PUA.ps1 -RemoveAll
```
I intend to remove all Microsoft-based bloatware:
```powershell
.\Remove-PUA.ps1 -RemoveAll -Category MsftBloatApps
```
I intend to remove all Microsoft-based bloatware except MSPaint and Windows Camera:
```powershell
.\Remove-PUA.ps1 -RemoveAll -Category MsftBloatApps -Except "microsoft.mspaint","microsoft.windowscamera"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type        | Description                               |
| ----------------- | ----- | --------- | --------- | ----------- | ----------------------------------------- |
| `ListBloatware`   |       | True      |           | Switch      | Provides a list of any installed potential bloatware |
| `Remove`          |       | True      |           | StringArray | The name of the application or applications you wish to uninstall |
| `RemoveAll`       |       | True      |           | Switch      | Switch required to remove all bloatware by category or all found bloatware with or without exceptions |
| `Category`        |       | False     |           | ValidateSet | Used with RemoveAll to filter bloatware to a certain category, allowing you to select just a specific category of bloatware |
| `Except`          |       | False     |           | StringArray | Used with RemoveAll or Category to remove all except some item(s) from a category or all together |

## Output
- `.\Remove-PUA-log.txt`
- `.\Remove-PUA-error.txt`


