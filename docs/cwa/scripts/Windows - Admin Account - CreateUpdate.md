---
id: 'cwa-set-admin-account'
title: 'Set Admin Account Script'
title_meta: 'Set Admin Account Script for Windows Machines'
keywords: ['admin', 'user', 'domain', 'password', 'credentials']
description: 'This document provides a detailed overview of the Set Admin Account script, which creates or updates a target admin user on a domain controller or local machine and saves the credentials to the passwords list for the Automate client. It includes usage instructions, parameter details, update notices, and sample runs.'
tags: ['windows', 'configuration', 'security', 'update', 'software']
draft: false
unlisted: false
---
## Summary

This script creates or updates a target admin user on a domain controller or local machine and saves the credentials to the passwords list for the Automate client.

The script is executed by [Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629) and [Windows Domain Admin Account Process](https://proval.itglue.com/DOC-5078775-13280312) monitor sets or can be executed manually at the same time.  

**File Path:** `C:\ProgramData\_Automation\Script\Set-AdminAccount\Set-AdminAccount.ps1`  
**File Hash (SHA256):** `B33EBE5272A3ABDFBF99F1B480D91D4B4EE84503B97B5278684BB387D3D9F651`  
**File Hash (MD5):** `4F32BDEAD80E3967CE434F14C12CB43F`

**Note:**  
- Password verification function will not be performed for the computers with PowerShell version older than 5.
- Ensure that the password title stored in system properties and EDFs does not exceed 48 characters.
- When creating a computer-level local user account, the script appends the computer name to the end of the password title for saving the password entry. Therefore, keep the password title in system properties or EDFs as concise as possible to accommodate this addition.

## Update Notice: 06-November-2024

A new system property and EDF has been introduced for setting password to never expire. Update the [Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) script from the `Prosync` plugin.

Run/debug against an online Windows machine with `SetEnvironment_Local_Admin_Process` as `1` to implement the changes for the [Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633) solution.  
![Image](https://proval.itglue.com/..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_1.png)

## Update Notice: 27-September-2024

The solution's Extra Data Fields have been renamed. Update the [Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) script from the `Prosync` plugin.

Run/debug against an online Windows machine with `SetEnvironment_Local_Admin_Process` as `1` to implement the changes for the [Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633) solution.  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_1.png)

Run/debug against an online Windows machine with `SetEnvironment_Domain_Admin_Process` as `1` to implement the changes for the [Windows Domain Admin Process](https://proval.itglue.com/DOC-5078775-13280371) solution.  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_2.png)

## Sample Run

- Running the script with the user parameter `SetEnvironment_Local_Admin_Process` as `1` will import the EDFs and System Properties needed for the implementation of [Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633) solution.  
  ![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_3.png)
  
- Running the script with the user parameter `SetEnvironment_Domain_Admin_Process` as `1` will import the EDFs and System Properties needed for the implementation of [Windows Domain Admin Process](https://proval.itglue.com/DOC-5078775-13280371) solution.  
  ![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_2.png)

- During manual script execution, if either the `username` or `title` parameter is not provided, the script will automatically fallback to the Client-Level Extra Data Fields (EDFs) and system properties to retrieve the relevant username and title information. This fallback mechanism ensures seamless functionality and avoids any disruptions caused by missing parameters.  
  Example:  
  ![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_4.png)  
  ![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_5.png)

## Dependencies

- [EPM - Windows Configuration - Internal Monitor - Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629)  
- [EPM - Windows Configuration - Internal Monitor - Windows Domain Admin Account Process](https://proval.itglue.com/DOC-5078775-13280312)

## Global Parameters

| Name                          | Default | Required | Description                                                                 |
|-------------------------------|---------|----------|-----------------------------------------------------------------------------|
| MinimumPasswordLength         | 16      | True     | Minimum length of password to create.                                      |
| ScriptEngineEnableLogger      | 0       | True     | Disabling the logging, so that script does not accidentally print the password in script logs. |
| CreateTicketOnFailure         | 0       | False    | 0 and 1 to toggle ticket creation for the script failing to create/update the concerned user account. |

## User Parameters

| Name                               | Example | Required | Description                                                                                                   |
|------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------|
| Username                           | user1   | False    | The username you want to create or update.                                                                   |
| Title                              | XYZ local or Domain admin | False    | The title of the password entry in the table to update or create.                                           |
| SetEnvironment_Local_Admin_Process | 1       |          | To set the environment for the [Solution - Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633). Running the script with the user parameter `SetEnvironment_Local_Admin_Process` as `1` will import the EDFs and System Properties needed for the implementation of [Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633) solution. |
| SetEnvironment_Domain_Admin_Process| 1       |          | To set the environment for the [Solution - Windows Domain Admin Process](https://proval.itglue.com/DOC-5078775-13280371). Running the script with the user parameter `SetEnvironment_Domain_Admin_Process` as `1` will import the EDFs and System Properties needed for the implementation of [Windows Domain Admin Process](https://proval.itglue.com/DOC-5078775-13280371) solution. |

**Note:** Script will only import the EDFs and System Properties for one solution at a time. Script needs to be executed twice to import the EDFs and System Properties for both solutions. Once with `SetEnvironment_Local_Admin_Process` as `1` and once with `SetEnvironment_Domain_Admin_Process` as `1`.

## Script State

| Name   | Default | Required | Description                                                                                                         |
|--------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| Title  | NULL    | True     | Used to save the password set time. So, that monitor set can use this script state to determine the age of the set password. The name of the script state will be the same as that of the password title. It can vary per client/computer. Depends on the EDFs configuration. |

## Local Admin Process System Properties

| Name                                         | Default                       | Required | Description                                                                                                                                                 |
|----------------------------------------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Default_Local_Admin_Account                  | CW_Automate                   | True     | Default Local Admin Account's user name. If the user parameter `username` is not set and client level EDF `1c. UserName` is blank as well, then the script will use the value set in this system property. |
| Default_Local_Admin_Password_Title           | CW-Automate Local Admin       | True     | Default Title of the password entry in the table to update or create. If the user parameter `title` is not set and client-level EDF `1e. Password Title` is blank as well, then the script will use the value set in this system property. |
| Default_Local_Admin_Password_Change_Days    | 45                            | True     | Default Number of days to update the password after. It can be overridden by the client-level EDF `1f. Change Password After__Days`.                     |
| Default_Local_Admin_Display_Name              | CW Automate                   | True     | Default Display Name of the user. Displays on the logon screen at end machine.                                                                              |
| Default_Local_Admin_Password_Change_Notification_Client | 0                     | False    | Setting this value to 1 will ensure the client receives a notification when the password gets automatically rotated. This only works for client-level passwords. This is required for this script to function: [Windows - Admin Account Password Rotation Notification](https://proval.itglue.com/DOC-5078775-14357326) |
| Default_Local_Admin_Password_Change_Notification_Email  | <blank>              | False    | Setting an email address in this field will ensure an email gets sent out when the password gets auto-rotated.                                          |
| Default_Local_Admin_Password_Never_Expire    | 0                             | False    | Setting the value to 1 will ensure the password never expire property of the created user is enabled.                                                     |

![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_6.png)

## Local Admin Process EDFs

| Name                                     | Type      | Form    | Description                                                                                                                                                                                                 |
|------------------------------------------|-----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1a. Local Admin Process                  | dropdown  | Client  | Selecting the `Enabled for Servers and Workstations` option will enable the [Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629) internal monitor for all machines of the client. <br> Available Options: Not Enabled, Enabled for Workstations Only, Enabled for Servers and Workstations. Default Option: Not Enabled. Leaving it unset is equivalent to not enabling the auto local admin creation for the client. |
| 1b. UserName                             | Text      | Client  | Username of the local admin account to create for the Windows machines of the client. The script will use this username if the `username` parameter is not set during execution. This EDF is used by the internal monitor as well. |
| 1c. Local Admin Display Name             | Text      | Client  | Display Name of the user to set at the end machine.                                                                                                                                                       |
| 1d. Password Title                       | Text      | Client  | Title of the password entry to set/update at the client's password tab. Script will use this title if the `title` parameter is not set during execution.                                                   |
| 1e. Change Password After_Days           | Text      | Client  | Number of days after the user creation to update/change the password.                                                                                                                                   |
| 1f. User Level                           | DropDown  | Client  | Available options are `Client` and `Computer`. If `Client` is selected then the password entry created on the client's password tab would be the exact password title. For `Computer`, `<ComputerName>` will be added to the password title. For `Client`, all the computers at the client will share the very same credential. For `Computer`, an individual credential/password per computer will be created. |
| 1g. Password Never Expire                | Check Box | Client  | Once this EDF is marked, the local user created by the script will have the password set to never expire.                                                                                               |
| Local Admin Process Exclusion             | Check Box | Computer| Marking this checkbox will exclude the computer from Automation. Monitor set will not execute the script on this machine anymore. Yet the script can be executed manually. It is placed in the `Exclusions` tab. |
| Local Admin Process Exclusion             | Check Box | Location| Marking this checkbox will exclude all the computers of this location from Automation. Monitor set will not execute the script on these machines anymore. Yet the script can be executed manually. It is placed in the `Exclusions` tab. |

**Example:**  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_7.png)  
For the configuration shown in the screenshot, the solution will create `AutomateTestAccount` user against all `Windows Workstations`. Password will be saved at the client's password tab with the title `Automate Test Account - 6-3-2024` and display name `Automate Test Account`. Password for each computer will be updated once per `60` days.  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_8.png)

**Note:** Updating the password in the respective password entry will re-run the script against the computer (or against all computers at the client, if it's a client-level password), within 2 hours of the update.

## Domain Admin Process EDFs

| Name                                     | Type      | Form    | Description                                                                                                                                                                                                 |
|------------------------------------------|-----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1a. Enable Domain Admin Process          | CheckBox  | Client  | It is mandatory to mark this EDF to enable the [Internal Monitor - Windows Domain Admin Account Process](https://proval.itglue.com/DOC-5078775-13280312) monitoring for the client. Though the script can still be executed manually. |
| 1b. Domain Admin UserName                | Text      | Client  | Username of the domain admin account to create for the Windows machines of the client. The script will use this username if the `username` parameter is not set during execution. This EDF is used by the internal monitor as well. |
| 1c. Domain Admin Password Title           | Text      | Client  | Title of the password entry to set/update at the client's password tab. Script will use this title if the `title` parameter is not set during execution.                                                   |
| 1d. Update Password After_Days           | Text      | Client  | Number of days after the user creation to update/change the password.                                                                                                                                   |
| Domain Admin Process Exclusion           | CheckBox  | Computer| Marking this checkbox will exclude the domain controller from Automation. Monitor set will not execute the script on this domain controller anymore. Yet the script can be executed manually. It is placed in the `Exclusions` tab. This EDF can be useful in case of multiple domains at a client, and the partner would like to exclude one of the domains from the process. In such scenario, the partner can mark this exclusion EDF on all the domain controllers of the domain to exclude. |

**Example:**  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_9.png)  
For the configuration shown in the screenshot, the solution will create `Ram_Test_Account` domain admin account and the credentials will be saved at the client's password tab with the title `Domain Admin - <Domain>`. Password will be updated once per `60` days.  
![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_10.png)

**Note:** Updating the password in the respective password entry will re-run the script against the domain controller within 2 hours of the update.

## Domain Admin Process System Properties

| Name                                      | Default                       | Required | Description                                                                                                                                                 |
|-------------------------------------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Default_Domain_Admin_Account              | CW_Automate                   | True     | Default Domain Admin Account's user name. If the user parameter `username` is not set and client level EDF `1b. Domain Admin UserName` is blank as well, then the script will use the value set in this system property. |
| Default_Domain_Admin_Password_Title       | CW-Automate Domain Admin      | True     | Default Title of the password entry in the table to update or create. If the user parameter `title` is not set and client level EDF `1c. Domain Admin Password Title` is blank as well, then the script will use the value set in this system property. (Domain Name will be added to the end of the title while storing it to the passwords tab. e.g., CW-Automate Domain Admin - [testdomain.local](http://testdomain.local)) |
| Default_Domain_Admin_Password_Change_Days| 45                            | True     | Default Number of days to update the password after. It can be overridden by the client-level EDF `1d. Update Password After_Days`.                     |

![Image](..\..\..\static\img\Windows---Admin-Account---CreateUpdate\image_11.png)

## Output

- Ticket (If Enabled)
- Script log

## Ticketing

**Subject:** `<ComputerName>: Windows - Admin Account - Create/Update - Failed`  

**Body:**  
``` 
Automate attempted to create/update the admin account <username> but failed. 
Attempted credentials are saved as <Title> at passwords tab of the client in Automate.
```
```
Account Creation/Update Output: <Output of the PowerShell Script>
```



