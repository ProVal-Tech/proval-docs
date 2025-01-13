---
id: ps-update-office
title: 'Update-Office'
title_meta: 'Update-Office Command'
keywords: ['update', 'office365', 'repair', 'version']
description: 'Documentation for the Update-Office command to update Office 365 to the latest version.'
tags: ['update', 'software', 'installation', 'office365']
draft: false
unlisted: false
---
## Description
Launches the Microsoft Update Program to update Office 365

## Requirements
Office 365 (C2R) Version 16.x installed on the endpoint

## Usage
Checks the current office version
    If the script fails to find the office version, a repair is automatically performed.
Performs the update
Checks for successful iteration of the version number after completion.



```powershell
##Begins the Office 365 Update Process
.\Update-Office.ps1
```

## Output

.\Update-Office-log.txt

.\Update-Office-error.txt

