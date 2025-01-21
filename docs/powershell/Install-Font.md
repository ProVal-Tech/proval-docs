---
id: ps-install-font
title: 'Install-Font'
title_meta: 'Install-Font'
keywords: ['install', 'font', 'typography', 'setup']
description: 'Documentation for the Install-Font command to install one or more fonts on a Windows system.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Description
Installs one or more fonts.

## Requirements
PowerShell v5

## Usage
1. For each font to install:
   1. Get the COM object for the font's directory to enable querying the metadata.
   2. Get the Title metadata properties of the font file.
   3. If the font is an OpenType font, append '(OpenType)' to the registry property name; otherwise, append '(TrueType)'.
   4. Install the font and validate success.

*Installs all found fonts located in the `C:\Fonts` folder:*
```powershell
.\\Install-Font.ps1 -Path C:\\Fonts
```

*Installs the Times New Roman font located in the `C:\Fonts` folder:*
```powershell
.\\Install-Font.ps1 -Path C:\\Fonts\\times.ttf
```

## Parameters
| Parameter | Alias | Required | Default | Type   | Description                                                   |
| --------- | ----- | -------- | ------- | ------ | ------------------------------------------------------------- |
| `Path`    |       | True     |         | String | The path to the font file or folder of font files to install. |

## Output
- `.\Install-Font-log.txt`
- `.\Install-Font-error.txt`



