---
id: 'cwa-dell-command-update'
title: 'Dell Command | Update Script for Dell Workstations'
title_meta: 'Dell Command | Update Script for Dell Workstations'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']
description: 'This document provides an overview of a script that utilizes the Dell Command | Update application to manage updates on Dell Workstations. It covers installation, upgrade procedures, command line usage, and sample runs, along with user parameters and script states for effective management of system updates.'
tags: ['update', 'installation', 'firmware', 'bios', 'driver', 'windows', 'software']
draft: false
unlisted: false
---
## Summary

The "Dell Command | Update" application is used by this script to carry out commands on Dell Workstations. If the application isn't already installed, it will do it. If a version older than 5 is already present, it will upgrade the application to the latest available version.

Supported OS: Windows 10, Windows 11

Command line reference: [Dell Command | Update CLI Commands](https://www.dell.com/support/manuals/en-us/command-update/dcu_rg/dell-command-%7C-update-cli-commands?guid=guid-92619086-5f7c-4a05-bce2-0d560c15e8ed&lang=en-us)

**Note:** The systems must be compatible with the installation of Dell Command Update. For further details on compatible systems, please visit the compatible systems section of the below link: [Dell Command | Update Windows Universal Application | Driver Details | Dell US](https://www.dell.com/support/home/en-us/drivers/DriversDetails?driverId=0XNVX)

**Note:** ProVal does not recommend performing BIOS updates remotely. ProVal is not responsible for any failed devices due to remote BIOS updates. BIOS updates are performed at the MSP's risk.

## Sample Run

![Sample Run](..\..\..\static\img\Dell-Command-Update---InstallUpgrade-+-Command-Handler\image_1.png)

To execute the /scan command:  
![Execute Scan Command](..\..\..\static\img\Dell-Command-Update---InstallUpgrade-+-Command-Handler\image_2.png)

To Install all the available Updates:  
![Install All Updates](..\..\..\static\img\Dell-Command-Update---InstallUpgrade-+-Command-Handler\image_3.png)

To Install BIOS, and FIRMWARE Updates only:  
![Install BIOS and Firmware Updates](..\..\..\static\img\Dell-Command-Update---InstallUpgrade-+-Command-Handler\image_4.png)

To Install BIOS updates Only:  
![Install BIOS Updates Only](..\..\..\static\img\Dell-Command-Update---InstallUpgrade-+-Command-Handler\image_5.png)

In the same way Driver Updates can be installed as well. Please refer to [Dell Command | Update Version 5.x Reference Guide | Dell US](https://www.dell.com/support/manuals/en-us/command-update/dcu_rg/dell-command-%7C-update-cli-commands?guid=guid-92619086-5f7c-4a05-bce2-0d560c15e8ed&lang=en-us) for more supported commands.

## User Parameters

| Name     | Example | Required | Description                                                                                       |
|----------|---------|----------|---------------------------------------------------------------------------------------------------|
| Command  | /scan   | False    | Command to execute on the computer, /scan command will be executed, if this parameter is left blank. |

## Script States

| Name                               | Description                                             |
|------------------------------------|---------------------------------------------------------|
| DellCommandUpdateLastCommandPassed | Stores the command executed from the user parameter.   |
| DellCommandUpdateScriptLastRunTime | Stores the script run time.                            |
| DellCommandUpdateScriptLastResult  | Output of the command executed from Dell Command | Update. |
| UpdatesNeeded                      | Number of updates needed to install on the computer. Returned by the /Scan command. |
| LastRunStatus                      | Exit code returned by Dell Command | Update.           |
| LastRunStatusReference             | Translation of the exit code.                          |

## Output

- Script State
- Script Log



