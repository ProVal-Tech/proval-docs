---
id: ps-new-desktopurishortcut
title: 'Create Desktop URI Shortcut'
title_meta: 'Create Desktop URI Shortcut with PowerShell'
keywords: ['shortcut', 'desktop', 'uri', 'wscript', 'favicon']
description: 'Guide to creating a desktop URI shortcut using PowerShell.'
tags: ['windows']
draft: false
unlisted: false
---
## Description
Creates a shortcut in the Public Desktop folder.

## Requirements
Windows OS, Powershell 5

## Usage
1. Uses WScriptShell to create a shell shortcut in the $env:PUBLIC\Desktop Folder. 
2. Gathers the site favicon if a website is provided as the targetUri
3. Sets the shortcut name to the file / website name if not explicitly provided.


```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'C:\Users\Test.docx -ShortcutName 'Test Document'
```
Creates a shortcut to local file C:\Users\Test.docx with the name 'Test Document

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'https://www.google.com' -Shortcutname 'Google'
```
Creates a shortcut to a web link on the desktop

## Parameters
| Parameter      | Required | Type   | Description                                                                                                                            |
| -------------- | -------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| `TargetUri`    | True     | String | The target path of the shortcut. This can be a local or web URI. Must begin with `'\<DRIVE_LETTER>:\'` or 'Https://' or 'http://'        |
| `ShortcutName` | False    | String | The optional name of the shortcut being set. If not provided, the file name or DnsSafeHost property will be used as the shortcut name. |
| `IconLocation` | False    | String | Optionally set an *.ico file as the shortcut icon.                                                                                     |

## Output
- $env:PUBLIC\Desktop\link.lnk
- $env:PUBLIC\Pictures\icon.ico
- New-DesktopUriShortcut-log.txt
- New-DesktopUriShortcut-error.txt









