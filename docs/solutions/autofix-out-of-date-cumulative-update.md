---
id: '6a70396e-c7cc-49d4-9a06-620e2bd462e9'
slug: /6a70396e-c7cc-49d4-9a06-620e2bd462e9
title: 'Autofix - Out of Date Cumulative Update'
title_meta: 'Autofix - Out of Date Cumulative Update'
keywords: ['cumulative', 'update', 'autofix', 'windows', 'reboot']
description: 'This document outlines the solution for installing and reporting the most recent Cumulative Update (CU) on computers that have not had a CU installed in the last 75 days. It details the implementation of the Reboot Prompter solution for managing reboots on workstations and servers, and specifies the supported operating systems.'
tags: ['reboot', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The objective of this solution is to install and report the most recent Cumulative Update (CU) on computers where a CU has not been installed within the last 75 days.

It will utilize the [Reboot Prompter](/docs/5b376f62-e977-4feb-b523-b133d2ef5722) solution to handle prompting and rebooting for workstations while allowing servers to manage their reboot process.

The solution will only work for the following operating systems:  
- Microsoft Windows 10  
- Microsoft Windows 11  
- Microsoft Windows Server 2016  
- Microsoft Windows Server 2019  
- Microsoft Windows Server 2022  

It will not work for any out-of-support feature builds of Windows 10 and 11 machines.

## Associated Content

#### Solution

| Content                                                                 | Type    | Function                                                                                                          |
|-------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------|
| [Latest Cumulative Update Audit](/docs/8f2741e6-ef04-4a1e-804d-f481469e8beb) | Solution | Performs an audit of the computers where a CU has not been installed within the last 75 days.                    |
| [Reboot Prompter](/docs/5b376f62-e977-4feb-b523-b133d2ef5722)     | Solution | Handles prompting and rebooting for workstations                                                                  |

#### Custom Field

| Content                                                                 | Type     | Level   | Function                                                                                                                                                                                                                      |
|-------------------------------------------------------------------------|----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206) | Dropdown | Company | Select "Enable" from the drop-down to allow installation of the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. Selecting "Servers" as well will enable Autofix for the servers too. |
| [Out_of_Date_CU_Autofix](/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a) | Dropdown | Site    | Select the Out of Date Cumulative Update Autofix setting for the site. Available options are `Disable`, `Disable for Servers`, `Enable for Servers`, and `Enable`. This custom field provides an option to manage the Autofix for the site or to override the option set in the company-level custom field. |
| [Out_of_Date_CU_Autofix](/docs/a9e84f5a-0afa-44ef-98b7-c5a70f6a25ea) | Dropdown | Endpoint | Use the dropdown menu to enable or disable the autofix on the endpoint. This setting will be forcefully applied to the machine regardless of the options selected at the Company or the Site level custom field. |
| [Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523) | Text     | Endpoint | Stores the output of the Out of Date Cumulative Update (Autofix) task.                                                                                                                                                     |
| [Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4) | Text     | Endpoint | Stores the install date of the latest CU performed by the Out of Date Cumulative Update (Autofix) task.                                                                                                                   |

#### Device Group

| Content                                                                  | Type    | Function                                                                                                        |
|--------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date CU _ Autofix Required](/docs/7ef49988-2b75-441e-9373-bda734a03ea1) | Dynamic | Detects the computers where the Latest Cumulative Update custom field contains "failed," indicating that the machine has not installed a Cumulative Update in the past 75 days. |
| [Out of Date CU _ Reboot Pending](/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d)  | Dynamic | Detects the computers where a Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.                         |
| [Out of Date CU _ Install Failure](/docs/12423bcf-17d9-417e-ad6e-b862dd04f184)  | Dynamic | Detects the computers where the Latest Cumulative Update installation failed to complete after reboot.                                                        |

#### Task

| Content                                                                  | Type         | Function                                                                                                        |
|--------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date Cumulative Update (Autofix)](/docs/1d9dbd69-f735-4129-8c9d-e72430313371) | Script Editor | Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. |
| [Out of Date Cumulative Update (Post Reboot Verification)](/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71) | Script Editor | This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded or not post-reboot. |

#### Miscellaneous

| Content                                                                  | Type               | Function                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Windows OS Support Date](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) custom table works for CW Automate. |

## Implementation

1. Import and implement the following solutions:  
   - [Latest Cumulative Update Audit](/docs/8f2741e6-ef04-4a1e-804d-f481469e8beb)  
   - [Reboot Prompter](/docs/5b376f62-e977-4feb-b523-b133d2ef5722)  

2. Create the following custom fields:  
   - Company - [Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206)  
   - Site - [Out_of_Date_CU_Autofix](/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a)  
   - Endpoint - [Out_of_Date_CU_Autofix](/docs/a9e84f5a-0afa-44ef-98b7-c5a70f6a25ea)  
   - Endpoint - [Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)  
   - Endpoint - [Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4)  

3. Create the following device groups:  
   - [Out of Date CU _ Autofix Required](/docs/7ef49988-2b75-441e-9373-bda734a03ea1)  
   - [Out of Date CU _ Reboot Pending](/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d)  
   - [Out of Date CU _ Install Failure](/docs/12423bcf-17d9-417e-ad6e-b862dd04f184)  

4. Create and deploy the following tasks:  
   - [Out of Date Cumulative Update (Autofix)](/docs/1d9dbd69-f735-4129-8c9d-e72430313371)  
   - [Out of Date Cumulative Update (Post Reboot Verification)](/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71)  



