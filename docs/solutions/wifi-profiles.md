---
id: 'd0357bdb-80ab-4106-aee0-21a064150986'
slug: /d0357bdb-80ab-4106-aee0-21a064150986
title: 'WiFi Profiles'
title_meta: 'WiFi Profiles'
keywords: ['wifi', 'profiles', 'malicious', 'suspicious', 'monitor', 'script', 'audit']
description: 'This document provides a comprehensive guide on the updated script for managing Wi-Fi profiles, including features for adding, removing, and auditing profiles on end machines. It highlights the necessary updates, implementation steps, and associated content to ensure effective management of Wi-Fi profiles while enhancing security.'
tags: ['networking', 'security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to identify and remove malicious or suspicious Wi-Fi profiles from end machines.

## Update Notes - 2 Oct, 2023

- The script, formerly named `Get/Remove Wifi Profiles`, has been rebranded to `Get/Remove/Add Wifi Profiles`.
- In this updated version, a new feature has been incorporated to enable the addition of Wi-Fi profiles in addition to removal. Two new user parameters, namely `Profiles_To_Add` and `Primary_Computerid`, have been introduced to facilitate this functionality.
- To accommodate the storage of encrypted passwords, a new column has been added to the [pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3) table.
- Notably, the updated script will not function as intended unless executed with the `Set_Environment` user parameter set to `1` post-update.
- **Moreover, this update necessitates the removal of existing data within the [pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3) table and the [Wi-Fi Profile - Audit [Script]](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview. The currently available data will be purged after updating the solution.**
- Client-Level and Location-Level EDFs `Primary ComputerID` and `Wifi Profiles To Add` have been introduced. Setting both EDFs at either level will activate the [CWM - Automate - Internal Monitor - Add - Wifi Profiles](/docs/51eaeefd-b300-4f9a-be28-fa01e6e83b5e) monitor set for the client or location, respectively.
- Client-Level EDF `Safe Wifi Networks` has been moved to the EDF section `Wifi Profiles` from `Security`.

## Associated Content

| Content                                                                                       | Type          | Function                                                                                          |
|-----------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) | Script        | Gathers the relevant data from the end machine and can be used to remove malicious profiles as well. |
| [CWM - Automate - Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3) | Custom Table  | Stores the data collected by the script.                                                          |
| [CWM - Automate - Dataview - Wi-Fi Profiles](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) | Dataview      | Displays the data collected by the script for all computers in one place.                         |
| [CWM - Automate - Internal Monitor - Execute Script - Get - Wifi Profiles](/docs/237fb012-73a7-498d-a76c-304367fee659) | Internal Monitor | Executes the script once per month against physical Windows workstations to keep the dataview up-to-date. |
| [CWM - Automate - Internal Monitor - Add - Wifi Profiles](/docs/51eaeefd-b300-4f9a-be28-fa01e6e83b5e) | Internal Monitor | Detects machines where approved Wi-Fi profiles are not available.                                  |
| △ CUSTOM - Execute Script - Get - Wifi Profiles                                              | Alert Template | Used by the internal monitors defined in this document to execute the script.                     |

## Implementation

- Read all related documents carefully.
- Import the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script.
- Execute the script against an online Windows computer with `1` as the value for the `Set-Environment` parameter.
- Import the [CWM - Automate - Dataview - Wi-Fi Profiles](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview.
- Execute the script against a few online physical Windows workstations and ensure that the dataview displays the desired data.
- Import the [CWM - Automate - Internal Monitor - Execute Script - Get - Wifi Profiles](/docs/237fb012-73a7-498d-a76c-304367fee659) internal monitor.
- Import/Create the `△ CUSTOM - Execute Script - Get - Wifi Profiles` alert template to execute the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script.
- Assign the alert template to the monitor set.

**OPTIONAL:**
- Import the [CWM - Automate - Internal Monitor - Add - Wifi Profiles](/docs/51eaeefd-b300-4f9a-be28-fa01e6e83b5e) monitor set.
- Run the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](/docs/47e125c4-26df-4b47-811b-b856f3395290) script against the primary computer of each client/location.
- Check the data fetched from these primary computers in the [CWM - Automate - Dataview - Wi-Fi Profiles](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview.
- Set the EDFs defined in the [script's](/docs/47e125c4-26df-4b47-811b-b856f3395290) document according to the data available in the [dataview](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43).
- Apply the `△ CUSTOM - Execute Script - Get - Wifi Profiles` alert template to the monitor set.