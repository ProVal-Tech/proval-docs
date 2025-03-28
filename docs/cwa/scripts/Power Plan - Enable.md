---
id: 'a170b385-7464-478e-b1cc-d357a8840e45'
title: 'Power Plan - Enable'
title_meta: 'Power Plan - Enable'
keywords: ['automate', 'powerplan', 'script', 'configuration', 'windows']
description: 'This document provides details on the Enable Power Plan script for ConnectWise Automate, including its implementation, usage, dependencies, and output. It allows users to mark an existing Power Plan as active on endpoints, ensuring proper configuration management.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is an Automate implementation of the agnostic script [EPM - Windows Configuration - Agnostic - Enable-PowerPlan](<../../powershell/Enable-PowerPlan.md>), which can be utilized to mark an existing Power Plan as active.

File Path: `C:/ProgramData/_Automation/script/Enable-PowerPlan/Enable-PowerPlan.ps1`  
File Hash (Sha256): `13F38A3CB96BE9C19B38ED09A1175852B33713DE43368B84867A7999D202F6F3`  
File Hash (MD5): `59BB9E9FB16FD5E53EB657D0F02ED9A8`  

## Sample Run

![Sample Run](../../../static/img/Power-Plan---Enable/image_1.png)

**Note:**
- Ensure that the name of the `PowerPlan` matches exactly with the `Power Plan` column in the [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](<../dataviews/Power Plan - Audit Script.md>) dataview.
- After executing the script, changes made at the endpoint can be validated by checking the `Is Active` column for the respective Power Plan in the [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](<../dataviews/Power Plan - Audit Script.md>) dataview. This column indicates whether the Power Plan has been successfully marked as active/enabled.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Remove-PowerPlan](<../../powershell/Remove-PowerPlan.md>)
- [EPM - Data Collection - Script - Power Plan - Audit [DV]](<./Power Plan - Audit DV.md>)
- [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](<../dataviews/Power Plan - Audit Script.md>)

## Variables

| Name              | Description                                   |
|-------------------|-----------------------------------------------|
| ProjectName       | Enable-PowerPlan                             |
| WorkingDirectory   | C:/ProgramData/_Automation/Script/Enable-PowerPlan |

#### User Parameters

| Name        | Example   | Required | Description                             |
|-------------|-----------|----------|-----------------------------------------|
| PowerPlan   | Balanced  | True     | Name of the Power Plan to enable/activate |

## Output

- Script Log
- Dataview



