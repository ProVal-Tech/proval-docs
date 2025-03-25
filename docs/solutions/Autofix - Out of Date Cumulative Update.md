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

It will utilize the [Reboot Prompter](<./Reboot Prompter.md>) solution to handle prompting and rebooting for workstations while allowing servers to manage their reboot process.

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
| [Latest Cumulative Update Audit](<./Latest Cumulative Update Audit.md>) | Solution | Performs an audit of the computers where a CU has not been installed within the last 75 days.                    |
| [Reboot Prompter](<./Reboot Prompter.md>)     | Solution | Handles prompting and rebooting for workstations                                                                  |

#### Custom Field

| Content                                                                 | Type     | Level   | Function                                                                                                                                                                                                                      |
|-------------------------------------------------------------------------|----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/Company - Out_of_Date_CU_Autofix.md>) | Dropdown | Company | Select "Enable" from the drop-down to allow installation of the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. Selecting "Servers" as well will enable Autofix for the servers too. |
| [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/Site - Out_of_Date_CU_Autofix.md>) | Dropdown | Site    | Select the Out of Date Cumulative Update Autofix setting for the site. Available options are `Disable`, `Disable for Servers`, `Enable for Servers`, and `Enable`. This custom field provides an option to manage the Autofix for the site or to override the option set in the company-level custom field. |
| [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix.md>) | Dropdown | Endpoint | Use the dropdown menu to enable or disable the autofix on the endpoint. This setting will be forcefully applied to the machine regardless of the options selected at the Company or the Site level custom field. |
| [Out_of_Date_CU_Autofix_Result](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix_Result.md>) | Text     | Endpoint | Stores the output of the Out of Date Cumulative Update (Autofix) task.                                                                                                                                                     |
| [Out_of_Date_CU_Autofix_Date](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix_Date.md>) | Text     | Endpoint | Stores the install date of the latest CU performed by the Out of Date Cumulative Update (Autofix) task.                                                                                                                   |

#### Device Group

| Content                                                                  | Type    | Function                                                                                                        |
|--------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date CU _ Autofix Required](<../cwrmm/groups/Out of Date CU _ Autofix Required.md>) | Dynamic | Detects the computers where the Latest Cumulative Update custom field contains "failed," indicating that the machine has not installed a Cumulative Update in the past 75 days. |
| [Out of Date CU _ Reboot Pending](<../cwrmm/groups/Out of Date CU _ Reboot Pending.md>)  | Dynamic | Detects the computers where a Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.                         |
| [Out of Date CU _ Install Failure](<../cwrmm/groups/Out of Date CU _ Install Failure.md>)  | Dynamic | Detects the computers where the Latest Cumulative Update installation failed to complete after reboot.                                                        |

#### Task

| Content                                                                  | Type         | Function                                                                                                        |
|--------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date Cumulative Update (Autofix)](<../cwrmm/tasks/Out of Date Cumulative Update (Autofix).md>) | Script Editor | Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. |
| [Out of Date Cumulative Update (Post Reboot Verification)](<../cwrmm/tasks/Out of Date Cumulative Update (Post Reboot Verification).md>) | Script Editor | This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded or not post-reboot. |

#### Miscellaneous

| Content                                                                  | Type               | Function                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Windows OS Support Date](https://proval.itglue.com/DOC-5078775-15739309) | ITGlue Document     | Stores the release and support date of different versions of the Windows operating system. It works in the same way for CW RMM as the [plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) custom table works for CW Automate. |

## Implementation

1. Import and implement the following solutions:  
   - [Latest Cumulative Update Audit](<./Latest Cumulative Update Audit.md>)  
   - [Reboot Prompter](<./Reboot Prompter.md>)  

2. Create the following custom fields:  
   - Company - [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/Company - Out_of_Date_CU_Autofix.md>)  
   - Site - [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/Site - Out_of_Date_CU_Autofix.md>)  
   - Endpoint - [Out_of_Date_CU_Autofix](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix.md>)  
   - Endpoint - [Out_of_Date_CU_Autofix_Result](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix_Result.md>)  
   - Endpoint - [Out_of_Date_CU_Autofix_Date](<../cwrmm/custom-fields/EndPoint - Out_of_Date_CU_Autofix_Date.md>)  

3. Create the following device groups:  
   - [Out of Date CU _ Autofix Required](<../cwrmm/groups/Out of Date CU _ Autofix Required.md>)  
   - [Out of Date CU _ Reboot Pending](<../cwrmm/groups/Out of Date CU _ Reboot Pending.md>)  
   - [Out of Date CU _ Install Failure](<../cwrmm/groups/Out of Date CU _ Install Failure.md>)  

4. Create and deploy the following tasks:  
   - [Out of Date Cumulative Update (Autofix)](<../cwrmm/tasks/Out of Date Cumulative Update (Autofix).md>)  
   - [Out of Date Cumulative Update (Post Reboot Verification)](<../cwrmm/tasks/Out of Date Cumulative Update (Post Reboot Verification).md>)  




