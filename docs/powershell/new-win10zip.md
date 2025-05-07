---
id: '7707aa81-b387-4a31-9f46-372baed60b9f'
slug: /7707aa81-b387-4a31-9f46-372baed60b9f
title: 'New-Win10Zip'
title_meta: 'New-Win10Zip'
keywords: ['windows', 'iso', 'zip', 'deployment']
description: 'Documentation for the New-Win10Zip command to download an ISO and create a Windows 10 release ZIP file for automatic deployments.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Description
Downloads an ISO and creates a Windows 10 release ZIP file and hash for use in automatic deployments of Windows 10.

## Requirements
- PowerShell v5
- Internet Connection

## Usage
1. If the target ISO file is not found on your system under `C:\ESD`, then the [MediaCreationTool.bat][mct] repository is downloaded and used to pull the applicable ISO.
2. The ISO is validated and then mounted.
3. The entire contents of the ISO are copied to `.\<version>`, where `.` is the location of the script file and `\<version>` is the passed-in version parameter.
4. The script validates that the mounted ISO directory and the `.\<version>` directory match before unmounting the image.
5. The ZIP file is created from the `.\<version>` directory.
6. An MD5 hash for the ZIP is generated, and the path to the ZIP file along with the hash is output to the `-data.txt` file.

Downloads a Windows 10 21H1 ISO and creates the applicable ZIP file and hash.

```powershell
.\New-Win10Zip.ps1 -Version 21H1
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type          | Description                                                                               |
| ----------------- | ----- | --------- | --------- | -------------- | ----------------------------------------------------------------------------------------- |
| `-Version`        |       | True      |           | String         | The version of Windows to create a ZIP file for.                                        |
| `-ISOOnly`        |       | False     | False     | Switch (bool)  | Use this to only download the ISO for the target version. A ZIP file will not be created.|

## Output
Location of output for log, result, and error files.

```
.<version>.zip
.\New-Win10Zip-log.txt
.\New-Win10Zip-data.txt
.\New-Win10Zip-error.txt
```

[mct]: https://github.com/AveYo/MediaCreationTool.bat
