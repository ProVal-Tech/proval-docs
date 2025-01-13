---
id: 'cwa-hp-ilo-health-monitoring'
title: 'HP iLO Health Monitoring'
title_meta: 'HP iLO Health Monitoring'
keywords: ['hp', 'ilo', 'monitoring', 'health', 'audit']
description: 'This document provides a comprehensive guide on gathering information about and monitoring the health status of HP iLO devices, including associated scripts, monitors, and configurations necessary for effective management.'
tags: ['monitoring', 'health', 'audit', 'configuration', 'script', 'dataview', 'alert']
draft: false
unlisted: false
---
## Purpose

Gather information about and monitor the health status of HP iLO devices.

## Associated Content

#### Auditing

| Content                                                                                                     | Type       | Function                                                                                                              |
|-------------------------------------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------|
| [Dataview - HP iLO Health Report](https://proval.itglue.com/DOC-5078775-10072561)                        | Dataview   | Displays information gathered by the [HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559) script. |
| [Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559)                  | Script     | Calls the agnostic script and formats the data for SQL.                                                               |
| [Internal Monitor - Execute Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-12879037) | Internal Monitor | Executes the [HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559) script against the relevant computers to keep the dataview up-to-date. |
| △ CUSTOM - Execute Script - HP iLO - Health Report - Get                                                  | Alert Template | To execute the script on the machines detected by the internal monitor.                                              |
| [Dataview - HP iLO Checks Not Running](https://proval.itglue.com/DOC-5078775-15762427)                   | Dataview   | List down the password entries for which the HP iLO Health Check automation is not running properly.                |

#### Automation

| Content                                                                                                     | Type               | Function                                                                                                              |
|-------------------------------------------------------------------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------|
| [Monitor - HP iLO Health Report Check](https://proval.itglue.com/DOC-5078775-10072562)                   | Internal Monitor    | Monitors for bad health status information stored in the [plugin_proval_ilo_health_report](https://proval.itglue.com/DOC-5078775-10072560) custom table. |
| [Script - Ticket Creation - HP iLO Health Check*](https://proval.itglue.com/DOC-5078775-15297925)       | Script              | Manage ticketing for the [HP iLO Health Report Check](https://proval.itglue.com/DOC-5078775-10072562) monitor set.  |
| △ Custom - Ticket Creation - HP iLO Health Check                                                          | Alert Template      | To execute the script on the machines detected by the internal monitor.                                              |

#### Optional

| Content                                                                                                     | Type               | Function                                                                                                              |
|-------------------------------------------------------------------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------|
| [Script - HP iLO Credential Missing Detection](https://proval.itglue.com/DOC-5078775-13814638)           | Client Script       | Creates the ticket for all clients which have an HP Server and have HP iLO enabled but the credentials are missing.   |
| [Dataview - HP iLO - Potentially Missing Credential](https://proval.itglue.com/DOC-5078775-15451321)     | Dataview            | Displays the clients/servers for which the [HP iLO Credential Missing Detection](https://proval.itglue.com/DOC-5078775-13814638) will create a ticket. |

#### Other

| Content                                                                                                     | Type               | Function                                                                                                              |
|-------------------------------------------------------------------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------|
| [plugin_proval_ilo_health_report](https://proval.itglue.com/DOC-5078775-10072560)                         | Custom Table        | Stores information gathered from the [HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559) script. |
| [Get-HPiLOHealthReport](https://proval.itglue.com/DOC-5078775-10072511)                                  | Agnostic Script      | Performs the audit of the iLO devices via PowerShell.                                                                |

## Implementation

1. Import the following scripts from the `ProSync` plugin:
   - [Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559)
   - [Script - Ticket Creation - HP iLO Health Check*](https://proval.itglue.com/DOC-5078775-15297925)
   - [Script - HP iLO Credential Missing Detection](https://proval.itglue.com/DOC-5078775-13814638)

2. Import the following internal monitors from the `ProSync` plugin:
   - [Internal Monitor - Execute Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-12879037)
   - [Monitor - HP iLO Health Report Check](https://proval.itglue.com/DOC-5078775-10072562)

3. Import the following alert templates from the `ProSync` plugin:
   - `△ Custom - Execute Script - HP iLO - Health Report - Get`
   - `△ Custom - Ticket Creation - HP iLO Health Check`

4. Import the following dataviews from the `ProSync` plugin:
   - [Dataview - HP iLO Health Report](https://proval.itglue.com/DOC-5078775-10072561)
   - [Dataview - HP iLO - Potentially Missing Credential](https://proval.itglue.com/DOC-5078775-15451321)
   - [Dataview - HP iLO Checks Not Running](https://proval.itglue.com/DOC-5078775-15762427)

5. Reload the System Cache.  
   ![Reload System Cache](../../static/img/HP-iLO-Health-Check/image_1.png)

6. Execute the [Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559) script against an online Windows machine with the `RecreateTable` parameter set to `1` to create the [plugin_proval_ilo_health_report](https://proval.itglue.com/DOC-5078775-10072560) custom table.  
   ![Execute Script](../../static/img/HP-iLO-Health-Check/image_2.png)

7. Configure the client-level password entries labelled as `iLO Automation Password` for the iLO Devices to be audited. See the documentation for the internal monitor [Execute Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-12879037) for more information on how to set up this password entry.

8. Configure the **Auditing** content as follows:  
   - Navigate to Automation > Monitors > Internal Monitors
     - [Internal Monitor - Execute Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-12879037)
       - Configure with the Alert Template: `△ CUSTOM - Execute Script - HP iLO - Health Report - Get`
       - Right-click and Run Now to start the monitor

9. Configure the **Automation** content as follows:  
   - Navigate to Automation > Monitors > Internal Monitors
     - [Internal Monitor - HP iLO Health Report Check](https://proval.itglue.com/DOC-5078775-10072562)
       - Configure with the Alert Template: `△ Custom - Ticket Creation - HP iLO Health Check`
       - Right-click and Run Now to start the monitor

10. **The Optional configuration should only be set if the partner opts in for ticket generation for HP Servers configured with HP iLO but lacking credentials in the Client-Level Password tab.**  
    Configure the **Optional** content as follows:
    - Navigate to System > Configuration > Dashboard > Management > Scheduled Client Scripts
      - Schedule the [HP iLO Credential Missing Detection](https://proval.itglue.com/DOC-5078775-13814638) script to run once per week.  
      ![Schedule Script](../../static/img/HP-iLO-Health-Check/image_3.png)



