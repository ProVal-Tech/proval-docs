---
id: '1c2e90d3-32f7-4439-a0d7-dc1c5ccc19f2'  
slug: /1c2e90d3-32f7-4439-a0d7-dc1c5ccc19f2  
title: 'Update-VisualStudio'  
title_meta: 'Update-VisualStudio'  
keywords: ['update', 'visualstudio', 'upgrade', 'installation']  
description: 'Documentation for the Update-VisualStudio command to update all installed Visual Studio versions automatically.'  
tags: ['installation', 'software', 'update']  
draft: false  
unlisted: false  
---  

## Description  

Updates all installed Visual Studio versions automatically.  

Supported Visual Studio versions:  
- VS 2022 Enterprise  
- VS 2022 Community  
- VS 2019 Enterprise  
- VS 2019 Community  
- VS 2017 Enterprise  
- VS 2017 Community  

## Requirements  

- PowerShell v5  
- Visual Studio 2017, 2019, or 2022 installed  

## Usage  

```powershell  
.\Update-VisualStudio.ps1  
```  

## Output  

- .\Update-VisualStudio-log.txt  
- .\Update-VisualStudio-data.txt  
- .\Update-VisualStudio-error.txt  