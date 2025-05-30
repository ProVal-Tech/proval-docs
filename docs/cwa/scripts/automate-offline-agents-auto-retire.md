---
id: 'a17ec084-ba3c-4a89-9d7a-52e4260af6e1'
slug: /a17ec084-ba3c-4a89-9d7a-52e4260af6e1
title: 'Automate - Offline Agents - Auto-Retire'
title_meta: 'Automate - Offline Agents - Auto-Retire'
keywords: ['offline', 'agents', 'auto-retire', 'script', 'automate', 'threshold', 'exclusions']
description: 'This document outlines the Offline Agents Auto-Retire script for ConnectWise Automate, detailing its purpose, implementation steps, user parameters, and system properties. It provides guidance on setting thresholds for retiring offline computers and managing exclusions through Extra Data Fields (EDFs).'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to retire the computers that are offline in Automate for more than the days defined in the system property `AutoRetireThreshold_Days`. It also ends Screenconnect session of the agent if needed and required properties are opted.

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_1.webp)

The following EDFs can be used to overwrite the Threshold Days defined in the System property `AutoRetireThreshold_Days`.

- **Client-Level EDF**: "AutoRetire Threshold Days"

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_2.webp)

- **Location-Level EDF**: "AutoRetireThreshold_Days"

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_3.webp)

The following EDFs can be used to exclude a client/location/computer from retirement:

- **Client-Level EDF**: "Exclude From Auto-Retire Automation"

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_4.webp)

- **Location-Level EDF**: "Exclude From Auto-Retire Automation"

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_5.webp)

- **Computer-Level EDF**: "Exclude From Auto-Retire Automation"

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_6.webp)

## Sample Run

In order to create the system properties and EDFs utilized in the script, the 'Set_Environment' User Parameter should be set to 1 for its very first execution. The global property 'AutoRetireThreshold_Days' is set when the value in 'Set_Global_Threshold_Days' is specified. If left empty, the global property will default to '90'.

1. Open the script found under ProVal/Automate/Automate - Offline Agents - Auto-Retire and hit Debug Script.
   ![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_10.webp)

2. Select any client and ensure that the 'Set_Environment' variable is set to 1. You can set the global threshold to whatever the partner requests. The default is 90 days if not specified.
   ![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_8.webp)

3. Run this script with your custom settings.
   - **NOTE**: Setting a new threshold will NOT overwrite the existing threshold if this has been run before. You must manually modify the property if the threshold property is currently in the system.

It is suggested to schedule the script to run at regular intervals, preferably weekly, for better results.

![Image](../../../static/img/docs/a17ec084-ba3c-4a89-9d7a-52e4260af6e1/image_9.webp)

## Implementation

- Import the script.
- Run the script against any client with the `Set_Environment` parameter set to 1 and `Set_Global_Threshold_Days` set to the number of days for the global property `AutoRetireThreshold_Days`.
- Schedule the script in the dashboard to run at regular intervals.

## Dependencies

[CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)
[CWM - Automate - Solution - Offline/Broken Agents](/docs/ab580d76-42be-4b34-b38b-3a7e9336c13e)


**Computers marked as `Broken` by the [CWM - Automate - Script - Automate Agent - Auto Repair](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) script are excluded from retirement.**

## Variables

| Name              | Description                             |
|-------------------|-----------------------------------------|
| RetireStatement    | SQL Query used to retire the computers  |

### User Parameters

| Name                      | Example | Required                   | Description                                                                                                                                                                                                 |
|---------------------------|---------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment           | 1       | Mandatory for first run    | For the script's initial execution, this parameter must be used. The dependent EDFs and the system property are essential for the script to function properly. These required EDFs and System Property are created when the script is executed with this parameter set to 1. |
| Set_Global_Threshold_Days | 45      | False                      | The global property 'AutoRetireThreshold_Days' is set when the value in 'Set_Global_Threshold_Days' is specified. If left empty, the global property will be set to '90'.                                     |

### System Properties

| Name                      | Example | Required | Description                                                                                                                             |
|---------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------|
| AutoRetireThreshold_Days  | 90      | True     | Threshold days to retire the offline computers. The default is 90. It can either be set during the first execution of the script or manually from the dashboard. |
| AutoRetire_Workstations_Only | 1      | False     | Set it to `1` to retire offline workstations only. Setting it to `0` or leaving it blank will include servers. |
| AutoRetire_End_SC_Session  | 1      | False     | Set to `1` to end the ScreenConnect session when retiring the Automate agent. Set to `0` or leave blank to skip ending the session |
| AutoRetire_Proceed_on_EndSessionFailure | 1      | False     | Set to `1` to continue Automate agent removal if ScreenConnect session fails to end. Set to `0` or leave blank to stop removal |

### Extra Data Fields

| Name                           | Level   | Section     | Type      | Required | Description                                                                                                                        |
|--------------------------------|---------|-------------|-----------|----------|------------------------------------------------------------------------------------------------------------------------------------|
| Exclude From Auto-Retire Automation | Client  | Exclusions  | Check box | False    | The script will not generate any tickets for the client if this EDF is checked.                                                  |
| Exclude From Auto-Retire Automation | Location | Exclusions  | Check box | False    | The script will not include any computer from the location in the ticket if this EDF is checked.                                   |
| Exclude From Auto-Retire Automation | Computer | Exclusions  | Check box | False    | The script will not include the computer in the ticket if this EDF is checked.                                                   |
| AutoRetire Threshold Days      | Client  | Default     | TextBox   | False    | To overwrite the threshold set in the global property `AutoRetireThreshold_Days` for the client.                                  |
| AutoRetire Threshold Days      | Location | Default     | TextBox   | False    | To overwrite the threshold set in the global property `AutoRetireThreshold_Days` and Client-Level EDF `AutoRetire Threshold Days` for the location. |

## Output

- Script log

## Sample Log

```
2023-09-20 15:49:53: Retiring 4 obsolete agents

Computer ID: 896
Computer Name: DEV-WIN11-DCJOI
Client Name: Development
Location Name: Dev
Operating System: Microsoft Windows 11 Pro x64
Last Contact: 2022-09-20 15:46:02
Last Logged In User: PROVALDEV/Test

Computer ID: 904
Computer Name: DEV-WIN11-2
Client Name: Development
Location Name: Dev
Operating System: Microsoft Windows 11 Pro x64
Last Contact: 2022-09-20 15:47:48
Last Logged In User: DEV-WIN11-2/Test

Computer ID: 912
Computer Name: DEV-WIN11-1
Client Name: Development
Location Name: Dev
Operating System: Microsoft Windows 11 Pro x64
Last Contact: 2022-09-20 13:04:05
Last Logged In User: DEV-WIN11-1/Test

Computer ID: 917
Computer Name: DEV-WIN10-DCJOI
Client Name: Development
Location Name: Dev
Operating System: Microsoft Windows 10 Pro x64
Last Contact: 2022-09-20 15:49:13
Last Logged In User: DEV-WIN10-DCJOI/Test
```