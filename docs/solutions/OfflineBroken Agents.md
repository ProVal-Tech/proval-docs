---
id: 'cwa-offline-agent-remediation'
title: 'Offline Agent Remediation in ConnectWise Automate'
title_meta: 'Offline Agent Remediation in ConnectWise Automate'
keywords: ['offline', 'agent', 'remediation', 'automate', 'connectwise']
description: 'This document outlines a solution for detecting machines that have been offline in ConnectWise Automate for more than 30 days, differentiating between various agent statuses, and fixing issues with broken agents. It includes implementation steps and associated content for effective management of offline agents.'
tags: ['automate', 'monitor', 'repair', 'configuration', 'alert', 'dataview', 'script']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to detect machines that have been offline in Automate for more than 30 days and differentiate between agents that are offline in both ScreenConnect and Automate, agents that are offline only in Automate, and fix the issue with broken agents (computers that are offline in Automate but are online in ScreenConnect).

## Associated Content

### Automation Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [Internal Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387) | Internal Monitor | Detects the computers that have been offline in Automate for more than 30 days. |
| [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) | Script | Distinguish the agents and attempt to fix the broken agents. |
| △ Custom - Autofix - Offline Agent Remediation (RMM+) | Alert Template | Executes the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) as an auto-fix for the [Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387) |
| [Dataview - Agent - Agent Check-in Health](https://proval.itglue.com/DOC-5078775-7963731) | Dataview | Displays the agent status for each agent returned by the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) |
| [Dataview - Repaired Agents Last 30 Days](https://proval.itglue.com/DOC-5078775-15178458) | Dataview | Displays the information of the agents repaired by the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) |

### Other Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [CW RMM+ Plugin Configuration](https://proval.itglue.com/5078775/docs/9770217) | Configuration | A How-To Document which explains how to configure RMM+ and ensure this content works as intended. |
| [Custom Table - pvl_repaired_agents](https://proval.itglue.com/DOC-5078775-15178457) | Custom Table | The custom table stores the information of agents repaired by the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) |
| [Script - Track Repaired Agents](https://proval.itglue.com/DOC-5078775-15178447) | Sub-Script | Stores the information of the agents repaired by the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) into the [Custom Table - pvl_repaired_agents](https://proval.itglue.com/DOC-5078775-15178457) custom table. |
| [Script - ScreenConnect Client - Connectivity - Audit*](https://proval.itglue.com/DOC-5078775-8143436) | Sub-Script | Determines whether the computer is online or not in the ScreenConnect portal. |
| [Script - ScreenConnect Client - Command - Execute*](https://proval.itglue.com/DOC-5078775-8141008) | Sub-Script | Executes the commands on the machine from the ScreenConnect portal. |
| [Script - Automate Agent - Reinstall*](https://proval.itglue.com/DOC-5078775-7761438) | Sub-Script | Attempts to reinstall the Automate agent via the ScreenConnect portal. |
| Agent - Generate Location Installer URL* | Sub-Script | Generates the agent installer token for the reinstall command. |

## Implementation

1. Ensure RMM+ is configured correctly using the following documentation:
   - [CW RMM+ Plugin Configuration](https://proval.itglue.com/5078775/docs/9770217)

2. If the [Internal Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387) already exists and is running the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) as an auto-fix, please delete the monitor from the system before proceeding to the next step to ensure you get the latest content installed.
   - Take note of the ticket category before deleting it so we can keep it the same between updates.
   - If no ticket category is specified and none was setup on the old monitor, please get with the consultant to ensure they do not want tickets created for broken agents.

3. Import the following content using the ProSync Plugin:
   - [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441)
   - [Internal Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387)
   - [Dataview - Agent - Agent Check-in Health](https://proval.itglue.com/DOC-5078775-7963731)
   - [Dataview - Repaired Agents Last 30 Days](https://proval.itglue.com/DOC-5078775-15178458)
   - Alert Template - `△ Custom - Autofix - Offline Agent Remediation (RMM+)`

4. Reload the system cache.

5. Importing the parent script should import the Sub-Scripts as well. If you are unable to find the Sub-Scripts after reloading the system cache, then import the following scripts from the ProSync plugin:
   - [Script - Track Repaired Agents](https://proval.itglue.com/DOC-5078775-15178447)
   - [Script - ScreenConnect Client - Connectivity - Audit*](https://proval.itglue.com/DOC-5078775-8143436)
   - [Script - ScreenConnect Client - Command - Execute*](https://proval.itglue.com/DOC-5078775-8141008)
   - [Script - Automate Agent - Reinstall*](https://proval.itglue.com/DOC-5078775-7761438)
   - Agent - Generate Location Installer URL*
   
   Then Reload the System Cache again.

6. Run the [Script - Automate Agent - Auto Repair*](https://proval.itglue.com/DOC-5078775-7761441) against a random computer with the `Set Environment = 1`. This will create the system properties used by the script.

7. Go to system properties and set the required values for the `Agent_Repair_Duplicate_Check_Enabled` and `Agent_Repair_Re_Install_Enabled` properties. Check the `System Properties` table of the [script's document](https://proval.itglue.com/5078775/docs/7761441) for more information on these properties.

8. Pick a random computer that's online in Automate as well as in ScreenConnect, and debug the [Script - ScreenConnect Client - Connectivity - Audit*](https://proval.itglue.com/DOC-5078775-8143436) against that computer. Check the value for the internal variable `%pluginresult%`; it should be a positive integer value; if it's not returning a positive integer value and returns the value for the user variable `@Online@` equals `-2`, then the [RMM+ solution](https://proval.itglue.com/5078775/docs/9770217) is not properly configured and needs to be rechecked (Step 1).

9. Configure the solution as follows:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [CWM - Automate - Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387)
       - Configure with the alert template: `△ CUSTOM - Autofix - Offline Agent Remediation (RMM+)`
       - Set the required ticket category (To Alert on broken agents).
       - Right-click and Run Now to start the monitor.



