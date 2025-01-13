---
id: 'cwa-duo-install-update-solution'
title: 'DUO Install and Update Solution'
title_meta: 'DUO Install and Update Solution for Consistent Application Management'
keywords: ['duo', 'update', 'install', 'monitor', 'automation']
description: 'This document outlines a solution for managing the installation and updating of the DUO application, ensuring it remains patched and up-to-date against vulnerabilities like CVE-2024-20292. It includes associated monitors and scripts for detecting the latest version and implementing updates automatically.'
tags: ['application', 'update', 'monitor', 'script', 'security']
draft: false
unlisted: false
---
## Purpose

This solution assists in setting the latest DUO detection and updating the older DUO installed to the agents based on the latest version detection. This was created to ensure DUO got patched for the CVE-2024-20292, however, this will keep the application up to date consistently into the future.

## Associated Content

| Content                                                                                                      | Type    | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - DUO Authentication - Latest Version Detection](https://proval.itglue.com/DOC-5078775-15897258) | Monitor | This internal monitor is created to fetch the latest version of the application.                                   |
| [Script - Application - Latest Version Detection [Winget]](https://proval.itglue.com/DOC-5078775-14466237) | Script  | This script is designed to gather the latest version of applications supported by Winget which is provided in the [Internal Monitor - DUO Authentication - Latest Version Detection](https://proval.itglue.com/DOC-5078775-15897258). |
| [Internal Monitor - DUO Authentication - Install/Update](https://proval.itglue.com/DOC-5078775-15683993)   | Monitor | This monitor is designed to update the DUO Authentication on the computers where the outdated application is detected. |
| [Script - DUO Install & Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-9713528)           | Script  | This script will install or update DUO if the currently installed instance is older than the latest released version. This script does match the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe). |
| △ Custom - Execute Script - Application Latest Version                                                       | Alert Template | This alert template is designed to be used with the [Internal Monitor - DUO Authentication - Latest Version Detection](https://proval.itglue.com/DOC-5078775-15897258) to run the script [Application - Latest Version Detection [Winget]](https://proval.itglue.com/DOC-5078775-14466237). |
| △ CUSTOM - Execute Script - DUO Install & Upgrade - Latest Version                                         | Alert Template | This alert template is designed to run the script [DUO Install/Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-9713528) with the [Monitor - DUO Authentication- Install/Update](https://proval.itglue.com/DOC-5078775-15683993). |

## Optional Content

| Content                                                                                                      | Type    | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472633)                   | Script  | Uninstalls DUO from windows machines.                                                                              |
| [CWM - Automate - Internal Monitor - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472632)        | Monitor | Detect machines where DUO is installed and Duo Exclusion EDfs are selected.                                       |
| `△ Custom - Execute Script - Uninstall DUO`                                                                 | Alert Template | Execute the script [CWM - Automate - Script - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472633) against the machines detected by the internal monitor. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - Import scripts
     - [Script - Application - Latest Version Detection [Winget]](https://proval.itglue.com/DOC-5078775-14466237)
     - [Script - DUO Install/Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-9713528)
   - Import monitors
     - [Internal Monitor - DUO Authentication - Latest Version Detection](https://proval.itglue.com/DOC-5078775-15897258)
     - [Internal Monitor - DUO Authentication - Install/Update](https://proval.itglue.com/DOC-5078775-15683993)
   - Import the Alert templates
     - `△ Custom - Execute Script - Application Latest Version`
     - `△ CUSTOM - Execute Script - DUO Install & Upgrade - Latest Version`

2. Reload the system cache:
   ![Reload System Cache](../../static/img/Duo-Authentication-for-Windows---UpdateDeployUninstall/image_1.png)

   Run the script against any online windows machine with the `Set_Environment` parameter set to `1` to create the EDFs used by the solution.  
   ![Run Script](../../static/img/Duo-Authentication-for-Windows---UpdateDeployUninstall/image_2.png)

3. Navigate to Automation → Monitors within the CWA Control Center and set up the following:
   - [Monitor - DUO Authentication - Latest Version Detection](https://proval.itglue.com/DOC-5078775-14466240)
     - Set up with the alert template `△ Custom - Execute Script - Application Latest Version`
     - Ensure the monitor is running monthly and not at a more frequent interval.
     - Right-click and Run Now and Reset Monitor after applying the alert template.
   - [Monitor - DUO Authentication- Install/Update](https://proval.itglue.com/DOC-5078775-15683993)
     - Apply the alert template `△ CUSTOM - Execute Script - DUO Install & Upgrade - Latest Version`
     - **NOTE**: Make sure to confirm the Latest Version Detection monitor has run and completed before enabling this monitor.
       - Right-click and Run Now after applying the alert template.

### Optional - Uninstall

Use the content below if the partner wants to uninstall DUO on Windows agents automatically. This will remove the application if the exclusion box has been checked on either the location or computer levels.

Import the following content using the ProSync Plugin:
- [CWM - Automate - Script - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472633)
- [CWM - Automate - Internal Monitor - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472632)
- `△ Custom - Execute Script - Uninstall DUO`

Configure the solution as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and set up the following:
  - [CWM - Automate - Internal Monitor - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472632)
    - Make Sure `△ Custom - Execute Script - Uninstall DUO` is applied on the monitor
      - And the alert template has the script [CWM - Automate - Script - Uninstall DUO](https://proval.itglue.com/DOC-5078775-17472633) bonded to it.
    - Right-click and Run Now to start the monitor.



