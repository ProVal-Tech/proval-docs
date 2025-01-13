---
id: 'cwa-cisco-secure-client-installation'
title: 'Cisco Secure Client Installation'
title_meta: 'Cisco Secure Client Installation'
keywords: ['cisco', 'vpn', 'installation', 'module', 'client']
description: 'This document provides a comprehensive guide on installing the Cisco Secure Client, including prerequisites, dependencies, user parameters, and detailed instructions for configuration and troubleshooting. It also covers the necessary steps to ensure successful deployment and management of the Cisco Secure Client modules.'
tags: ['installation', 'cisco', 'vpn', 'software', 'networking']
draft: false
unlisted: false
---
## Summary

An agnostic wrapper for the [SWM - Software Install - Agnostic - Install-CiscoSecureClient](https://proval.itglue.com/DOC-5078775-11897620)

**Note:** To install the Umbrella module, it is required to install the `Core VPN module`. The `Core VPN module` installation does not display in the system tray; only the essential components for installing the Umbrella module are installed, unless the `Show Core-VPN in System Tray` EDF is marked at the client-level.

**Requirement:** MySQL 8.0+

## Update Notification: January 2, 2023

We've introduced a new Client-Level DF called `Show Core-VPN in System Tray`. Enabling this EDF will make the Core VPN module visible in the system tray after installation. By default, the script installs the application without displaying it in the system tray.

After updating the script, it is essential to execute this script on a random online Windows machine with the `SetEnvironment` parameter set to `1`. This action will create the newly introduced EDF.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_1.png)

## Prerequisite

Download the `Cisco Secure Client Pre-Deployment Package (Windows) - includes individual MSI files` and place it in LTShare (WebDAV for hosted partners) at `LTShare\Transfer\Software\Cisco_Secure_Client` as `Cisco_Secure_Client.zip`.

**NOTE**  
To access/download these files, you will need a login to the Cisco portal. If you do not have a portal login, please create one and validate your access before attempting to download the files or you will get an error like this:  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_2.png)

The file can be downloaded from [Cisco Software Download](https://software.cisco.com/download/home/286330811/type/282364313/release/5.0.03076). Cisco changes this download URL for each release. Prefer downloading the latest stable version of the tool.  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_3.png)

If the `Cisco_Secure_Client` Directory does not exist in `LTShare\Transfer\Software` then create the directory and place the downloaded zip file in the directory as `Cisco_Secure_Client.zip`.  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_4.png)

It is mandatory to place the file at the mentioned directory with the mentioned name to use the script.

## Sample Run

- For the initial execution of the script, it is essential to set the user parameter `SetEnvironment` to `1`. This step is necessary to create the mandatory EDFs (Extra Data Fields) required for the script's execution.  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_1.png)

- To deploy application:  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_5.png)

## Dependencies

- [Install-Anyconnect Agnostic Script](https://proval.itglue.com/5078775/docs/11897620)

## Variables

| Name       | Description                                                  |
|------------|--------------------------------------------------------------|
| Parameter  | Parameter to pass to the agnostic script for installing the modules. |

## Global Variables

| Name                  | Default                                                                                                  | Required | Description                                                                                                                                                                                                                                                                                                           |
|-----------------------|----------------------------------------------------------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DownloadURL           | [https://%redirhostname%/labtech/transfer/software/cisco_secure_client/cisco_secure_client.zip](https://%redirhostname%/labtech/transfer/software/cisco_secure_client/cisco_secure_client.zip) | True     | Download URL to download the `Cisco_Secure_Client.zip` file from LTShare. Download URL should not be changed unless the installer cannot be placed in the LTshare and another download URL is available to download the installer.                                                                                |
| Ticket_On_Failure     | 0                                                                                                        | False    | Set it to '1' in order to receive tickets in case script fails to install the application                                                                                                                                                                                                                           |

## User Parameters

| Name           | Example | Required                       | Description                                                                                                                                                                                                              |
|----------------|---------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SetEnvironment  | 1       | True (For First Execution Only.) | For the initial execution of the script, it is essential to set the user parameter `SetEnvironment` to 1. This step is necessary to create the mandatory EDFs (Extra Data Fields) required for the script's execution. |

## EDFs

These client-level dropdown EDFs, which offer a **`yes/no`** option for installing the corresponding module, must be configured beforehand. These EDFs play a crucial role in the script's functionality and must be set appropriately.

| Name                                   | Level   | Type      | Example  | Description                                                                                                                                                                                                                                               |
|----------------------------------------|---------|-----------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Cisco Secure Client All Modules        | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install all available modules on the client's computers. Select `No` or Leave it blank to ignore the EDF.                                                                                                                     |
| Cisco Umbrella Module                  | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Cisco Umbrella module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                        |
| Core-VPN Module                        | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Core-VPN module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                            |
| Show Core-VPN in System Tray           | Client  | CheckBox  | Marked/Unmarked | Flag this EDF to show the Core VPN module in the system tray after installation. By default, the script installs the application without displaying it in the system tray.                                                                 |
| Diagnostic And Reporting Tool          | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Diagnostic And Reporting Tool module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                           |
| ISE Posture Module                     | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install ISE Posture module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                            |
| Network Access Manager Module          | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Network Access Manager module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                 |
| Network Visibility Module              | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Network Visibility module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                     |
| Start Before Login Module              | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install Start Before Login module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                     |
| VPN Posture - HostScan Module         | Client  | DropDown  | Yes/No   | Select `Yes` to deploy/install VPN Posture - HostScan Module on the client's computers. Select `No` or Leave it blank to disable the Module's deployment.                                                                                                  |
| Cisco Umbrella FingerPrint             | Client  | TextBox   | ae4871c4fb151e23 | To save the Cisco Umbrella FingerPrint for the client, it can be fetched from OrgInfo.json file. The Json file can be downloaded for each organization from the Cisco Secure Client Portal. It is mandatory to set this EDF to deploy the `Umbrella` module. |
| Cisco Umbrella OrgID                   | Client  | TextBox   | 15457482 | To save the Cisco Umbrella OrgID for the client, it can be fetched from OrgInfo.json file. The Json file can be downloaded for each organization from the Cisco Secure Client Portal. It is mandatory to set this EDF to deploy the `Umbrella` module.  |
| Cisco Umbrella UserID                  | Client  | TextBox   | 1254852  | To save the Cisco Umbrella UserID for the client, it can be fetched from OrgInfo.json file. The Json file can be downloaded for each organization from the Cisco Secure Client Portal. It is mandatory to set this EDF to deploy the `Umbrella` module.  |
| Exclude from Cisco Secure Client - Windows | Computer | Checkbox | -        | Select it to exclude the machine from Cisco Secure Client Deployment                                                                                                                                                                                      |

**All Applications:**  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_6.png)

**Sample Screenshot:**  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_7.png)

