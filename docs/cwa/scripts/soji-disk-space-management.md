---
id: '47f53d1e-f609-46f8-b407-ccdf11eeede4'
slug: /47f53d1e-f609-46f8-b407-ccdf11eeede4
title: 'Soji - Disk Space Management'
title_meta: 'Soji - Disk Space Management'
keywords: ['soji', 'script', 'automate', 'execution', 'logging']
description: 'This document describes the Soji execution script designed for ConnectWise Automate, detailing its functionality, dependencies, user parameters, process steps, and output results. The script facilitates the execution of the Soji application while managing necessary installations and logging outputs effectively.'
tags: ['installation', 'logging', 'software']
draft: false
unlisted: false
---

## Summary

This is an Automate script intended to execute the Soji application found in the GitHub repository.

**Note:** Soji is a destructive application by nature in that it deletes files and folders. **Take great care when using the `--days`, `--systempaths`, and `--userpaths` arguments.**

## File Hash

### Soji

**File Path:** `C:\ProgramData\_automation\app\Soji\Soji.exe`  
**File Hash (SHA256):** `A1B0E95DF56D044695D9B2CDFF99B2F6C8F2B39AA4651CA08B714BC270B6F80E`  
**File Hash (MD5):** `DD92DB4289F41A045D3E7E0C049910F6`

### dotNet8DesktopRuntimex86

**File Path:** `C:\ProgramData\_automation\app\Prompter\dotNet8DesktopRuntime.exe`  
**File Hash (SHA256):** `20FFF5DAA81998E2C05529DA8A15AF982E84AEFD3D12E09DDDD981C5F5F60757`  
**File Hash (MD5):** `46D1152C101923309FAAAE1BA1C5B0F6`

### dotNet8DesktopRuntimex64

**File Path:** `C:\ProgramData\_automation\app\Prompter\dotNet8DesktopRuntime.exe`  
**File Hash (SHA256):** `7A418127FB8510CFEFC6B9DB220168B851EF2748F8252829997B3C61510C830A`  
**File Hash (MD5):** `FBA1071515DCDF3C4D27D1EB0A7B4769`

## Sample Run

![Sample Run](../../../static/img/docs/47f53d1e-f609-46f8-b407-ccdf11eeede4/image_1.webp)

Please refer to the Soji documentation for argument options.

## Dependencies

- [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc)

## Variables

| Name | Description |
| ---- | ----------- |
| ProjectName | Soji |
| WorkingDirectory | C:\ProgramData\_automation\app\Soji |
| EXEPath | C:\ProgramData\_automation\app\Soji\Soji.exe |
| LogPath | C:\ProgramData\_automation\app\Soji\SojiLogs\SojiLogs.Zip |
| DotNetRunTimeDownloadPath | C:\ProgramData\_automation\app\Prompter\dotNet8DesktopRuntime.exe |
| x86DotNetDownloadUrl | <https://download.visualstudio.microsoft.com/download/pr/6e1f5faf-ee7d-4db0-9111-9e270a458342/4cdcd1af2d6914134308630f048fbdfc/windowsdesktop-runtime-8.0.11-win-x86.exe> |
| x64DotNetDownloadUrl | <https://download.visualstudio.microsoft.com/download/pr/27bcdd70-ce64-4049-ba24-2b14f9267729/d4a435e55182ce5424a7204c2cf2b3ea/windowsdesktop-runtime-8.0.11-win-x64.exe> |

## User Parameters

| Name      | Example                | Required | Description                                                                 |
|-----------|------------------------|----------|-----------------------------------------------------------------------------|
| Arguments | --drives c,f --json    | False    | Please refer to [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) for argument usage. |

## Output

- Script log
- Desired file output to the Soji directory, e.g., JSON, etc.
- On LabTech server: `%LTShare%/Uploads/%ClientName%/%ComputerName% - %ComputerId%/SojiLogs.zip`
