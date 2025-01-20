---
id: 'd0357bdb-80ab-4106-aee0-21a064150986'
title: 'Get/Remove/Add Wifi Profiles'
title_meta: 'Get/Remove/Add Wifi Profiles - Manage Wi-Fi Profiles Effectively'
keywords: ['wifi', 'profiles', 'malicious', 'suspicious', 'monitor', 'script', 'audit']
description: 'This document provides a comprehensive guide on the updated script for managing Wi-Fi profiles, including features for adding, removing, and auditing profiles on end machines. It highlights the necessary updates, implementation steps, and associated content to ensure effective management of Wi-Fi profiles while enhancing security.'
tags: ['networking', 'security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to find out and remove the malicious/suspicious Wi-Fi Profiles from the end machines.

## Update Notes - 2 Oct, 2023

- The script, formerly named `Get/Remove Wifi Profiles`, has been rebranded to `Get/Remove/Add Wifi Profiles`.
- In this updated version, a new feature has been incorporated to enable the addition of Wi-Fi profiles in addition to removal. Two new user parameters, namely `Profiles_To_Add` and `Primary_Computerid`, have been introduced to facilitate this functionality.
- To accommodate the storage of encrypted passwords, a new column has been added to the [pvl_wifi_profiles](<../cwa/tables/pvl_wifi_profiles.md>) table.
- Notably, the updated script will not function as intended unless executed with the `Set_Environment` user parameter set to `1` post-update.
- **Moreover, this update necessitates the removal of existing data within the [pvl_wifi_profiles](<../cwa/tables/pvl_wifi_profiles.md>) table and the [Wi-Fi Profile - Audit [Script]](<../cwa/dataviews/WiFi Profile - Audit Script.md>) dataview. The currently available data will be purged after updating the solution.**
- Client-Level and Location-Level EDFs `Primary ComputerID` and `Wifi Profiles To Add` are introduced. Setting both EDFs at either level will activate the [CWM - Automate - Internal Monitor - Add - Wifi Profiles](<../cwa/monitors/Add - Wifi Profiles.md>) monitor set for the client or location respectively.
- Client-Level EDF `Safe Wifi Networks` is moved to the EDF section `Wifi Profiles` from `Security`.

## Associated Content

| Content                                                                                       | Type          | Function                                                                                          |
|-----------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../cwa/scripts/GetRemoveAdd Wifi Profiles.md>) | Script        | Gathers the relevant data from the end machine and can be used to remove the malicious profiles as well. |
| [CWM - Automate - Custom Table - pvl_wifi_profiles](<../cwa/tables/pvl_wifi_profiles.md>) | Custom Table  | Stores the data grabbed by the script.                                                           |
| [CWM - Automate - Dataview - Wi-Fi Profiles](<../cwa/dataviews/WiFi Profile - Audit Script.md>) | Dataview      | Displays the data grabbed by the script for all computers in one place.                          |
| [CWM - Automate - Internal Monitor - Execute Script - Get - Wifi Profiles](<../cwa/monitors/Execute Script - Get - Wifi Profiles.md>) | Internal Monitor | Executes the script once per month against physical Windows workstations to keep the dataview up-to-date. |
| [CWM - Automate - Internal Monitor - Add - Wifi Profiles](<../cwa/monitors/Add - Wifi Profiles.md>) | Internal Monitor | Detects the machines where approved Wifi profiles are not available.                              |
| △ CUSTOM - Execute Script - Get - Wifi Profiles                                              | Alert Template | Used by the internal monitors defined in this article to execute the script.                     |

## Implementation

- Read all the related documents carefully.
- Import [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../cwa/scripts/GetRemoveAdd Wifi Profiles.md>) script.
- Execute the script against an online Windows computer with `1` for the value of the `Set-Environment` parameter.
- Import the [CWM - Automate - Dataview - Wi-Fi Profiles](<../cwa/dataviews/WiFi Profile - Audit Script.md>) dataview.
- Execute the script against a few online physical Windows workstations and ensure that the dataview is displaying the desired data.
- Import the [CWM - Automate - Internal Monitor - Execute Script - Get - Wifi Profiles](<../cwa/monitors/Execute Script - Get - Wifi Profiles.md>) internal monitor.
- Import/Create the `△ CUSTOM - Execute Script - Get - Wifi Profiles` alert template to execute [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../cwa/scripts/GetRemoveAdd Wifi Profiles.md>) script.
- Assign the alert template to the monitor set.

**OPTIONAL:**
- Import the [CWM - Automate - Internal Monitor - Add - Wifi Profiles](<../cwa/monitors/Add - Wifi Profiles.md>) monitor set.
- Run the [CWM - Automate - Script - Get/Remove/Add Wifi Profiles](<../cwa/scripts/GetRemoveAdd Wifi Profiles.md>) script against the primary computer of each client/location.
- Check the data fetched from these primary computers in the [CWM - Automate - Dataview - Wi-Fi Profiles](<../cwa/dataviews/WiFi Profile - Audit Script.md>) dataview.
- Set the EDFs defined in the [script's](<../cwa/scripts/GetRemoveAdd Wifi Profiles.md>) document as per the data available in the [dataview](<../cwa/dataviews/WiFi Profile - Audit Script.md>).
- Apply the `△ CUSTOM - Execute Script - Get - Wifi Profiles` alert template on the monitor set.












