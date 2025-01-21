---
id: ps-get-chromiumextensions
title: 'Get-ChromiumExtensions'
title_meta: 'Get-ChromiumExtensions'
keywords: ['chromium', 'extensions', 'browser', 'user']
description: 'Documentation for the Get-ChromiumExtensions command to gather information about extensions installed on Chromium-based browsers for each user.'
tags: ['chrome', 'software', 'web-browser']
draft: false
unlisted: false
---

## Description
Gather information about extensions installed on Chromium browsers for each user.  
**Supported Browsers:** Google Chrome, Brave, Microsoft Edge Chromium

## Requirements
- Run as administrator
- PowerShell v5+

## Usage
1. Get valid user profile paths.
2. Set the UserProfile's relative path to the 'Extensions' directory for each browser.
3. For each browser's 'Extensions' directory for each user profile, perform the following steps:
   1. Find the installation path and `Manifest.json` file of each installed extension.
   2. Read the `Manifest.json` file to find the `name` of the extension.
   3. The manifest file either contains the `name` of the extension or the reference of the variable storing the name in the `messages.json` file.
   4. If the manifest file returns a variable starting with double underscores (e.g., `__MSG_APP_NAME__`), then attempt to find the extension's name from the 'en/messages.json' file followed by the 'en_us/messages.json' file.  
      For example, if the `name` stored in the `Manifest.json` file is `__MSG_APP_NAME__`, then both `messages.json` files will be checked for the value stored under the 'APP_NAME' object.
   5. Store the extension's information in a `[pscustomobject]` and return it.

### Examples
Get installed extensions from all supported browsers.
```powershell
.\\Get-ChromiumExtensions.ps1
```
Get installed extensions from Google Chrome only.
```powershell
.\\Get-ChromiumExtensions.ps1 -Browser Chrome
```
Get installed extensions from Microsoft Edge only.
```powershell
.\\Get-ChromiumExtensions.ps1 -Browser Edge
```
Get installed extensions from Microsoft Edge and Brave.
```powershell
.\\Get-ChromiumExtensions.ps1 -Browser Edge,Brave
```

## Parameters
| Parameter | Alias | Required | Default           | Type   | Description                                                                                           |
| --------- | ----- | -------- | ----------------- | ------ | ----------------------------------------------------------------------------------------------------- |
| `Browser` |       | False    | Chrome, Edge, Brave | String | Validate set array containing popular Chromium-based browsers. Available options: Chrome, Edge, Brave |

## Output
- `.\\Get-ChromiumExtensions-log.txt`
- `.\\Get-ChromiumExtensions-error.txt`
- `System.Management.Automation.PSCustomObject`

```
Name                    MemberType   Definition
----                    ----------   ----------
Browser                 NoteProperty string Browser=Chrome
ExtensionID             NoteProperty string ExtensionID=ejgnolahdlcimijhloboakpjogbfdkkp
ExtensionInstallTimeUtc NoteProperty datetime ExtensionInstallTimeUtc=04/10/2022 10:14:46
ExtensionName           NoteProperty string ExtensionName=An Extension
IsDefault               NoteProperty bool IsDefault=False
ExtensionVersion        NoteProperty string ExtensionVersion=1.12.2
UserProfilePath         NoteProperty System.String UserProfilePath=C:\\Users\\localadmin
```



