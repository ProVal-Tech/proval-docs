---
id: '343654e4-9263-4fec-87c1-3c3401a94e95'
slug: /343654e4-9263-4fec-87c1-3c3401a94e95
title: 'SMBv1AuditAutofix'
title_meta: 'SMBv1AuditAutofix'
keywords: ['smbv1', 'audit', 'autofix', 'monitor', 'ticketing']
description: 'This document outlines the SMBv1 audit and autofix solution based on the EDF, including associated scripts, monitors, and implementation steps. It provides guidance on removing old solutions, importing new content, and configuring monitoring for SMBv1 vulnerabilities in client systems.'
tags: ['ticketing', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution contains the SMBv1 audit and autofix based on the EDF.

## Associated Content

| Content                                                                                              | Type             | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ---------------------------------------------------------------------------------------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b)         | Script           | This script is created to run the detection/remediation for SMBv1 Enabled based on EDF. It will act only if the dropdown EDF "SMB1 Vulnerability" is set to 'Audit Only' or 'Audit With Autofix' at any client, location, or computer level.                                                                                                                                                                                                                                                                                                                      |
| [Script - SMBv1 Enable Detection Ticketing - Per Client](/docs/a518732d-b53b-4f7a-9aa1-1b478f68288f) | Client Script    | This client script creates a ticket for each client with the computer count where remediation is required.                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [Script - SMB1 Traffic Detection Monitor Creation](/docs/ad0cedcb-352c-48d3-a1b6-a0ddb623b2b9)       | Client Script    | Remote monitors "ProVal - Production - SMB1 Traffic Detection" will be set up on computers where the [SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d) remote monitor identifies the SMB1 Server Status as `Enabled`. In the [Dataview - SMBv1 Status Audit](/docs/27c68799-35d0-4034-b0b5-b8a7736288df), the `SMB1 Server Status` column will display `Enabled` for these machines. [Dataview - SMBv1 Status Audit](/docs/27c68799-35d0-4034-b0b5-b8a7736288df) gathers the state of the monitor failure to show the machines where the SMB1 is used. |
| [Dataview - SMBv1 Status Audit](/docs/27c68799-35d0-4034-b0b5-b8a7736288df)                          | Dataview         | This dataview gathers the data from the script [CWA Script - SMBv1 Enabled Detection & Remediation](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) and depicts the status of SMB Enabled on the agent where it is deployed.                                                                                                                                                                                                                                                                                                                                          |
| [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)                        | Remote Monitor   | Checks whether SMB1 is enabled on the end machine. It runs the OS version [compatible command](https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server#how-to-detect-status-enable-and-disable-smb-protocols) to fetch the data.                                                                                                                                                                                                                                                      |
| [Internal Monitor - SMB1 Autofix](/docs/cb1ab987-657f-4503-a3e1-f4f6345b6fdf)                        | Internal Monitor | This internal monitor detects online Windows agents and performs autofix on computers where the "Audit with Autofix" is set via client, location, or computer level EDF "SMB1 Vulnerability". The [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d) shows failure, and the autofix [Script - SMBv1 Status Audit/Autofix [DV, Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) has not run in the past week.                                                                                                                        |
| **△ Custom - Execute Script - SMB1 Audit/Autofix**                                                   | Alert Template   | This needs to be scheduled with the [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d) and the [Internal Monitor - SMB1 Autofix](/docs/cb1ab987-657f-4503-a3e1-f4f6345b6fdf) to perform the Audit and Autofix based on EDF selection at the client, location, or computer level.                                                                                                                                                                                                                                                       |

## Implementation

### Remove Old Solution

If this solution is approved, please remove the following DV and Remote monitor:

- [EPM - Windows Configuration - Dataview - SMB1 Status [Remote Monitor]](/docs/da0254e3-0958-4ab4-9950-7e35feb12345)  
- [EPM - Windows Configuration - Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)  

To remove them, please run the following query:

```sql
DELETE FROM groupagents WHERE NAME = 'ProVal - Production - SMB1 Detection';
DELETE FROM agents WHERE NAME = 'ProVal - Production - SMB1 Detection' AND computerid > 0; 
DELETE FROM dataviews WHERE name = 'SMB1 Status [Remote Monitor]';
```

### Import New Solution

1. Import the following content using the ProSync Plugin:
   - [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b)  
   - [Script - SMBv1 Enable Detection Ticketing - Per Client](/docs/a518732d-b53b-4f7a-9aa1-1b478f68288f)  
   - [Script - SMB1 Traffic Detection Monitor Creation](/docs/ad0cedcb-352c-48d3-a1b6-a0ddb623b2b9)  
   - [Dataview - SMBv1 Status Audit](/docs/27c68799-35d0-4034-b0b5-b8a7736288df)  
   - [Internal Monitor - SMB1 Autofix](/docs/cb1ab987-657f-4503-a3e1-f4f6345b6fdf)  
   - Alert Template - `△ Custom - Execute Script - SMB1 Audit/Autofix`

   Import the EDFs, Searches, Groups, and Remote monitor following the document below:

   - Import - Remote Monitor - SMB1 Detection Query

2. Reload the system cache:

   ![Reload Cache](../../static/img/docs/343654e4-9263-4fec-87c1-3c3401a94e95/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Browse → Groups (△ System Monitoring→△ Vulnerability Management) → Computers→ Remote monitors within the CWA Control Center and set the following:
     - [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)  
       - Validate that the monitor is configured with the alert template "**`Default - Do Nothing`**" and if it is not, assign the alert template manually to perform the status audit and autofix based on the EDF selection.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - SMB1 Autofix](/docs/cb1ab987-657f-4503-a3e1-f4f6345b6fdf)  
       - Set up with `△ Custom - Execute Script - SMB1 Audit/Autofix` Alert Template
       - Right-click and Run Now to start the monitor
   - Schedule the client script "[Script - SMB1 Traffic Detection Monitor Creation](/docs/ad0cedcb-352c-48d3-a1b6-a0ddb623b2b9)" to gather the SMB1 live used state from the machines based on the event ID detection.
     - This client script will deploy the remote monitor to all the computers where "[Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)" has detected SMB1 enabled.
     - The [Dataview - SMBv1 Status Audit](/docs/27c68799-35d0-4034-b0b5-b8a7736288df) gathers the state of the monitor "ProVal - Production - SMB1 Traffic Detection" and shows data as "Yes" or "No" if used or not used, respectively.

   ```
   Note: Group "△ Vulnerability Management" under "△ System Monitoring" is created as a standard group to maintain a record of all monitors being developed in the future to be applied from it.
   ![Group Monitoring](../../static/img/docs/343654e4-9263-4fec-87c1-3c3401a94e95/image_2.webp)

   It contains all Windows Servers and Workstations whose onboarding is completed and service plans are under contract.
   Therefore, it is mandatory to validate that the monitors applied to this group have their Limit applied based on the Audit or Audit with Autofix selection; otherwise, it will be applied to all Windows machines.
   ```

4. **NOTE**: WE SHOULD ONLY BE PERFORMING THESE STEPS IF ASKED BY THE CONSULTANT

   To enable the solution, please make sure to select any one Audit option from the drop-down EDFs "SMB1 Vulnerability" at the computer, location, or client level. The 'Additional Field Default' value can also be selected here to enable the solution globally.

   ![Select Audit Option](../../static/img/docs/343654e4-9263-4fec-87c1-3c3401a94e95/image_3.webp)

   - Audit with Autofix → If this is selected, then SMB1 will be automatically disabled if found enabled on any device.
     - Both the SMB1 client and SMB1 server will be disabled.
   - Audit Only → If this is selected, then the SMB1 status will be audited only and will not be automatically disabled if found to be enabled.

   Note: The computer-level EDF "SMB1 Vulnerability" has the highest priority; if it is set to disabled, then it will be excluded. The location-level EDF "SMB1 Vulnerability" has the second-highest priority; if it is set to disabled, then all the endpoints at the location level will be excluded.

## Optional Solutions

### Traffic Detection Ticketing

Optionally, if the client wants, we can enable ticketing to monitor the SMB1 traffic live detection cases separately for each machine by setting up the system properties:

![Traffic Detection Ticketing](../../static/img/docs/343654e4-9263-4fec-87c1-3c3401a94e95/image_4.webp)

Note: This should only be implemented if the consultant approves it.