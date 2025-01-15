---
id: ps-get-firefoxextensions
title: 'Get-FirefoxExtensions'
title_meta: 'Get-FirefoxExtensions Command'
keywords: ['firefox', 'extensions', 'browser', 'user']
description: 'Documentation for the Get-FirefoxExtensions command to gather information about extensions installed on the Mozilla Firefox browser for each user.'
tags: ['firefox', 'configuration', 'software']
draft: false
unlisted: false
---
## Description
Gather information about extensions installed on the Mozilla Firefox browser for each user.

## Requirements
- Run as administrator
- Powershell v5+
- .NET Runtime 4.5+

## Usage
1. Import .NET compression utilities.
2. Get valid user profile paths and performs the following for each path:
   1. Validate if the Firefox Profile path exists. 
   2. For each valid Firefox profile folder, locate and extracts the XPI files (zipped extension packages) into a temp folder, then run the Manifest check.
   3. Out of each extracted directory locates the 'Manifest.json' file.
   4. Read the Manifest.json file to find the `name` of the extension.
   5. The manifest file either contains the `name` of the extension or the reference of the variable storing the name in the Message.json file
   6. If the manifest file returns a variable starting with double underscores (e.g. `__MSG_APP_NAME__`), then attempts to find the extension's name from the 'en\messages.json' file followed by the 'en_us\messages.json' file.
      ex: if the `name` stored in the Manifest.json file is '__MSG_APP_NAME__' then both message.json files will be checked for the value stored under the 'APP_NAME' object.


Get the installed extensions for the Mozilla Firefox browser.
```powershell
.\Get-FirefoxExtensions.ps1
```

## Output
    .\Get-FirefoxExtensions-log.txt
    .\Get-FirefoxExtensions-error.txt
```
    System.Management.Automation.PSCustomObject

    Name                    MemberType   Definition
    ----                    ----------   ----------
    Equals                  Method       bool Equals(System.Object obj)
    GetHashCode             Method       int GetHashCode()
    GetType                 Method       type GetType()
    ToString                Method       string ToString()
    Browser                 NoteProperty string Browser=Firefox
    ExtensionID             NoteProperty System.String ExtensionID={a7fe67a3-d248-48d9-93ce-633fc02cdc98}
    ExtensionInstallTimeUtc NoteProperty datetime ExtensionInstallTimeUtc=03/01/2023 16:55:45
    ExtensionName           NoteProperty string ExtensionName=The best extension
    ExtensionVersion        NoteProperty string ExtensionVersion=1.1.1
    UserProfilePath         NoteProperty System.String UserProfilePath=C:\Users\localadmin
```




