---
id: '93a9567a-d04c-449d-b9d9-d2b68ffa3293'
title: 'Network Devices - Enable External Sync'
title_meta: 'Network Devices - Enable External Sync'
keywords: ['network', 'sync', 'devices', 'external', 'automate']
description: 'This document outlines the implementation of a script that ensures the External Sync EDF is checked on network devices for synchronization to manage. It includes user parameters, system properties, extra data fields, implementation steps, and requirements from consultants.'
tags: ['network', 'sync', 'script', 'edf', 'configuration', 'client', 'location', 'device', 'management']
draft: false
unlisted: false
---
## Summary

This Script makes sure `External Sync` edf is checked on the network devices to sync them over to manage.

*Note:* Asset templates need to be properly configured for network devices in the Manage Plugin.

*Note:* Do not Proceed With implementing this Script if Consultant does not provide the Type of Network Devices the Partner would like to sync. Reach out to Consultant for this information.

## User Parameters

| Name               | Example | Required                                      | Description                                                                                                                                                                                                 |
|--------------------|---------|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment     | 1       | Need to set to 1 for first-time implementation | Running the script with the user parameter `Set_Environment` as `1` will import System Properties and EDFs needed for the script.                                                                         |

## System Properties

| Name                          | Example                                     | Required | Description                                                                                                                                                                                                                                                                                                                                 |
|-------------------------------|---------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| External_Sync_DeviceType      | 'Network Switch|Network Device|Printer|Router' | False    | The type of devices the client would like to sync over manage. If it is left blank, the script will not proceed with enabling the external sync for any network device. <ul><li>Separate each type with a pipeline (|)</li><li>Put "ALL" to sync all devices</li><li>Put "Disable" to unsync the device script synced earlier.</li><li>If left blank, script will not proceed with enabling the external sync for any network device.</li></ul> |

## Extra Data fields

| EDF Name                                   | Level  | Type     | Description                                                                                                           |
|--------------------------------------------|--------|----------|-----------------------------------------------------------------------------------------------------------------------|
| Exclude from Automatic Network Device Sync  | Client | CheckBox | Check it if you would like to disable a client from Network Device's external sync                                   |
| Exclude from Automatic Network Device Sync  | Location | CheckBox | Check it if you would like to disable a Location from Network Device's external sync                                |
| Exclude from Automatic Network Device Sync  | Device | CheckBox | Check it if you would like to disable a device from external sync                                                   |
| Automate enabled External Sync              | Device | CheckBox | Script uses this EDF to Store information of Devices whose External Sync is enabled by the Script.                  |

Client-level EDF  
![Client-level EDF](../../../static/img/Network-Devices---Enable-External-Sync/image_1.png)

Location-level EDF  
![Location-level EDF](../../../static/img/Network-Devices---Enable-External-Sync/image_2.png)  
Device-level EDF  
![Device-level EDF](../../../static/img/Network-Devices---Enable-External-Sync/image_3.png)

## Implementation

1. Import the script using the ProSync plugin:
   - [CWM - Automate - Script - Network Devices - Enable External Sync](https://proval.itglue.com/DOC-5078775-15025185)

2. Configure the solution as follows:
   - Navigate to Automation → Scripts within the CWA Control Center.
     - Debug Script [CWM - Automate - Script - Network Devices - Enable External Sync](https://proval.itglue.com/DOC-5078775-15025185) on any online machine with User Parameter 'Set_environment' = 1
     - It will create the System property required for the script.
   - Navigate to system dashboard → Config → Properties
     - Fill in the `External_Sync_DeviceType` system property as per Partners Requirements.
     - **Do not Proceed With implementing this Script if Consultant does not provide the Type of network Devices Partner wants to sync. Reach out to Consultant for this information.**
     - If Partner wants to sync all devices, put "ALL" in the `External_Sync_DeviceType` system property as shown below:  
       ![Sync all devices](../../../static/img/Network-Devices---Enable-External-Sync/image_4.png)
     - If Partner wants to Sync particular type of network devices like Router, Network Devices, Printer, fill in the system property as shown below. Separate each type with a pipeline (|)  
       ![Particular types](../../../static/img/Network-Devices---Enable-External-Sync/image_5.png)
     - If partner wants to unsync the device script synced earlier, put "Disable" in the system property as shown below:  
       ![Unsync device](../../../static/img/Network-Devices---Enable-External-Sync/image_6.png)
   - Navigate to system dashboard → Management → Scheduled Client Scripts
     - Schedule the script [CWM - Automate - Script - Network Devices - Enable External Sync](https://proval.itglue.com/DOC-5078775-15025185) to run daily.  
       ![Schedule daily](../../../static/img/Network-Devices---Enable-External-Sync/image_7.png)
   - If partner wants to exclude any particular device, location, or client from external Sync, select the `Exclude from Automatic Network Device Sync` EDF respectively on that device, location, or client.

3. Requirements from Consultants:
   - Ask Partner the type of network devices they would like to sync
   - Without this information do not proceed with this script Implementation

## Output

- Script log






