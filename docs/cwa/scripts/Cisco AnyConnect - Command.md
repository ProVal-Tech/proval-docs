---
id: 'cwa-cisco-anyconnect-install-uninstall'
title: 'Cisco AnyConnect Install/Uninstall Script'
title_meta: 'Cisco AnyConnect Install/Uninstall Script'
keywords: ['cisco', 'anyconnect', 'install', 'uninstall', 'script', 'windows', 'mac', 'linux']
description: 'This document provides a detailed guide on a script designed to install or uninstall Cisco AnyConnect based on user parameters. It covers requirements, variables, user parameters, and the process for different operating systems including Windows, Mac, and Linux.'
tags: ['installation', 'uninstallation', 'software', 'windows', 'mac', 'linux']
draft: false
unlisted: false
---
## Summary

This script will uninstall or install Cisco AnyConnect depending on the user parameter provided. This script will work on Windows machines, Mac Machines, and Potentially Linux Machines (Untested).

This script requires the download of the Windows / Mac / and Linux installation media from the client portal. Please avoid renaming the downloaded files, as it may break things with the Linux implementation. Once those files are obtained, place them in `Ltshare/transfer/installers/360UW/Cisco-AnyConnect/` folder. Then open the script and change the static variables to match your downloaded files, paying specific attention to the designated operating system for the variable.

![Image](../../../static/img/Cisco-AnyConnect---Command/image_1.png)

Save the script.

## Sample Run

![Image](../../../static/img/Cisco-AnyConnect---Command/image_2.png)

The Default action of this script is to Install Cisco AnyConnect.

![Image](../../../static/img/Cisco-AnyConnect---Command/image_3.png)

Only Providing UnInstall in the Action Parameter will trigger the uninstall.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name            | Description                                                                                                                                                                        |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CACFileName     | This is a Static Variable Set in the Static Variables section of the script. These files must be set to the machine type filenames you placed in the `Ltshare/transfer/installers/360UW/Cisco-AnyConnect/` folder for each operating system. Lines 3, 4, and 5 in the script. |
| CACFileNoGz     | This removes the .gz from the CACFileName so we can drive into the folder to install the package.                                                                               |
| MountedName      | This is the Mounted name of the drive when installing on Mac devices.                                                                                                          |
| UnmountedName    | This is the Unmounted name of the drive when installing on Mac devices.                                                                                                        |

#### User Parameters

| Name    | Example                             | Required | Description                                                                                              |
|---------|-------------------------------------|----------|----------------------------------------------------------------------------------------------------------|
| Action  | This will be anything or 'UnInstall' | False    | This determines the action to take regarding Cisco AnyConnect, to install or UnInstall. The default is to Install Cisco AnyConnect. |

## Process

### Action

1. Install
   1. Check if Cisco AnyConnect is installed; if it is, exit.
   2. Download the required file.
   3. Check that the file downloaded; if it did not, error and exit.
   4. Determine the Method of installation
      1. Windows
         - Install the Application
      2. Mac
         1. Mount the DMG file
         2. Get the drive name
         3. Install the application
         4. Unmount the drive
      3. Linux
         1. Unzip the GZ file
         2. Determine the assumed path
         3. Install the application
   5. Check if Cisco AnyConnect is installed; if it's not, exit with error.

2. Uninstall
   1. Check if Cisco AnyConnect is installed; if it's not, exit.
   2. Execute the uninstall command determined by OS.
   3. Check if Cisco AnyConnect is installed; if it's still not, exit with error.

## Output

- Script log
  - There is extensive script logging in this script in both the install and uninstall processes.



