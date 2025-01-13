---
id: 'vsa-install-nessus-vuln-scanner'
title: 'Install NESSUS Vulnerability Scanner'
title_meta: 'Install NESSUS Vulnerability Scanner'
keywords: ['install', 'scanner', 'nessus', 'vulnerability', 'agent']
description: 'This document provides a comprehensive guide on installing the NESSUS vulnerability scanner, including sample runs, variable definitions, global parameters, and a detailed process for successful installation.'
tags: ['installation', 'software', 'security', 'download', 'error', 'setup']
draft: true
unlisted: true
---
## Summary

This script installs the NESSUS vuln Scanner

## Sample Run

![Sample Run](../../static/img/SWM---Software-Install---Client-Specific---Vuln-Scanner---Install/image_1.png)

## Variables

| Name              | Description                                                                                                   |
|-------------------|---------------------------------------------------------------------------------------------------------------|
| LocalFileName     | The downloaded file name on the target machine.                                                              |
| LocalPath         | The full path including filename for the installer.                                                          |
| Nessus_Server     | The server information needed when specifying `Nessus_server=` in the msi command.                          |
| Application Name  | The application Name as seen in the programs and features list.                                             |
| ErrorMessage      | The current Error message if applicable.                                                                     |

#### Global Parameters

| Name          | Example                                                                                                     | Required | Description                                                                      |
|---------------|-------------------------------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------|
| NESSUS_Key    | 54654d23156423asfd15642615af646587432184c                                                                  | True     | The NESSUS key assigned to the required instance                                 |
| NESSUS_Prefix | xxxxxxxxx-xx-xxxxxxx-xxxx-xxx-xxxx_                                                                        | True     | The prefix to the computer name when entering `NESSUS_Name`, should end with _. |
| DownloadURL   | [Download URL](https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/17228/download?i_agree_to_tenable_license_agreement=true) | True     | The Download URL for the Nessus agent. Will need to change with future versions. |

## Process

1. Set up any variables.
2. Check for the downloaded file (c:/temp folder item); if it exists, go to step 6.
3. Download the msi installer.
4. Check for the downloaded file (c:/temp folder item); if it exists, go to step 6.
5. Log an error and exit with error.
6. Run msiexec to install the application.
7. Wait 5 seconds to complete.
8. Resend the software list.
9. If Nessus Agent (x64) is a valid software in the software list, go to step 11.
10. Log an error and exit with error.
11. Log success and exit.




