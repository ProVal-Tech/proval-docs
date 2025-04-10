---
id: '1fef1360-cfd3-4a3f-8444-207c09fb5a78'
slug: /1fef1360-cfd3-4a3f-8444-207c09fb5a78
title: 'Offboarding Wrapper'
title_meta: 'Offboarding Wrapper'
keywords: ['offboarding', 'script', 'client', 'automation', 'software', 'ticketing']
description: 'This document provides a comprehensive guide to using the Offboarding Wrapper Script for client machines, detailing its dependencies, system properties, and output expectations. This script ensures that all necessary subscripts are executed before removing machines from the client environment, with built-in ticketing for tracking failures and successes.'
tags: ['software', 'ticketing', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This is a wrapper script that can be used to offboard machines from the client's environment by defining the scripts to be run before offboarding the machine. This script calls a template script "Offboarding Scripts - Partner" from which any of the subscripts that need to be run before offboarding can be executed. If any of the child scripts fail to run, the parent script will not proceed with the removal of the ScreenConnect or Automate agent.

**Note:** All changes must be made in [Template - Offboarding Scripts - Partner](/docs/c74040d5-4fbb-487f-bb4f-b19696daab1c) only. No alterations are required in the wrapper script.

## Dependencies

- [Template - Offboarding Scripts - Partner](/docs/c74040d5-4fbb-487f-bb4f-b19696daab1c)
- [Script - Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e)
- [CW Control - Uninstall and Remove from Control Web Portal](/docs/d69c20e1-e605-4cf9-bf35-bbe4c74f134f)

## Sample Run

![Sample Run Image](../../../static/img/Offboarding-Wrapper/image_1.png)

## System Properties

| Name                                   | Required | Example                      | Description                                                                                                                                                                                                                      |
|----------------------------------------|----------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `_sysOffboardingAlertType`            | False    | Email, Ticket                | - Set its value to 'Ticket' to enable ticketing. - Set its value to 'Email' to enable emailing. - Set its value to 'Email, Ticket' to enable both emailing and ticketing.                                                                 |
| `_sysOffboardingDefaultEmailAddress`  | False    | [xyz@something.com](mailto:xyz@something.com) | Default email address to send the alerts to. If nothing is mentioned in this property, the script will send the emails to the user who ran the script. **Note:** The script will only send emails if `_sysOffboardingAlertType` system property is set to email. |
| `_sysOffboardingDefaultTicketCategory`| False    | 234                          | Mention the ticket creation category in order to direct the tickets to the right board in Manage.                                                                                                                              |
| `_sysOffboardingTicketOnSuccess`      | False    | 0                            | Set it to '1' to receive tickets if the script successfully removes all the required applications from the machine.                                                                                                           |
| `_sysOffboardingClientInformativeTicket` | False  | 1                            | This system property creates a client/location level ticket whenever someone opts for Client/location offboarding using the `Offboard Client` EDF or `Offboard Location` EDF. Its default value is '1', which means the script will create a client/location ticket if it's not already created on these EDF selections. Set it to '0' to disable this client/location ticket. |

## Extra Data Fields

| EDF Name               | Level    | Type     | Description                                                                                                                                                                                                                     |
|-----------------------|----------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Failed Uninstall Process | Client  | Dropdown | This EDF has three options: - "`Ticket + Halt`" - Stop the offboarding process if any child script fails to run. It will create tickets for failure. - "`Ticket - Leave ScreenConnect`" - Remove the ScreenConnect agent and create a ticket if any child script fails to run. It will not remove the Automate agent. - "`Best Effort - Continue`" - Continue with ScreenConnect and Automate agent removal even if any child script fails to run. It will not create any failure tickets. - "`Ticket + Continue`" - Continue with ScreenConnect and Automate agent removal even if any child script fails to run, but it will not create failure tickets. If none of these options are selected, the script will exit without creating any failure tickets. |
| Offboard Client       | Client   | Checkbox  | Check it to offboard the whole client.                                                                                                                                                                                         |
| Offboard Location     | Location | Checkbox  | Check it to offboard the whole location.                                                                                                                                                                                       |
| Offboard Computer     | Computer | Checkbox  | Check it to offboard the machine.                                                                                                                                                                                            |

- Select "Failed Uninstall Process" from the "Failed Uninstall Process" EDF  
  ![Failed Uninstall Process Image](../../../static/img/Offboarding-Wrapper/image_2.png)

- Select "`Offboard Client`" EDF to select the whole client for offboarding  
  ![Offboard Client Image](../../../static/img/Offboarding-Wrapper/image_3.png)

- Select "Offboard Location" EDF to select the whole location for offboarding  
  ![Offboard Location Image](../../../static/img/Offboarding-Wrapper/image_4.png)

- Select "Offboard Computer" EDF to select the machine for offboarding  
  ![Offboard Computer Image](../../../static/img/Offboarding-Wrapper/image_5.png)

## Output

- Script logs
- Ticketing

## Ticketing

**Computer Level Ticketing**  
**Subject:** `Offboarding status on %ComputerName%(%ComputerID%)`

**Ticket Body:** `Offboarding Script ran on the machine %ComputerName%. Here are the script results:`
`Script has successfully removed the following applications:@Success@`
`The applications below have failed to uninstall; please look into these failures:@Failure@`
If any application fails to uninstall, it is likely that the machine needs to be rebooted before the tools will show as removed. Please work with the end user to get the device rebooted, and then we can attempt the offboarding process again. If it fails again, you will likely have to remove the last bits of software manually. Sorry! Once you've removed that pesky software, please run the offboarding script again to remove the Automate agent from the device.

**Client Level Ticketing:**  
**Subject:** `Offboarding initiated on client - %ClientName%`  
`%ScriptName% has been initiated to offboard all machines of this client.`

**Location Level Ticketing:**  
**Subject:** `Offboarding initiated on location - %LocationName%`  
**Ticket Body:** `It seems like "Offboard Location" EDF has been selected for %LocationName%. %ScriptName% has been initiated to offboard all machines under this location.`



