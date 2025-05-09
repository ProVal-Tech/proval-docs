---
id: '498075f7-623c-4b92-9fbc-fe0f5e7113a4'  
slug: /498075f7-623c-4b92-9fbc-fe0f5e7113a4  
title: 'Update-Office'  
title_meta: 'Update-Office'  
keywords: ['update', 'office365', 'repair', 'version']  
description: 'Documentation for the Update-Office command to update Office 365 to the latest version.'  
tags: ['installation', 'office365', 'software', 'update']  
draft: false  
unlisted: false  
---  

## Description  
Launches the Microsoft Update Program to update Office 365.  

## Requirements  
- Office 365 (C2R) Version 16.x installed on the endpoint.  

## Usage  
- Checks the current Office version.  
- If the script fails to find the Office version, a repair is automatically performed.  
- Performs the update.  
- Checks for a successful iteration of the version number after completion.  

```powershell  
## Begins the Office 365 Update Process  
.\Update-Office.ps1  
```  

## Output  
- .\Update-Office-log.txt  
- .\Update-Office-error.txt  