**Note:**  
- If you are setting `Yes` for `Cisco Secure Client All Modules` then the script will attempt to install all the available modules regardless of the selection for the individual module.
- It is mandatory to set the `Cisco Umbrella FingerPrint`, `Cisco Umbrella OrgID`, and `Cisco Umbrella UserID` if any of `Cisco Secure Client All Modules` and `Cisco Umbrella Module` is selected `yes` for installation.
- Flag the `Show Core-VPN in System Tray` EDF to show the Core VPN module in the system tray after installation. By default, the script installs the application without displaying it in the system tray.
- Choosing `Cisco Umbrella Module` will automatically install `Core-VPN Module` since it is must required to install umbrella module.

## Output

- Script log
- Ticketing

## Ticketing

**Subject:**  `Cisco Secure Client Installation Failed on %ComputerName%(%ComputerID%)`

**Possible Ticket Summary/Comments:**

**If script fails to install the application:**  
```
Failed to Install Cisco Secure Client on %computername% at %clientname%. Here are the results returned from the script:
@ErrorLog@

The PC information is outlined below:
PC Name: %computername%
Last Login: %lastuser%
PC model: @biosname@
OS: %os%
S/N OF PC: @biosver@
```

**If application installed successfully but needs reboot:**  
```
Application installed successfully but a reboot is needed to validate the installation of some module(s).
```

**If Security application interrupted the script execution:**  
```
Application installed successfully but a reboot is needed to validate the installation of some module(s).
```

**If DownloadURL is unreachable:**  
```
Please ensure placing the Cisco Secure Client in your LTShare or WebDAV folder at LTShare\Transfer\software\cisco_secure_client as cisco_secure_client.zip. If the file is placed then ensure that there is no firewall rule or AV program restricting the computer to reach @DownloadURL@.
```

## TicketCategory

The ticket category for the tickets generated by the script can be set at the following levels:

- On global monitor set. The ticket category can be selected at the monitor set ([ProVal - Production - Agents - Missing Cisco Secure Client Modules](https://proval.itglue.com/DOC-5078775-13582373)).  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_8.png)

- If ticket category is not set on the monitor, the ticket will be generated under the default ticket category.  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_9.png)

## Module Definitions

### Core-VPN
- Core-VPN must be installed with any additional module.
- All modules require that Core-VPN be installed.
- When only installing Core-VPN you can expect to see the following.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_10.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_11.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_12.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_13.png)  

### Start Before Login
- SBL stands for Start Before Login, it adds no direct user GUI, however it does add an entry into programs and features.
- It enables the execution of the AnyConnect VPN prior to a user being logged in.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_14.png)

### Diagnostic and Reporting Tool
- DART stands for Diagnostics and Reporting Tool.
- When installing this you can expect to see the following items.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_15.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_16.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_17.png)

### Network Access Manager
- NAM stands for Network Access Manager
- When installing this module you can expect to see the following items.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_18.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_19.png)

### Network Visibility Module
- NVM stands for Network Visibility Manager
- Network Visibility Manager does not include a GUI but does the following
- Network Visibility Manager **helps you see user and endpoint behavior both on and off premises**. It collects standard flows from endpoints (laptops, for example) along with context like user, application, device, location, and destination information.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_20.png)

### VPN Posture - HostScan Module
- Posture provides the Cisco AnyConnect Secure Mobility Client with the ability to assess an endpoint's compliance for things like antivirus, antispyware, and firewall software installed on the host.
- It does not provide a User GUI.

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_21.png)

### ISE Posture
- ISE Posture provides the Cisco AnyConnect Secure Mobility Client with the ability to assess an endpoint's compliance for things like antivirus, antispyware, and firewall software installed on the host, with a user GUI interface.
- When installing this module, you can expect to see the following:

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_22.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_23.png)

### Umbrella
- Umbrella installs the Cisco Umbrella module.
- When installing this module you can expect to see the following:

![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_24.png)  
![Image](..\..\..\static\img\Cisco-Secure-Client---Package-Installation-Windows\image_25.png)

## Uninstalling

- When uninstalling this package, you can simply uninstall the Core-Vpn module and it will remove all embedded modules except for the DART module, that module will have to be removed separately.

## FAQ

- Will this installation update older versions of Cisco AnyConnect?  
  - Yes, each requested component will be updated if run against a machine that has that component already installed. Components that are not requested will not be updated.


