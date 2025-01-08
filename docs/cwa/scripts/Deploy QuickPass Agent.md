---
id: 'cwa-quickpass-agent-installation'
title: 'QuickPass Agent Installation Script'
title_meta: 'QuickPass Agent Installation Script for Windows Machines'
keywords: ['quickpass', 'agent', 'installation', 'windows', 'deployment']
description: 'This document provides a comprehensive guide on installing the QuickPass Agent on Windows machines, detailing the necessary prerequisites, parameters, and configuration settings required for a successful installation.'
tags: ['installation', 'windows', 'software', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

This script installs QuickPass Agent on Windows machines where it's not already installed. The `QuickPass` EDF must be chosen, and the `QuickPass Agent ID` EDF should be populated with the specified CustomerID at the client level. Also, System Property `QuickpassInstallToken` must be filled with the installation token so the script installs the agent successfully.

## Sample Run

![Sample Run](5078775/docs/14875677/images/21521245)

## Dependencies

[SWM - Software Install - Internal Monitor - Agents Missing QuickPass](https://proval.itglue.com/DOC-7339781-14875676)

## Global Parameters

| Name                    | Required | Example | Description                                                                                                    |
|-------------------------|----------|---------|----------------------------------------------------------------------------------------------------------------|
| Ticket_On_Failure       | False    | 1       | Fill it as '1' if you would like to receive Ticket on failure else leave it blank or '0'                     |
| TicketCreationCategory   | False    | 298     | Mention the ticketcreationcategory in order to direct the tickets to the right board in Manage                |

## User Parameter

| Name              | Required | Example | Description                                                                                                    |
|-------------------|----------|---------|----------------------------------------------------------------------------------------------------------------|
| Set_Environment    | False    | 1       | Running the script with the user parameter `Set_Environment` as `1` will import System Property `QuickpassInstallToken` needed for the script.<br><br><em><u><strong>Note:</strong></u>Need to set to 1 for first-time implementation</em> |

## System Property

| Name                  | Required | Example                     | Description                                                                                                    |
|-----------------------|----------|-----------------------------|----------------------------------------------------------------------------------------------------------------|
| QuickpassInstallToken  | True     | d7ksgi-yh67-kdsh77-jd888   | It must be filled with the installation token to initiate the QuickPass Agent installation                     |

## Extra Data Fields

| EDF Name                              | Level    | Type      | Description                                                                                                    |
|---------------------------------------|----------|-----------|----------------------------------------------------------------------------------------------------------------|
| QuickPass                             | Client   | CheckBox  | Check it if you would like to enable the client for QuickPass Deployment                                      |
| QuickPass Agent ID                   | Client   | TextField | Populate it with the specified CustomerID at the client level to initiate the installation on targeted client machines |
| Exclude from QuickPass Deployment     | Location | CheckBox  | Check it if you would like to Exclude a location from QuickPass Deployment                                     |
| Exclude from QuickPass Deployment     | Computer | CheckBox  | Check it if you would like to Exclude a computer from QuickPass Deployment                                     |

- The `QuickPass` EDF must be chosen, and the `QuickPass Agent ID` EDF should be populated with the specified CustomerID at the client level to initiate the installation on targeted client machines  
![QuickPass Agent ID](5078775/docs/14875677/images/22237678)  
<em>For more information on how to fetch QuickPass Agent ID refer the below document  
[Export Customers List, Status and Agent ID's – CyberQP (getquickpass.com)](https://support.getquickpass.com/hc/en-us/articles/360061942274-Export-Customers-List-Status-and-Agent-ID-s)</em>

- System Property `QuickpassInstallToken` must be filled with the installation token to initiate the QuickPass Agent installation  
![QuickpassInstallToken](5078775/docs/14875677/images/21521057)  
<em>QuickPass Installation Token can be fetched from Quickpass Dashboard and navigate to the Settings Menu and to the Admin Login Details section. Then click the COPY button for the Install Token</em>

- Select the location-level EDF `Exclude from QuickPass Deployment` to exclude the desired location from getting the QuickPass agent deployed  
![Exclude from QuickPass Deployment](5078775/docs/14875677/images/22249343)

- Select the computer-level EDF `Exclude from QuickPass Deployment` to exclude the desired machine from getting the QuickPass agent deployed  
![Exclude from QuickPass Deployment](5078775/docs/14875677/images/22249436)

## Output

- Script Logs
- Ticketing

## Ticketing

Subject: `QuickPass Agent Installation Failed on %ComputerName%(%ComputerID%)`

Ticket Body: `Failed to Install QuickPass Agent on %computername% at %clientname%. Here are the results returned from the installer: %shellresult%`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC model: @biosname@  
OS: %os%  
S/N OF PC: @biosver@

When Script fails to download the installer.

`QuickPass Agent failed to download on %computername% at %clientname%. Please ensure that the computer is able to reach the download URL [https://storage.googleapis.com/qp-installer/production/Quickpass-Agent-Setup.exe](https://storage.googleapis.com/qp-installer/production/Quickpass-Agent-Setup.exe)`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC model: @biosname@  
OS: %os%  
S/N OF PC: @biosver@

