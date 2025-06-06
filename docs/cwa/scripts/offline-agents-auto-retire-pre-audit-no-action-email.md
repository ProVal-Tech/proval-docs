---
id: 'a47f9f1e-356c-4b1c-aa02-47d70788ac05'
slug: /a47f9f1e-356c-4b1c-aa02-47d70788ac05
title: 'Offline Agents - Auto-Retire - Pre-Audit No Action,Email'
title_meta: 'Offline Agents - Auto-Retire - Pre-Audit No Action,Email'
keywords: ['email', 'offline', 'agents', 'automate', 'script', 'notification']
description: 'This document provides a comprehensive guide on a script that emails details of client agents that have been offline for a specified number of days in ConnectWise Automate. The script includes parameters for setting the threshold and options for ticket creation.'
tags: ['email', 'ticketing']
draft: false
unlisted: false
---

## Summary

This script aims to email the details of the client agents that are offline in Automate for more than the days defined in the `Threshold` and are not `Broken` agents.

## Sample Run

For initial execution:

Set the `Set_Environment` value to 1 and set the `Set_Global_Threshold_Days` value as per the client's requirement, suppose it's '180' days.

![Sample Run](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_1.webp)

Leave all parameters except `Email_address` blank for an email regarding all the obsolete workstations.

![Sample Run](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_2.webp)

Set the `Server` value to `1` for an email regarding all the obsolete workstations as well as servers.

![Sample Run](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_3.webp)

**Note: Since this is a client script, it must be executed on the client.**

## Global Parameters

| Name                      | Required | Example | Description                                                                                      |
|---------------------------|----------|---------|--------------------------------------------------------------------------------------------------|
| TicketCreationCategory     | False    | 298     | Mention the ticket creation category in order to direct the tickets to the right board in Manage. |

### User Parameters

| Name                       | Example | Required                   | Description                                                                                                                                                                                                                   |
|----------------------------|---------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment            | 1       | Mandatory for the first run | For the script's initial execution, this parameter must be used. The dependent EDFs and the system property are essential for the script to function properly. These required EDFs and System Property are created when the script is executed with this parameter set to 1. |
| Set_Global_Threshold_Days  | 180     | False                      | The global property 'AutoRetireThreshold_Days' is set when the value in 'Set_Global_Threshold_Days' is set. If left empty, the global property will be set to '90'.                                                                 |
| Server                     | 1       | False                      | Set its value to `1` if the client wants to retire servers along with workstations.                                                                                                                                              |
| Email_Address              | xyz@something.com | False                      | Email address where the partner wants to receive the details of obsolete agents.                                                                                                                                                 |
| Ticketing                  | 1       | False                      | Input its value as '1' if you would like to receive a ticket with a list of obsolete machines.                                                                                                                                  |

### System Properties

| Name                        | Example | Required | Description                                                                                                                                                                                                                      |
|-----------------------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AutoRetireThreshold_Days    | 180     | True     | Threshold days to retire the offline computers. The default is 90. It can either be set during the first execution of the script or manually from the dashboard.                                                                 |

![System Properties](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_4.webp)

### Extra Data Fields

| Name                                               | Level   | Section     | Type      | Required | Description                                                                                                                                                               |
|----------------------------------------------------|---------|-------------|-----------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exclude From Auto-Retire Automation                | Client  | Exclusions  | Check box | False    | The script will not generate any tickets for the client if this EDF is checked.                                                                                             |
| Exclude From Auto-Retire Automation                | Location| Exclusions  | Check box | False    | The script will not include any computer from the location in the ticket if this EDF is checked.                                                                             |
| Exclude From Auto-Retire Automation                | Computer| Exclusions  | Check box | False    | The script will not include the computer in the ticket if this EDF is checked.                                                                                              |
| AutoRetire Threshold Days                           | Client  | Default     | TextBox   | False    | To overwrite the threshold set in the Global Property `AutoRetireThreshold_Days` for the client.                                                                         |
| AutoRetire Threshold Days                           | Location| Default     | TextBox   | False    | To overwrite the threshold set in the Global Property `AutoRetireThreshold_Days` and Client-Level EDF `AutoRetire Threshold Days` for the location.                     |

**Following EDFs can be used to overwrite the Threshold Days defined in the System property `AutoRetireThreshold_Days`:**

Client-Level EDF: "AutoRetire Threshold Days"

![Client-Level EDF](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_5.webp)

Location-Level EDF: "AutoRetireThreshold_Days"

![Location-Level EDF](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_6.webp)

**Following EDFs can be used to exclude a client/location/computer from retirement:**

Client-Level EDF: "Exclude From Auto-Retire Automation"

![Client-Level EDF](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_7.webp)

Location-Level EDF: "Exclude From Auto-Retire Automation"

![Location-Level EDF](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_8.webp)

Computer-Level EDF: "Exclude From Auto-Retire Automation"

![Computer-Level EDF](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_9.webp)

## Implementation

1. Import the script using the ProSync Plugin.

2. Reload the System Cache.

   ![Reload Cache](../../../static/img/docs/a47f9f1e-356c-4b1c-aa02-47d70788ac05/image_10.webp)

3. Configure the script as follows:

   - Navigate to Automation → Scripts within the CWA Control Center and open the script.
   - Debug the script against any client with the `Set_Environment` parameter set to 1 and `Set_Global_Threshold_Days` set to the number of days for the global property `AutoRetireThreshold_Days`.
     - Validate that the system property was set correctly by navigating to 'System → Configuration → Dashboard → Config → Configurations → Properties' → Check the property 'AutoRetireThreshold_Days'.
   - Run the script against the desired client.