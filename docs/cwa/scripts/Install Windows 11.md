---
id: 'cwa-install-windows-11'
title: 'Process to Download and Install Windows 11'
title_meta: 'Process to Download and Install Windows 11'
keywords: ['windows', 'installation', 'iso', 'download', 'ftp', 'patching']
description: 'This document outlines the process to download and install Windows 11 from a specified URL. It includes user parameters for FTP authentication, ISO hash verification, and links to necessary resources for successful installation.'
tags: ['installation', 'windows', 'ftp', 'update', 'security']
draft: false
unlisted: false
---
## Summary

Process to download and install Windows 11 from a URL.

## Sample Run

![Sample Run](..\..\..\static\img\Install-Windows-11\image_1.png)

## Dependencies

[SEC - Windows Patching - Agnostic - Install-Windows11](https://proval.itglue.com/DOC-5078775-8801459)  
Download and host ISO from here: [https://www.microsoft.com/en-us/software-download/windows11](https://www.microsoft.com/en-us/software-download/windows11)

## Variables

### User Parameters

| Parameter   | Required | Example                                                                 | Description                                                                                   |
|-------------|----------|-------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| URL         | True     | [https://file.contoso.com/Win11_English_x64.iso](https://file.contoso.com/Win11_English_x64.iso) | The URL to download the ISO from. This can be a direct link, FTP link, or a SharePoint public link. |
| FTPUser     | False    | someFTPUser                                                            | The user to authenticate with the FTP server.                                               |
| FTPPassword | False    | s0m3FTPU$ersP@$sw0rD                                                   | The password to authenticate with the FTP server.                                           |
| ISOHash     | False    | 1F7840814B672457482AE77A70ACE03F                                       | The hash of the ISO file to compare any existing ISO. The default value is the hash of the English version of the Windows 11 ISO as of 12/02/2021. |

## Process

See [SEC - Windows Patching - Agnostic - Install-Windows11](https://proval.itglue.com/DOC-5078775-8801459) for process information.

## Output

- Script log
- Local file on computer



