---
id: 'cwa-add-remove-wifi-profile'
title: 'Add and Remove Wi-Fi Profiles Script'
title_meta: 'Add and Remove Wi-Fi Profiles Script for Automate'
keywords: ['wifi', 'profiles', 'script', 'automate', 'network']
description: 'This document details a script for adding and removing Wi-Fi profiles on targeted machines using ConnectWise Automate. It provides instructions on how to supply profile names for addition and removal, along with examples, dependencies, and user parameters.'
tags: ['networking', 'configuration', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script is an Automate implementation of the [Add-WifiProfile](https://proval.itglue.com/DOC-5078775-16088530) and [Remove-WifiProfile](https://proval.itglue.com/DOC-5078775-16088533) agnostic scripts.

The script can both remove and add Wi-Fi profiles on the targeted machines. To initiate removal, the names of the desired Wi-Fi profiles are to be supplied to the script parameter named `Profiles_To_Remove`. Conversely, for adding profiles, the respective profile names should be provided to the `Profiles_To_Add` parameter.

It is important to note that the addition of profiles can also be managed through the Client/Location level EDFs, as further elucidated in this document.

**Note:** Run the [Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355) script with the `Set_Environment` set to `1` to create the system properties and EDFs used by this script.

![Image](../../../static/img/Implement-Wifi-Profile/image_1.png)

## Sample Run

- The Wi-Fi Profile/SSID to remove from the computer should be provided within the `Profiles_To_Remove` parameter. Each SSID should be enclosed in double quotes and separated by a comma. Also, if there is a comma (,) in the SSID, then it should be replaced by a double semi-colon (;;).
  - Example 1: To remove a single Wifi-Profile  
    ![Image](../../../static/img/Implement-Wifi-Profile/image_2.png)
  - Example 2: To remove multiple Wi-Fi Profiles  
    ![Image](../../../static/img/Implement-Wifi-Profile/image_3.png)
  - Example 3: If there is a comma in Wi-Fi Profile Name. e.g., `SSID with a , Comma` or `SSID , with multiple , Commas`  
    ![Image](../../../static/img/Implement-Wifi-Profile/image_4.png)

- The Wi-Fi Profile/SSID to be added from the computer should be provided within the `Profiles_To_Add` parameter. Each SSID should be enclosed in single quotes and separated by commas. Additionally, along with the names of the profiles, the `Primary_Computerid` parameter should be set to specify the computer ID from which the profile information is to be copied. While adding a SSID with a single quotation in the name itself, a backslash should be added before the quotation. The complete name should always be enclosed between the single quotations.  
  For example:  
  To Add `Bob's Wifi` in the parameter it should be passed as `'Bob//'s Wifi'`.  
  To Add `Bob's Wifi`, `HR's Wifi`, and `Wifi Network X` in the parameter it should be passed as `'Bob//'s Wifi', 'HR's Wifi','Wifi Network X'`.  
  - Example 1: To add a single Wifi-Profile  
    ![Image](../../../static/img/Implement-Wifi-Profile/image_5.png)
  - Example 2: To add multiple Wifi-Profiles  
    ![Image](../../../static/img/Implement-Wifi-Profile/image_6.png)

## Dependencies

[EPM - Windows Configuration - Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355)

## Variables

| Name                | Description                                                                                          |
|---------------------|------------------------------------------------------------------------------------------------------|
| ProjectName         | Add-WifiProfile, Remove-WifiProfile                                                                  |
| WorkingDirectory     | C:/ProgramData/_Automation/Script/Add-WifiProfile, C:/ProgramData/_Automation/Script/Remove-WifiProfile |
| PS1Log              | C:/ProgramData/_Automation/Script/Add-WifiProfile/Add-WifiProfile-log.txt, C:/ProgramData/_Automation/Script/Remove-WifiProfile/Remove-WifiProfile-log.txt |
| PS1ErrorLog         | C:/ProgramData/_Automation/Script/Add-WifiProfile/Add-WifiProfile-error.txt, C:/ProgramData/_Automation/Script/Remove-WifiProfile/Remove-WifiProfile-error.txt |

### User Parameters

| Name                | Example                            | Required | Description                                                                                                                                                                                                                                               |
|---------------------|------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Profiles_To_Remove   | "SSID To Remove", "Suspicious Network" | False    | SSID(s) of the unwanted/malicious WiFi Profile(s) to remove from the end machine. Check the `Sample Run` section of the article for further details. If left blank, script will just audit the WiFi Profiles.                                       |
| Profiles_To_Add      | 'SSID To Add', 'Another'           | False    | SSID(s) of the Wifi Profile(s) to add to the end machine. Check the **Sample Run** section of the article for further details. If left blank, the script will fallback to the location-level EDF `Wifi Profiles To Add` and then to the client-level EDF `Wifi Profiles To Add`. |
| Primary_Computerid   | 294                                | True (if `Profiles_To_Add` parameter is used) | Id of the computer to fetch the information of the profiles to add.                                                                                                                                                                                |

### System Properties

| Name                | Example                                          | Required | Description                                                                                                                                                                                                                                               |
|---------------------|--------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Safe_Wifi_Networks   | "Safe Network", "Another Safe Network", "Safe Network With a ;; Comma" | False    | Stores the list of globally whitelisted/Safe wifi profiles. Script will not accidentally remove the profile(s) if it's mentioned here. Each Name/SSID should be enclosed in double quotation and separated by a comma. If there is a comma (,) in Wi-Fi Profile Name, it should be replaced by double semi-colon (;;). e.g., the way `"Safe Network with a , comma"` is saved in the screenshot. |

![Image](../../../static/img/Implement-Wifi-Profile/image_7.png)

## Client-Level EDFs

| Name                | Example                                          | Required | Description                                                                                                                                                                                                                                               |
|---------------------|--------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Safe Wifi Networks   | "Client Level Safe Network", "Trusted Network", "Safest", "SSID with a ;; Comma" | False    | In addition to define globally Safe/Whitelisted WiFi Profiles/Networks, this EDF provides an option to define additional client-level Safe/whitelisted WiFi Profiles as well. The Profiles/SSIDs stored here will not be removed from the machine, even if someone passes that name to the `Profiles_To_Remove` parameter. Syntax of storing the Name(s) in the EDF is the same as system property. Each Name should be enclosed in double quotes and separated by a comma. If there is a comma (,) in Wi-Fi Profile Name, it should be replaced by double semi-colon (;;). e.g., the way `"SSID with a , comma"` is saved like this `"SSID with a ;; comma"` |
| Primary ComputerID   | Computer Name (Computerid)                       | True (if Client-level EDF `Wifi Profiles To Add` is set) | To store the name and id of the computer to fetch the information of the Wifi Profiles to Add to the end machines of the client. It's a dropdown field with the `Name (Computerid)` of the computers of the client. ![Image](../../../static/img/Implement-Wifi-Profile/image_8.png) |
| Wifi Profiles To Add  | 'SSID1', 'SSID2', 'SSID3'                       | False    | SSID or Name of the Wifi Profile(s) to add to the end machines of the client. These Wifi Profiles should be available on the computer selected in the `Primary ComputerID` EDF. Each SSID should be enclosed in single quotes and separated by commas. While adding a SSID with a single quotation in the name itself, a backslash should be added before the quotation. The complete name should always be enclosed between the single quotations. For example: To Add `Bob's Wifi` in the EDF it should be set as `'Bob//'s Wifi'`. To Add `Bob's Wifi`, `HR's Wifi`, and `Wifi Network X` in the EDF it should be set as `'Bob//'s Wifi', 'HR's Wifi','Wifi Network X'`. ![Image](../../../static/img/Implement-Wifi-Profile/image_9.png) |

![Image](../../../static/img/Implement-Wifi-Profile/image_10.png)

### Location-Level EDFs

| Name                | Example                                          | Required | Description                                                                                                                                                                                                                                               |
|---------------------|--------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Primary ComputerID   | Computer Name (Computerid)                       | True (if Location-level EDF `Wifi Profiles To Add` is set) | To override the information stored in the client-level EDF `Primary ComputerID`. ![Image](../../../static/img/Implement-Wifi-Profile/image_11.png)                                                                                                                      |
| Wifi Profiles To Add  | 'SSID1', 'SSID2', 'SSID3'                       | False    | To override the information stored in the client-level EDF `Wifi Profiles To Add`. ![Image](../../../static/img/Implement-Wifi-Profile/image_12.png)                                                                                                                  |

Location-Level EDFs can be used to override the Client-Level EDFs. The syntax used to store data in the location-level EDF `Wifi Profiles To Add` is the same as that of the client-level EDF `Wifi Profiles To Add`.

![Image](../../../static/img/Implement-Wifi-Profile/image_13.png)

## Computer-Level EDFs

| Name                | Example                                          | Required | Description                                                                                                                                                                                                                                               |
|---------------------|--------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exclude From Wifi Profile Addition | Check Box                                   | False    | This EDF has no effect on the script but can be used to exclude the computer from the [CWM - Automate - Internal Monitor - Add - Wifi Profiles](https://proval.itglue.com/DOC-5078775-14020258) monitor set detections.                              |

![Image](../../../static/img/Implement-Wifi-Profile/image_14.png)

## Output

- Script Log
- Dataview



