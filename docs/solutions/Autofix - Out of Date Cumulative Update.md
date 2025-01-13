---
id: 'rmm-out-of-date-cumulative-update-autofix'
title: 'Out of Date Cumulative Update Autofix'
title_meta: 'Out of Date Cumulative Update Autofix'
keywords: ['cumulative', 'update', 'autofix', 'windows', 'reboot']
description: 'This document outlines the solution for installing and reporting the most recent Cumulative Update (CU) on computers that have not had a CU installed in the last 75 days. It details the implementation of the Reboot Prompter solution for managing reboots on workstations and servers, and specifies the supported operating systems.'
tags: ['windows', 'update', 'reboot', 'configuration', 'software']
draft: false
unlisted: false
---
## Purpose

The solution's objective is to install and report the most recent Cumulative Update (CU) on computers where a CU has not been installed within the last 75 days.

It will utilize the [Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298946) solution to handle prompting and rebooting for workstations while allowing servers to manage their reboot process.

The solution will only work for the following Operating Systems:  
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
| [Latest Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029448) | Solution | Performs an Audit of the computers where a CU has not been installed within the last 75 days.                    |
| [Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298946)     | Solution | Handles prompting and rebooting for workstations                                                                  |

#### Custom Field

| Content                                                                 | Type     | Level   | Function                                                                                                                                                                                                                      |
|-------------------------------------------------------------------------|----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259) | Dropdown | Company | Select Enable from the drop-down to allow installation of the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. Selecting Servers as well will enable Autofix for the servers too. |
| [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748260) | Dropdown | Site    | Select the Out of Date Cumulative Update Autofix setting for the site. Available options are `Disable`, `Disable for Servers`, `Enable for Servers` and `Enable`. This Custom field provides an option to manage the Autofix for the site or to override the option set in the company level Custom Field. |
| [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748262) | Dropdown | Endpoint | Use the dropdown menu to enable or disable the autofix on the endpoint. This setting will be forcefully applied to the machine regardless of the options selected at the Company or the Site level custom field Out_of_Date_CU_Autofix. |
| [Out_of_Date_CU_Autofix_Result](https://proval.itglue.com/DOC-5078775-15748265) | Text     | Endpoint | Stores the output of the Out of Date Cumulative Update (Autofix) task.                                                                                                                                                     |
| [Out_of_Date_CU_Autofix_Date](https://proval.itglue.com/DOC-5078775-15748263) | Text     | Endpoint | Stores the install date of the latest CU performed by the Out of Date Cumulative Update (Autofix) task.                                                                                                                   |

#### Device Group

| Content                                                                  | Type    | Function                                                                                                        |
|--------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date CU _ Autofix Required](https://proval.itglue.com/DOC-5078775-15748268) | Dynamic | Detect the computers where the Latest Cumulative Update Custom Field contains failed, indicating that the machine has not installed a Cumulative Update in the past 75 days. |
| [Out of Date CU _ Reboot Pending](https://proval.itglue.com/DOC-5078775-15748267)  | Dynamic | Detect the computers where Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.                         |
| [Out of Date CU _ Install Failure](https://proval.itglue.com/DOC-5078775-15748269)  | Dynamic | Detect the computers where the Latest Cumulative Update installation failed to complete after reboot.                                                        |

#### Task

| Content                                                                  | Type         | Function                                                                                                        |
|--------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------|
| [Out of Date Cumulative Update (Autofix)](https://proval.itglue.com/DOC-5078775-15748270) | Script Editor | Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days. |
| [Out of Date Cumulative Update (Post Reboot Verification)](https://proval.itglue.com/DOC-5078775-15748271) | Script Editor | This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded or not post-reboot. |

#### Miscellaneous

| Content                                                                  | Type               | Function                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Windows OS Support Date](https://proval.itglue.com/DOC-5078775-15739309) | ITGlue Document     | Stores the release and support date of different versions of windows operating system. It works in the same way for CW RMM as the [plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) custom table works for CW Automate. |

## Implementation

1. Import and implement the following solutions:  
   - [Latest Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029448)  
   - [Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298946)  

2. Create the following custom fields:  
   - Company - [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259)  
   - Site - [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748260)  
   - Endpoint - [Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748262)  
   - Endpoint - [Out_of_Date_CU_Autofix_Result](https://proval.itglue.com/DOC-5078775-15748265)  
   - Endpoint - [Out_of_Date_CU_Autofix_Date](https://proval.itglue.com/DOC-5078775-15748263)  

3. Create the following Device groups:  
   - [Out of Date CU _ Autofix Required](https://proval.itglue.com/DOC-5078775-15748268)  
   - [Out of Date CU _ Reboot Pending](https://proval.itglue.com/DOC-5078775-15748267)  
   - [Out of Date CU _ Install Failure](https://proval.itglue.com/DOC-5078775-15748269)  

4. Create and deploy the following tasks:  
   - [Out of Date Cumulative Update (Autofix)](https://proval.itglue.com/DOC-5078775-15748270)  
   - [Out of Date Cumulative Update (Post Reboot Verification)](https://proval.itglue.com/DOC-5078775-15748271)  


