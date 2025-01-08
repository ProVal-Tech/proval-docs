---
id: 'cwa_plugin_proval_hardwaredetails'
title: 'Detailed Hardware Information for Automate Agents'
title_meta: 'Detailed Hardware Information for Automate Agents'
keywords: ['hardware', 'agents', 'automate', 'inventory', 'information']
description: 'This document provides comprehensive details on the hardware information available for all applicable agents within an Automate environment, including specifications such as CPU usage, memory, operating system details, and more.'
tags: ['agents', 'inventory', 'hardware', 'networking', 'windows']
draft: false
unlisted: false
---
## Purpose

Displays detailed hardware information about all applicable agents in an Automate environment.

## Table

#### plugin_proval_hardwaredetails

| Column                           | Type     | Explanation                                                                                      |
|----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| ClientID                         | INT      | The ClientID of the audited computer.                                                           |
| Client                           | VARCHAR  | The Client name of the audited computer.                                                        |
| Client Address                   | VARCHAR  | The Client address of the audited computer.                                                    |
| Client City                      | VARCHAR  | The Client City of the audited computer.                                                       |
| Client State                     | VARCHAR  | The Client State of the audited computer.                                                      |
| Client Zipcode                   | VARCHAR  | The Client Zipcode of the audited computer.                                                    |
| Client Address2                  | VARCHAR  | The secondary Client address of the audited computer.                                          |
| Client SupportMins               | VARCHAR  | The total support minutes for the Client (deprecated feature).                                  |
| Clients Phone                    | VARCHAR  | The Client phone number of the audited computer.                                               |
| Clients Fax                      | VARCHAR  | The Client fax number of the audited computer.                                                 |
| Clients Country                  | VARCHAR  | The Client country of the audited computer.                                                    |
| LocationID                       | INT      | The LocationID of the audited computer.                                                         |
| Client Location                  | VARCHAR  | The Client/Location CONCAT of the audited computer.                                            |
| Location                         | VARCHAR  | The Location name of the audited computer.                                                     |
| Location Address                 | VARCHAR  | The Location address of the audited computer.                                                  |
| Location City                    | VARCHAR  | The Location city of the audited computer.                                                     |
| Location State                   | VARCHAR  | The Location State of the audited computer.                                                    |
| Location Zipcode                 | VARCHAR  | The Location Zipcode of the audited computer.                                                  |
| Location Phone                   | VARCHAR  | The Location phone number of the audited computer.                                             |
| Location Fax                     | VARCHAR  | The Location fax number of the audited computer.                                               |
| Location Country                 | VARCHAR  | The Location country of the audited computer.                                                  |
| Location Router                  | VARCHAR  | The Location router IP address of the audited computer.                                        |
| Location Router Port             | INT      | The Location router port of the audited computer.                                              |
| ComputerID                       | INT      | The ComputerID of the audited computer.                                                        |
| OS Version                       | VARCHAR  | The version of running OS of the audited computer.                                             |
| Agent Version                    | VARCHAR  | The currently installed agent version of the audited computer.                                  |
| Agent Comment                    | VARCHAR  | The optional comment about the audited computer.                                               |
| Agent Last Contact Date          | DATETIME | The last time the agent checked in with the Automate server.                                   |
| Agent Last Inventory Date        | DATETIME | The last time a hardware inventory was taken for the agent.                                    |
| Agent CPU Usage                  | INT      | The CPU usage at the time of measurement.                                                      |
| Agent Memory Total               | INT      | The total available memory on the agent.                                                       |
| Agent Memory Avail               | INT      | The currently available memory.                                                                  |
| Agent Router Address             | VARCHAR  | The public IP address that the agent is using.                                                |
| Agent Uptime                     | BIGINT   | The number of minutes that the agent had been online.                                          |
| Agent Bytes IN                   | BIGINT   | The currently measured number of inbound bytes to the target agent.                            |
| Agent Bytes Out                  | BIGINT   | The currently measured number of outbound bytes from the target agent.                         |
| Agent MAC                        | VARCHAR  | The MAC address of the agent.                                                                   |
| Agent Install Date               | DATETIME | The date that the Automate agent was installed.                                               |
| Agent Mainboard                  | VARCHAR  | The name of the mainboard of the audited computer.                                            |
| Agent Serial Number              | VARCHAR  | The serial number of the audited computer.                                                    |
| Agent Bios                       | VARCHAR  | The reported BIOS information of the audited computer.                                         |
| User                             | TEXT     | The currently logged in user ('Not Logged In' if no user logged in)                             |
| Agent OS                         | VARCHAR  | The full OS name of the audited computer.                                                     |
| Agent Windows Domain             | VARCHAR  | The joined domain (or workgroup) of the audited computer.                                     |
| Manufacturer                     | VARCHAR  | The hardware manufacturer of the audited computer.                                            |
| Agent IP Address                 | VARCHAR  | The local IP address of the audited computer.                                                 |
| Agent asset Tag                  | VARCHAR  | The asset tag of the audited computer. (if available)                                         |
| Agent Asset Date                 | DATETIME | The last time an asset scan was run.                                                           |
| Drive Letters                    | TEXT     | Comma-separated list of drive letters of the audited computer.                                 |
| Drive Models                     | TEXT     | Comma-separated list of drive models of the audited computer.                                  |
| CPU Name                         | VARCHAR  | Full name of the CPU (Make/Model/Version)                                                     |
| Processor Manufacturer            | VARCHAR  | Manufacturer of the CPU (Intel, AMD, VM, etc.)                                               |
| Processor Speed                  | VARCHAR  | Reported speed of the CPU.                                                                      |
| Core Count                       | INT      | Reported number of cores of the CPU.                                                           |
| Processor Architecture            | VARCHAR  | Architecture of the audited computer's CPU (32Bit, 64Bit)                                     |
| Agent Laptop                     | VARCHAR  | Is the audited computer a Laptop? (True/False)                                               |
| Agent Type                       | VARCHAR  | The type of agent (Workstation, Laptop, Server)                                               |
| Computer Name                    | VARCHAR  | The name of the audited computer.                                                              |
| Chassis Version                  | VARCHAR  | The make/model of the audited computer.                                                       |
| Chassis Product Name             | VARCHAR  | The make/model ID number of the audited computer.                                             |
| Chassis Manufacturer              | VARCHAR  | The manufacturer of the audited computer.                                                     |
| Chassis SerialNumber             | VARCHAR  | The serial of the audited computer.                                                             |
| Chassis Lastdate Updated         | TIMESTAMP| The last time the agent was queried for Chassis information.                                   |
| Bios Version                     | VARCHAR  | The version of the BIOS of the audited computer.                                              |
| Bios Last Updated                | VARCHAR  | Last time the BIOS was updated.                                                                 |
| Bios Size                        | INT      | The size in KB of the BIOS                                                                       |
| Virtual Machine Type             | VARCHAR  | The type of VM that the agent is (if applicable)                                              |
| Bios Netbootstatus               | VARCHAR  | Information about if network boot is enabled on the audited computer.                          |
| Machine Type                     | VARCHAR  | Determines if the machine is a Host (Physical) or VM (Virtual)                                |
| Device Names                     | VARCHAR  | Comma-separated list of all detected devices connected to the machine.                         |
| Network Device Names             | TEXT     | Comma-separated list of all detected network devices connected to the machine.                 |
| Network Mac Address              | VARCHAR  | MAC address of the agent.                                                                        |
| Network IP Address               | VARCHAR  | IP address of the agent.                                                                         |
| Network Card Speed               | VARCHAR  | Reported network speed of the agent's network card.                                            |
| Video Processor Name             | VARCHAR  | Primary graphics processor name.                                                                 |
| Video Processor resolution        | VARCHAR  | Current video resolution.                                                                        |
| Video Processor Architecture      | VARCHAR  | Video architecture.                                                                              |
| Video Processor pixel            | VARCHAR  | Color-depth of the video processor.                                                             |
| VideoCard last dateupdated       | VARCHAR  | Last update of the video processor.                                                             |
| VideoProcessor Card memory       | VARCHAR  | Amount of VRAM available to the video processor.                                               |
| Operating System Version         | VARCHAR  | The numerical version of the installed OS.                                                     |
| OS Build version                 | INT      | The numerical build version of the installed OS (Windows 10+ only)                             |
| OS ServicePack                   | VARCHAR  | The currently installed service pack.                                                           |
| Domain name                      | VARCHAR  | The domain or workgroup that the machine is joined to.                                         |
| .Net Version                     | VARCHAR  | Highest .NET version of the target agent.                                                      |
| OS edition                       | VARCHAR  | Installed edition of the OS (Pro, Home, etc.)                                                  |
| OS License Status                | VARCHAR  | Shows if the OS is currently licensed.                                                          |
| Domain Controller                 | VARCHAR  | YES/NO on if the machine is a domain controller.                                               |
| Systemslot Name                  | VARCHAR  | Determines if there is an express/media slot on the machine.                                   |
| Systemslot Type                  | VARCHAR  | The type of slot (PCI Express, USB, etc.)                                                      |
| SystemSlot last dateupdated      | VARCHAR  | Last update of the system slot.                                                                  |
| ProbeFan Monitor                 | VARCHAR  | Information about the fan monitor.                                                              |
| Fan Sensor                       | VARCHAR  | Information about the fan sensor.                                                                |
| UPS Name                         | VARCHAR  | Information about an attached UPS device.                                                       |
| UPS Last updated by              | VARCHAR  | Information about the UPS last updated user.                                                   |
| UPS last updated                 | VARCHAR  | Information about when the UPS status was last updated.                                        |
| UPS Replacement Status           | VARCHAR  | Information about if the UPS needs to be updated.                                              |
| Printer Names                    | TEXT     | Comma-separated list of all connected printers to the machine.                                  |

