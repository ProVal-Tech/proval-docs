---
id: '5e2c781f-761a-42f8-8d0a-d2866c2318b5'
title: 'Autofix for Outdated Cumulative Updates'
title_meta: 'Autofix for Outdated Cumulative Updates - CWM Automate Script'
keywords: ['autofix', 'cumulative', 'update', 'installation', 'monitor']
description: 'This document provides a comprehensive guide on the Autofix script designed to install the latest available Cumulative Update on computers identified by specific monitoring criteria. It includes troubleshooting steps to ensure smooth installation, dependencies, system properties, and script states for effective management.'
tags: ['update', 'monitoring', 'windows', 'installation', 'script']
draft: false
unlisted: false
---
## Summary

This Autofix script is designed to initiate the installation of the latest available Cumulative Update on computers identified by the [CWM - Automate - Internal Monitor - Last Cumulative Update > 45 Days and < 60 Days](https://proval.itglue.com/DOC-5078775-16208970). The script includes basic troubleshooting steps to ensure a smooth patch installation process. Basically, this script is a version of [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]](https://proval.itglue.com/DOC-5078775-14790498) script. This script is designed to fix issues on machines before creating any tickets, thereby limiting the number of tickets created by [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]](https://proval.itglue.com/DOC-5078775-14790498) script.

## Sample Run

This Autofix script is intended for implementation through the [CWM - Automate - Internal Monitor - Last Cumulative Update > 45 Days and < 60 Days](https://proval.itglue.com/DOC-5078775-16208970) monitor set, using the `△ Custom - Autofix - Out Of Date Cumulative Updates without Ticketing` alert template. However, it can also be manually executed simultaneously.

![Sample Run](../../../static/img/Out-of-Date-Cumulative-Updates-Autofix-without-Ticketing/image_1.png)

## Implementation

- Import the script from the `ProSync Client` plugin.
- During the initial execution, execute the script against a Windows computer with the script parameter `Set_Environment` configured as `1`. This action will import the necessary System Properties required for solution management.  
  ![Initial Execution](../../../static/img/Out-of-Date-Cumulative-Updates-Autofix-without-Ticketing/image_2.png)
- Configure the necessary values within the system properties, as elaborated in the System Properties section of the document.

## Dependencies

- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Internal Monitor - Patches Not Installing > 60 Days](https://proval.itglue.com/DOC-5078775-13582373)
- [EPM - Windows Configuration - Solution - User Prompt for Reboot](https://proval.itglue.com/DOC-5078775-9088563)
- [SEC - Windows Update - Agnostic - Repair-WindowsUpdate](https://proval.itglue.com/DOC-5078775-11167373)

## System Properties

| Name                                   | Default | Required | Description                                                                                              |
|----------------------------------------|---------|----------|----------------------------------------------------------------------------------------------------------|
| Out_of_Date_CU-Autofix_for_Servers    | 0       | False    | Assign a value of 1 to enable Autofix for servers; by default, the script will only generate a ticket for servers. |

## Script States

| Name                     | Example     | Description                                                                                                                                                                                                                          |
|--------------------------|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Out_of_Date_CU_Stage    | Validation  | To monitor the progress of the validation on the computer, the Script state is also utilized in the [Internal Monitor - Last Cumulative Update > 75 Days ago](https://proval.itglue.com/DOC-5078775-13582373) monitor set. This helps prevent duplicate executions of the script for the same computers. |

## Output

- Script Log






