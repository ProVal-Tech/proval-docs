---
id: 'c630e0b8-da8d-4188-aa83-4c4c7e421d92'
title: 'Network Devices - Offline Ticket Enabling'
title_meta: 'Network Devices - Offline Ticket Enabling'
keywords: ['alert', 'template', 'offline', 'network', 'devices', 'ticket', 'creation']
description: 'This document provides a comprehensive guide on how to set the alert template for offline network devices in bulk, including user parameters, dependencies, system properties, and implementation steps necessary to ensure proper alerting and ticket creation for network devices.'
tags: []
draft: false
unlisted: false
---

## Summary

This client script aims to set the alert template "△ Custom - Ticket Creation - Offline Network Devices" on the network devices in bulk and also checks the `Send Alert when Unit is Down` EDF based on a global system property specifying which network device manufacturer(s) are requested.

![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_1.png)

## Sample Run

![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_2.png)

## User Parameter

| Name             | Example | Required                                     | Description                                                                                                                                                                         |
|------------------|---------|----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment   | 1       | Need to set to 1 for first-time implementation | Running the script with the user parameter `Set_Environment` as `1` will import System Properties and EDFs needed for the script.                                                |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Offline Network Devices](<./Ticket Creation - Offline Network Devices.md>)  
△ Custom - Ticket Creation - Offline Network Devices

## Variables

| Name               | Description                                                                                                                                                                                                                          |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ManufacturerList    | This stores the Manufacturer parameter value provided in the system property 'NetworkDevice_Manufacturer'. If it is not set, then it stores the value as "No Manufacturer Set".                                                                 |

#### System Properties

| Name                        | Example             | Required | Description                                                                                                                                                                                                                           |
|-----------------------------|---------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NetworkDevice_Manufacturer   | Meraki|Ubiquiti    | True     | This includes the devices based on the manufacturer where ticket enabling is required. Please provide value with (|) pipe separated. If you would like to enable offline alerting for all network devices, just place "All" in the system property without quotes. |

## Extra Data Fields

| Name                                          | Level          | Type  | Default | Editable | Description                                                                                                     |
|-----------------------------------------------|----------------|-------|---------|----------|-----------------------------------------------------------------------------------------------------------------|
| Exclude from Offline Network Device Ticketing  | Client-EDF     | Flag  | 0       | Yes      | Check it if you would like to disable a client from Network Device's offline ticketing.                         |
| Exclude from Offline Network Device Ticketing  | Location-EDF   | Flag  | 0       | Yes      | Check it if you would like to disable a location from Network Device's offline ticketing.                       |
| Exclude from Offline Network Device Ticketing  | NetworkDevice-EDF | Flag  | 0       | Yes      | Check it if you would like to disable a Network Device's offline ticketing.                                    |
| Automate Offline Network Device Ticketing Enabled | NetworkDevice-EDF | Flag  | 0       | Yes      | This EDF was checked via a script after performing the offline ticket enabling and the alert template set to "△ Custom - Ticket Creation - Offline Network Devices". |

Client-Level EDF:  
![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_3.png)  

Location-Level EDF:  
![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_4.png)  

Device-Level EDFs:  
![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_5.png)  
![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_6.png)  

## Implementation

1. Import the contents  
   - [Script - Ticket Creation - Offline Network Devices](<./Ticket Creation - Offline Network Devices.md>) 
   - Alert Template: "**△ Custom - Ticket Creation - Offline Network Devices**" 
   - Script - Network Devices - Offline Ticket Enabling [Param]

2. Reload the system cache  
   ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_7.png)  

3. Configure the solution as follows:  
   - Navigate to Automation --> Scripts within the CWA Control Center.  
     - Debug the [Script - Network Devices - Offline Ticket Enabling](<./Network Devices - Offline Ticket Enabling.md>) on any client with User Parameter 'Set_Environment' = 1  
     - It will create the System property required for the script.  
   - Navigate to system dashboard --> Config --> Properties  
     - Fill in the `NetworkDevice_Manufacturer` system property as per partner requirements.  
     - **Important:** Do not proceed with implementing this script unless the consultant provides the type of network devices the partner wants to sync. Contact the consultant to obtain this information.  
     - By default, it remains empty  
       ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_8.png)  
     - If the partner wants to set offline ticketing for all devices, put "ALL" in the `NetworkDevice_Manufacturer` system property as shown below:  
       ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_9.png)  
     - If the partner wants to set offline ticketing for a particular manufacturer type of network device like Meraki, Ubiquiti, etc., fill in the system property as shown below. Separate each type with a pipe (|).  
       ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_10.png)  
     - If the partner wants to remove the offline ticketing from the device script synced earlier, put "Disable" in the system property as shown below:  
       ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_11.png)  
   - Navigate to system dashboard --> Management --> Scheduled Client Scripts  
     - Schedule the [Script - Network Devices - Offline Ticket Enabling](<./Network Devices - Offline Ticket Enabling.md>) to run daily.  
       ![Image](../../../static/img/Network-Devices---Offline-Ticket-Enabling/image_2.png)  
   - If the partner wants to exclude any particular device, location, or client from external sync, select the `Exclude from Offline Network Device Ticketing` EDF respectively on that device, location, or client.  

## Output

- Script log



