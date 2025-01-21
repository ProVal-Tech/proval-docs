---
id: 'c5375e25-6943-4f2c-b62f-2640e63a856c'
title: 'Chocolatey Wrapper for Installing Programs'
title_meta: 'Chocolatey Wrapper for Installing Programs'
keywords: ['chocolatey', 'installation', 'programs', 'upgrade', 'packages']
description: 'This document provides a comprehensive guide on using the Chocolatey Wrapper to install and upgrade various software packages efficiently. It covers commands for installing single and multiple packages, upgrading existing installations, and managing exceptions and custom packages in the library.'
tags: ['installation', 'software']
draft: false
unlisted: false
---

## Summary:

Chocolatey Wrapper for installing programs

## How to Use:

- **Install single package:**  
  `ChocoController.exe -install yes -packages microsoft-edge`  

- **Only upgrade single package:**  
  `ChocoController.exe -install no -packages "microsoft-edge,Microsoft Edge"`  

- **Install multiple packages:**  
  `ChocoController.exe -install yes -packages "firefox|sumatrapdf|microsoft-edge"`  

- **Only upgrade multiple packages:**  
  `ChocoController.exe -install no -packages "firefox,FireFox|sumatrapdf,SumatraPDF|microsoft-edge,Microsoft Edge"`  

- **Install all packages in library:**  
  `ChocoController.exe -install yes`  

- **Only upgrade all packages in library:**  
  `ChocoController.exe -install no`  

- **Install everything in library except a package:**  
  `ChocoController.exe -install yes -exception "googlechrome"`  

- **Install everything in library except a list of packages:**  
  `ChocoController.exe -install yes -exception "googlechrome|adobereader"`  

- **Only upgrade everything in library except a list of packages:**  
  `ChocoController.exe -install no -exception "googlechrome|adobereader"`  

- **Install everything in library plus another package:**  
  `ChocoController.exe -install yes -custom sumatrapdf`  

- **Install everything in library plus a list of packages:**  
  `ChocoController.exe -install yes -custom "sumatrapdf|microsoft-edge"`  

- **Only upgrade everything in library plus another package:**  
  `ChocoController.exe -install no -custom "sumatrapdf,SumatraPDF"`  

- **Only upgrade everything in library plus a list of packages:**  
  `ChocoController.exe -install no -custom "foxitreader,Foxit Reader|microsoft-edge,Microsoft Edge"`  

- **Install everything in library except a list of packages and add a list of packages:**  
  `ChocoController.exe -install yes -exception "googlechrome|adobereader" -custom "sumatrapdf|microsoft-edge"`  

- **Only upgrade everything in library except a list of packages and add a list of packages:**  
  `ChocoController.exe -install no -exception "googlechrome|adobereader" -custom "foxitreader,Foxit Reader|microsoft-edge,Microsoft Edge"`  

## Parameters:

- **-install:** Required. [yes] or [no] Install the app if it doesn't exist? No = upgrade only  
- **-packages:** Pipe-separated list of packages. If install=no use [\<pkg>,\<displayname>|\<pkg>,\<displayname>]  
- **-exception:** Pipe-separated list of library packages not to install/upgrade  
- **-custom:** Pipe-separated list of packages to add to library packages. If install=no use [\<pkg>,\<displayname>]  

