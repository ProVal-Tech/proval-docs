---
id: 'ab580d76-42be-4b34-b38b-3a7e9336c13e'
slug: /ab580d76-42be-4b34-b38b-3a7e9336c13e
title: 'OfflineBroken Agents'
title_meta: 'OfflineBroken Agents'
keywords: ['offline', 'agent', 'remediation', 'automate', 'connectwise']
description: 'This document outlines a solution for detecting machines that have been offline in ConnectWise Automate for more than 30 days, differentiating between various agent statuses, and fixing issues with broken agents. It includes implementation steps and associated content for effective management of offline agents.'
tags: []
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to detect machines that have been offline in Automate for more than 30 days and to differentiate between agents that are offline in both ScreenConnect and Automate, agents that are offline only in Automate, and to fix issues with broken agents (computers that are offline in Automate but are online in ScreenConnect).

## Associated Content

### Automation Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [Internal Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234) | Internal Monitor | Detects computers that have been offline in Automate for more than 30 days. |
| [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) | Script | Distinguishes the agents and attempts to fix the broken agents. |
| △ Custom - Autofix - Offline Agent Remediation (RMM+) | Alert Template | Executes the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) as an auto-fix for the [Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234) |
| [Dataview - Agent - Agent Check-in Health](/docs/72e598df-0fcf-471d-9ee8-030986141642) | Dataview | Displays the agent status for each agent returned by the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) |
| [Dataview - Repaired Agents Last 30 Days](/docs/cafd4aba-ae71-4098-bde5-52173cdc0427) | Dataview | Displays information about the agents repaired by the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) |

### Other Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [CW RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246) | Configuration | A how-to document that explains how to configure RMM+ and ensure this content works as intended. |
| [Custom Table - pvl_repaired_agents](/docs/1258c674-8d60-446d-a3c6-f3295ee682cf) | Custom Table | The custom table stores information about agents repaired by the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) |
| [Script - Track Repaired Agents](/docs/1cfbe430-0cbd-4abf-861d-4884632b7705) | Sub-Script | Stores information about the agents repaired by the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) into the [Custom Table - pvl_repaired_agents](/docs/1258c674-8d60-446d-a3c6-f3295ee682cf) custom table. |
| [Script - ScreenConnect Client - Connectivity - Audit*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458) | Sub-Script | Determines whether the computer is online in the ScreenConnect portal. |
| [Script - ScreenConnect Client - Command - Execute*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6) | Sub-Script | Executes commands on the machine from the ScreenConnect portal. |
| [Script - Automate Agent - Reinstall*](/docs/567b8db7-a87a-45c1-a81a-b3178090fb52) | Sub-Script | Attempts to reinstall the Automate agent via the ScreenConnect portal. |
| Agent - Generate Location Installer URL* | Sub-Script | Generates the agent installer token for the reinstall command. |

## Implementation

1. Ensure RMM+ is configured correctly using the following documentation:
   - [CW RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)

2. If the [Internal Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234) already exists and is running the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) as an auto-fix, please delete the monitor from the system before proceeding to the next step to ensure you get the latest content installed.
   - Take note of the ticket category before deleting it so we can keep it the same between updates.
   - If no ticket category is specified and none was set up on the old monitor, please consult with the consultant to ensure they do not want tickets created for broken agents.

3. Import the following content using the ProSync Plugin:
   - [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c)
   - [Internal Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234)
   - [Dataview - Agent - Agent Check-in Health](/docs/72e598df-0fcf-471d-9ee8-030986141642)
   - [Dataview - Repaired Agents Last 30 Days](/docs/cafd4aba-ae71-4098-bde5-52173cdc0427)
   - Alert Template - `△ Custom - Autofix - Offline Agent Remediation (RMM+)`

4. Reload the system cache.

5. Importing the parent script should also import the Sub-Scripts. If you are unable to find the Sub-Scripts after reloading the system cache, then import the following scripts from the ProSync plugin:
   - [Script - Track Repaired Agents](/docs/1cfbe430-0cbd-4abf-861d-4884632b7705)
   - [Script - ScreenConnect Client - Connectivity - Audit*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458)
   - [Script - ScreenConnect Client - Command - Execute*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6)
   - [Script - Automate Agent - Reinstall*](/docs/567b8db7-a87a-45c1-a81a-b3178090fb52)
   - Agent - Generate Location Installer URL*

   Then reload the system cache again.

6. Run the [Script - Automate Agent - Auto Repair*](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) against a random computer with the `Set Environment = 1`. This will create the system properties used by the script.

7. Go to system properties and set the required values for the `Agent_Repair_Duplicate_Check_Enabled` and `Agent_Repair_Re_Install_Enabled` properties. Check the `System Properties` table of the [script's document](/docs/7c0947f0-306b-4ae0-9bd7-dd15dfb0008c) for more information on these properties.

8. Pick a random computer that is online in both Automate and ScreenConnect, and debug the [Script - ScreenConnect Client - Connectivity - Audit*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458) against that computer. Check the value for the internal variable `%pluginresult%`; it should be a positive integer value. If it is not returning a positive integer value and returns the value for the user variable `@Online@` equals `-2`, then the [RMM+ solution](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246) is not properly configured and needs to be rechecked (Step 1).

9. Configure the solution as follows:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [CWM - Automate - Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234)
       - Configure with the alert template: `△ CUSTOM - Autofix - Offline Agent Remediation (RMM+)`
       - Set the required ticket category (to alert on broken agents).
       - Right-click and Run Now to start the monitor.

