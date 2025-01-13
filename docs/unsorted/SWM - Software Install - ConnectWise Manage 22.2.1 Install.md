---
id: 'cwa-install-connectwise-manager-client'
title: 'Install or Upgrade ConnectWise Manager Internet Client to Version 22.2.1'
title_meta: 'Install or Upgrade ConnectWise Manager Internet Client to Version 22.2.1'
keywords: ['connectwise', 'installer', 'upgrade', 'client', 'version', '22.2.1']
description: 'This document provides a detailed guide on installing or upgrading the ConnectWise Manager Internet Client to version 22.2.1, including dependencies, variables, and the process to follow for successful installation.'
tags: ['installation', 'update', 'software', 'connectwise']
draft: true
unlisted: true
---
## Summary

Installs or upgrades the current Connectwise Manager Internet Client to version 22.2.1 if necessary.

## Sample Run

![Sample Run](../../static/img/SWM---Software-Install---ConnectWise-Manage-22.2.1-Install/image_1.png)

## Dependencies

- [https://university.connectwise.com/install/2022.2.1/ConnectWise-Manage-Internet-Client-x64.msi](https://university.connectwise.com/install/2022.2.1/ConnectWise-Manage-Internet-Client-x64.msi) link must remain valid.

## Variables

| Name            | Description                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| InstallerName   | The name of the msi installation file.                                                         |
| LocalPath       | The location including file name for where we will place the msi.                             |
| DownloadUrl     | The download URL to obtain the msi file.                                                      |
| Install         | True or false value, Reflects the answer to; Do we need to install?                           |
| StatusMessage    | Variable to store current process state log messages.                                          |

#### Global Parameters

| Name           | Example | Required | Description                                                                                                                                              |
|----------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| TargetVersion  | 22.2.1  | True     | This Variable represents the target version you wish to be at, and is used to formulate the Download URL variable, as well as a comparison value when looking at the current installed product version. |

## Process

- Create a temp directory that will hold the installer if one doesn't exist.
- Compare the currently installed version to the target version. If the currently installed version is greater than or equal to the target version, log that no installation is necessary and exit.
- Download the file.
- Execute the installation.
- Resend the software list.
- Check for ConnectWise Manage Client 64-bit. If not there, delete the temp file, log the state, and exit with error.
- Delete the temp file.
- Log success and exit.




