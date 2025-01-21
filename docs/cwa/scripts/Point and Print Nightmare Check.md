---
id: 'd65da81c-76ee-429a-a007-9ef788f2ee51'
title: 'Check Registry for Point And Print Detection'
title_meta: 'Check Registry for Point And Print Detection'
keywords: ['registry', 'point', 'print', 'detection', 'safety']
description: 'This script checks the specified registry entries to determine if Point And Print is detected and whether it is set to a safe value. If the registry values are not set or are equal to zero, it reports that no action is required, ensuring system safety.'
tags: ['print', 'registry', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will check if the registry entry provided in the link below is detected.  
If the registry is detected, it will determine if it is set to 0 or null.  
If the above conditions are not met, then the script will report Point And Print as detected.  

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Point-and-Print-Nightmare-Check/image_1.png)

## Dependencies

[PrintNightMare Detection](<../dataviews/PrintNightMare Detection.md>) 

#### Script States

| Name              | Example          | Description                                                                                      |
|-------------------|------------------|--------------------------------------------------------------------------------------------------|
| PointAndPrint     | Powershell Output | Detected - Meant registry entry found and not equal to 0<br>No Action Required - Safe          |

## Process

- This script will check for `HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows NT/Printers/PointAndPrint/NoWarningNoElevationOnInstall` and `HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows NT/Printers/PointAndPrint/UpdatePromptSettings`.
- If any are found, then check for the value.
- If the value is not set or is 0, then it is safe; else, record as Point And Print Detected.

## Output

- Script log
- Script state
- Dataview
