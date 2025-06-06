---
id: '90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a'
slug: /90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a
title: 'Offline Agents - Auto-Retire - Manual Execution'
title_meta: 'Offline Agents - Auto-Retire - Manual Execution'
keywords: ['retire', 'offline', 'agents', 'automate', 'client']
description: 'This document explains the process of retiring offline agents in ConnectWise Automate that have been offline for a specified number of days. It covers the required parameters, system properties, and extra data fields needed for the script to function effectively, along with sample runs and implementation steps.'
tags: []
draft: false
unlisted: false
---

## Summary

The purpose of this script is to retire the client agents that are offline in Automate for more than the days defined in the `Threshold` and are not `Broken` agents.

## Sample Run

For the initial execution:

Set the `Set_Environment` value to 1 and set the `Set_Global_Threshold_Days` value as per the client's requirement, suppose it's '180' days.

![Sample Run Image 1](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_1.webp)

Leave all parameters blank to retire just workstations.

![Sample Run Image 2](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_2.webp)

Set the `Server` value to `1` to retire both workstations and servers.

![Sample Run Image 3](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_3.webp)

**Note: Since this is a client script, it must be executed on the client.**

#### User Parameters

| Name                      | Example | Required                       | Description                                                                                                                                                                                                                                           |
|---------------------------|---------|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment           | 1       | Mandatory for the first run    | For the script's initial execution, this parameter must be used. The dependent EDFs and the system property are essential for the script to function properly. These required EDFs and System Property are created when the script is executed with this parameter set to 1. |
| Set_Global_Threshold_Days | 180     | False                          | The global property 'AutoRetireThreshold_Days' is set when the value in 'Set_Global_Threshold_Days' is specified. If left empty, the global property will be set to '90'.                                                                                 |
| Server                    | 1       | False                          | Set its value to `1` if the client wants to retire servers along with workstations. <ul><li>`1` - Set its value to 1 to remove servers along with workstations</li><li>`0` - Set its value to 0 to retire workstations only.</li></ul>          |

#### System Properties

| Name                      | Example | Required | Description                                                                                                                                                                                                                                           |
|---------------------------|---------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AutoRetireThreshold_Days  | 180     | True     | Threshold days to retire the offline computers. The default is 90. It can either be set during the first execution of the script or manually from the dashboard.                                                                                       |

![System Properties Image](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_4.webp)

#### Extra Data Fields

| Name                                    | Level  | Section   | Type      | Required | Description                                                                                                                                                                                                                                           |
|-----------------------------------------|--------|-----------|-----------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exclude From Auto-Retire Automation     | Client | Exclusions | Check box | False    | The script will not generate any tickets for the client if this EDF is checked.                                                                                                                                                                      |
| Exclude From Auto-Retire Automation     | Location | Exclusions | Check box | False    | The script will not include any computer from the location in the ticket if this EDF is checked.                                                                                                                                                      |
| Exclude From Auto-Retire Automation     | Computer | Exclusions | Check box | False    | The script will not include the computer in the ticket if this EDF is checked.                                                                                                                                                                        |
| AutoRetire Threshold Days                | Client | Default   | TextBox   | False    | To overwrite the threshold set in the Global Property `AutoRetireThreshold_Days` for the client.                                                                                                                                                  |
| AutoRetire Threshold Days                | Location | Default   | TextBox   | False    | To overwrite the threshold set in the Global Property `AutoRetireThreshold_Days` and Client-Level EDF `AutoRetire Threshold Days` for the location.                                                                                                  |

**The following EDFs can be used to overwrite the Threshold Days defined in the System property `AutoRetireThreshold_Days`:**

Client-Level EDF: "AutoRetire Threshold Days"

![Client-Level EDF](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_5.webp)

Location-Level EDF: "AutoRetireThreshold_Days"

![Location-Level EDF](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_6.webp)

**The following EDFs can be used to exclude a client/location/computer from retirement:**

Client-Level EDF: "Exclude From Auto-Retire Automation"

![Client-Level EDF Exclusion](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_7.webp)

Location-Level EDF: "Exclude From Auto-Retire Automation"

![Location-Level EDF Exclusion](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_8.webp)

Computer-Level EDF: "Exclude From Auto-Retire Automation"

![Computer-Level EDF Exclusion](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_9.webp)

## Implementation

1. Import the script using the ProSync Plugin.
2. Reload the System Cache.

![Reload System Cache](../../../static/img/docs/90249a1b-07b1-4ac5-8e3e-3b910d4d7b9a/image_10.webp)

3. Configure the script as follows:
   - Navigate to Automation --> Scripts within the CWA Control Center and open the script.
   - Debug the script against any client with the `Set_Environment` parameter set to 1 and `Set_Global_Threshold_Days` set to the number of days for the global property `AutoRetireThreshold_Days`.
     - Validate that the system property was set correctly by navigating to System --> Configuration --> Dashboard --> Config --> Configurations --> Properties --> Check the property 'AutoRetireThreshold_Days'.
   - Run the script against the desired client.