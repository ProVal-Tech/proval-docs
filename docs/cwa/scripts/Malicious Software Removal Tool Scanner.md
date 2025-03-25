---
id: '18a8b802-bc6a-42a8-859b-89c93fed4257'
slug: /18a8b802-bc6a-42a8-859b-89c93fed4257
title: 'Malicious Software Removal Tool Scanner'
title_meta: 'Malicious Software Removal Tool Scanner'
keywords: ['download', 'microsoft', 'malicious', 'software', 'removal', 'tool', 'scanner', 'log', 'email', 'autofix']
description: 'This document outlines a script that downloads and executes the latest version of the Microsoft Malicious Software Removal Tool Scanner. It logs the results and sends an email with the outcome to specified addresses, and it also includes an option for automatic infection resolution.'
tags: ['email', 'logging', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will download and run the latest version of the Microsoft Malicious Software Removal Tool Scanner, logging the results and emailing them to the specified email address. It also provides an option to perform an autofix for any detected infections.

Please get the following file hashes approved for this script to work if the environment has a security block application:

- `ED06AECD5686944B0A5E5D76C1E7A9EA` --> Audit MSRT.ps1 script
- `C8759C7E4979819C0BB39DAF4DC64124` --> MSRTAutofix.ps1 script

## Sample Run

Run with `SetEnvironment = 1` to set the EDFs the first time this script is imported.

![Sample Run Image 1](../../../static/img/Malicious-Software-Removal-Tool-Scanner/image_1.png)

After the `SetEnvironment` is set, please refer to the sample execution.

![Sample Run Image 2](../../../static/img/Malicious-Software-Removal-Tool-Scanner/image_2.png)

## Variables

| Name        | Description                                         |
|-------------|-----------------------------------------------------|
| ScanResult  | This stores the scan result of the Malicious Software Removal Tool. |

## EDF

| Name                     | Level   | Section | Type  | Editable | Description                                                                                                                                               |
|--------------------------|---------|-------|-------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| MSRT Scanner Enable      | Client  |Software | Checkbox | Yes      | This EDF check will enable the MSRT scan automation via the [Internal Monitor - MSRT Scanner Execute](<../monitors/MSRT Scanner Execute.md>).           |
| MSRT Scanner Exclude     | Location| Exclusions | Checkbox  | Yes      | This EDF check will exclude the location from the MSRT scan automation via the [Internal Monitor - MSRT Scanner Execute](<../monitors/MSRT Scanner Execute.md>). |
| MSRT Scanner Exclude     | Computer| Exclusions | Checkbox  | Yes      | This EDF check will exclude the computer from the MSRT scan automation via the [Internal Monitor - MSRT Scanner Execute](<../monitors/MSRT Scanner Execute.md>). |
| MSRT Scanner Result      | Computer | Software | Text  | No       | This EDF stores the scan result, conclusive output, and date when the scanning occurred in the format example: "Infection Not Found -- M/DD/YYYY hh:mm:ss". |

#### User Parameters

| Name                        | Example                                                 | Required | Description                                                                                                                                                                                                                       |
|-----------------------------|---------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Send_ScanReport_To_Email    | [abc@test.com](mailto:abc@test.com); [xyz@test.com](mailto:xyz@test.com) | False    | This stores the email addresses of users to whom the scan report of MSRT needs to be sent. Use a semicolon (;) to separate multiple email addresses so that a report can be sent to multiple users at a time.                   |
| Allow_Autofix               | 1                                                       | False    | If this user parameter is set to 1, then if an infection is detected, the MSRT /F:Y (force scan and automatic cleaning of infection) will be scheduled.                                                                       |
| SetEnvironment               | 1                                                       | False    | If this is set, then it will import the EDFs.                                                                                                                                                                            |

## Global Parameter

| Name                          | Example | Required | Description                                                                                                                                               |
|-------------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Email_On_No_Infection         | 1 or 0  | False    | If set to 1, the user will receive an email for the no infection message with the attached report.                                         |

## Output

- Script log
- Local file on the computer: `C:/WINDOWS/debug/mrt.log`


