---
id: ps-invoke-officescrub
title: 'Invoke-OfficeScrub'
title_meta: 'Invoke-OfficeScrub Command'
keywords: ['uninstall', 'office', 'cleanup', 'remove']
description: 'Documentation for the Invoke-OfficeScrub command to uninstall Microsoft Office products via OffScrub.'
tags: ['office365', 'uninstallation']
draft: false
unlisted: false
---

## Description
Allows the uninstallation of Microsoft Office products via OffScrub.

## Usage
1. Ensures that the session is elevated; if not, it warns and exits.
2. Determines what switches you entered and sets up an object with the file download locations.
3. If no switches are present, it warns and exits.
4. Loops through all the switches, downloading and executing them.

```powershell
.\Invoke-OfficeScrub.ps1 -Office03
```
Uninstalls detected Office 2003 installs.

```powershell
.\Invoke-OfficeScrub.ps1 -Office03 -Office10 -Office16
```
Removes all detected instances of Office 2003, 2010, and 2016.

```powershell
.\Invoke-OfficeScrub.ps1 -All
```
Removes all installed versions of Office.

## Parameters
| Parameter   | Alias | Required | Default | Type   | Description                          |
| ----------- | ----- | -------- | ------- | ------ | ------------------------------------ |
| `Office03`  |       | False    |         | Switch | Uninstalls Office 2003               |
| `Office07`  |       | False    |         | Switch | Uninstalls Office 2007               |
| `Office10`  |       | False    |         | Switch | Uninstalls Office 2010               |
| `Office13`  |       | False    |         | Switch | Uninstalls Office 2013               |
| `Office16`  |       | False    |         | Switch | Uninstalls Office 2016               |
| `OfficeC2R` |       | False    |         | Switch | Uninstalls Office Click to Run       |
| `All`       |       | False    |         | Switch | Uninstalls all above Office versions |

## Output
- .\Invoke-OfficeScrub-log.txt
- .\Invoke-OfficeScrub-error.txt
