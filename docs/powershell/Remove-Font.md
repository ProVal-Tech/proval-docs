---
id: 'a88b469b-0384-49f8-b959-16e701c538ad'  
title: 'Remove-Font'  
title_meta: 'Remove-Font'  
keywords: ['remove', 'font', 'cleanup', 'system']  
description: 'Documentation for the Remove-Font command to remove one or more installed fonts from the system.'  
tags: ['windows']  
draft: false  
unlisted: false  
---  

## Description  
Remove one or more installed fonts.  

## Requirements  
PowerShell v5  

## Usage  
1. Finds all fonts matching the passed parameter (Title or Pattern).  
2. Removes the fonts from the registry and system fonts path.  
3. Logs the success or failure of the removal for each font.  

*Removes the 'Josefin Sans Bold (True Type)' font.*  
```powershell  
.\Remove-Font.ps1 -Title 'Josefin Sans Bold (True Type)'  
```  

*Removes any font with 'Josefin' in the title.*  
```powershell  
.\Remove-Font.ps1 -Title '*Josefin*'  
```  

*Removes Dollie Script Personal Use (Open Type) and Josefin Sans Bold (True Type) fonts.*  
```powershell  
.\Remove-Font.ps1 -Pattern 'Dollie Script Personal Use \(Open Type\)|Josefin Sans Bold \(True Type\)'  
```  

*Removes any font with 'Dollie' or 'Josefin' in the title.*  
```powershell  
.\Remove-Font.ps1 -Pattern 'Dollie|Josefin'  
```  

## Parameters  
| Parameter | Alias | Required | Default | Type   | Description                                                                                  |  
| --------- | ----- | -------- | ------- | ------ | -------------------------------------------------------------------------------------------- |  
| `Title`   |       | Semi     |         | String | The title of the font to remove. Accepts the '*' wildcard to remove multiple matching fonts. |  
| `Pattern` |       | Semi     |         | String | A regex pattern to match against the title of fonts to remove.                              |  

## Output  
- .\Remove-Font-log.txt  
- .\Remove-Font-error.txt  

## Additional Notes  
To get the list of installed system fonts, run either of the following PowerShell commands:  
```powershell  
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'  
# or  
Get-ChildItem -Path (New-Object -ComObject Shell.Application).Namespace(0x14).Self.Path  
```  



