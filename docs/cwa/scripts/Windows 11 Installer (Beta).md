---
id: 'a4668ce4-9788-47a9-bb3b-1997367803ad'
title: 'Windows 11 Installer (Beta)'
title_meta: 'Windows 11 Installer (Beta)'
keywords: ['windows', 'install', 'upgrade', 'zip', 'iso', 'file', 'repository']
description: 'This document provides a detailed guide on how to install Windows 11 from a target ZIP file or ISO, including sample runs and user parameters. It covers necessary dependencies and provides download links for the required files.'
tags: ['installation', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Install Windows 11 from a target ZIP file or ISO.

Download URL: [https://file.provaltech.com/repo/app/windows-upgrader.exe](https://file.provaltech.com/repo/app/windows-upgrader.exe)  
File Hash: 2BDFE75FFE305F4DD438E82811399BFE3AA8045CE38F5A5162E9832768765237

## Sample Run

Install Windows 11 from the ProVal file repository, ignoring compatibility requirements.  
![Image](../../../static/img/Windows-11-Installer-(Beta)/image_1.png)

Install Windows 11 from a target HTTP multipart download, ignoring reboot.  
[https://my.repo.site/repo/Windows11.zip.001](https://my.repo.site/repo/Windows11.zip.001)  
[https://my.repo.site/repo/Windows11.zip.002](https://my.repo.site/repo/Windows11.zip.002)  
[https://my.repo.site/repo/Windows11.zip.003](https://my.repo.site/repo/Windows11.zip.003)  
...  
[https://my.repo.site/repo/Windows11.zip.520](https://my.repo.site/repo/Windows11.zip.520)  
![Image](../../../static/img/Windows-11-Installer-(Beta)/image_2.png)

## Dependencies

- If using the default file repository, the version of Windows being upgraded must be the US version.
- file.provaltech.com must be fully whitelisted in all security systems.
- windows-upgrader.exe must be whitelisted in all security systems.

#### User Parameters

| Name        | Example                                                            | Required | Description                                                                                       |
|-------------|--------------------------------------------------------------------|----------|---------------------------------------------------------------------------------------------------|
| Uri         | [https://my.repo.site/repo/Windows11.zip](https://my.repo.site/repo/Windows11.zip) | False    | A custom URI to either a local file or HTTP file that contains the target Windows 11 payload.     |
| Multipart   | 1                                                                  | False    | Set to 1 if the custom URI is a multipart file in the format [https://my.repo.site/repo/Windows11.zip.001](https://my.repo.site/repo/Windows11.zip.001) |
| NoReboot    | 1                                                                  | False    | Set to 1 to suppress rebooting the machine after the upgrade.                                     |
| IgnoreCompat| 1                                                                  | False    | Set to 1 to ignore Windows 11 hardware/software requirements.                                     |

## Output

- Script log



