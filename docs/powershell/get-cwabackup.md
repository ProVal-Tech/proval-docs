---
id: '6347b2d8-1968-4f6e-8d3f-bfeb0b5a304d'  
slug: /6347b2d8-1968-4f6e-8d3f-bfeb0b5a304d  
title: 'Get-CWABackup'  
title_meta: 'Get-CWABackup'  
keywords: ['labtech', 'backup', 'files', 'retrieve']  
description: 'Documentation for the Get-CWABackup command to return all Labtech*.zip files from any Labtech backup location.'  
tags: ['backup', 'recovery', 'software']  
draft: false  
unlisted: false  
---  

## Description  
Returns all Labtech*.zip files from any Labtech backup location.  

## Usage  
1. Looks for the Labtech.1.zip in the default location and any additional drives.  
2. Stores all Labtech*.zip files to an object that are found where Labtech.1.zip is located.  
3. Returns that object.  

```powershell  
.\Get-CWABackup.ps1  
```  
Returns all Labtech backup files.  

## Output  
System.Object  