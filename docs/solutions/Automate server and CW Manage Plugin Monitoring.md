---
id: '98773b6a-7986-4df2-90a5-fb559eefc50b'
title: 'Automate server and CW Manage Plugin Monitoring'
title_meta: 'Automate server and CW Manage Plugin Monitoring'
keywords: ['automate', 'monitoring', 'plugins', 'efficiency', 'proactivity']
description: 'This document outlines a solution aimed at enhancing the efficiency and proactivity of the Automate server and CW Manage plugins monitoring process. It includes important notices, associated content, and implementation steps to ensure seamless monitoring and issue resolution.'
tags: ['database', 'email']
draft: false
unlisted: false
---

## Purpose

The goal of this solution's development is to improve the efficiency and proactivity of the Automate server and CW Manage plugins' monitoring process. Both are essential tools for our partners, so we want to keep a close check on them and resolve any issues before they affect productivity.

**If the "Supported Environment" column says "Both" then the solution can be imported for the "Hosted" partners as well.**

## Associated Content

| Content | Priority | Type | Supported Environment | Function |
|---------|----------|------|-----------------------|----------|
| [Script - Unsynced Tickets](https://proval.itglue.com/DOC-5078775-13283114) | High | Client Script | Both | Email the details of the unsynced tickets to the email address(es) set in the system property `Unsynced_Ticket_Email_Address`. |
| [Script - Backup Scripts/Monitors/Customizations](https://proval.itglue.com/DOC-5078775-13725091) | High | Client Script | Both | To perform a scheduled backup of various customizations and create an Autotask ticket if not properly configured. |
| [Script - Nightly Database Backup Monitoring*](https://proval.itglue.com/DOC-5078775-10390939) | Medium | Script | Both | Creates a ticket if Labtech's Nightly backup fails. Subject: Nightly Database Backup Failed |
| [ProVal - Production - Failed Email Monitoring](https://proval.itglue.com/DOC-5078775-10220814) | Medium in CW Manage, High for other environments | Internal Monitor | Both | Reports any failed email within the last hour except specified exclusions. |
| [Internal Monitor - Automate - Over 90% Licenses Used [G]](https://proval.itglue.com/DOC-5078775-8063471) OR [Less Than 10 Licenses Remaining [G]](https://proval.itglue.com/DOC-5078775-7936285) | Medium | Internal Monitor | Both | Checks Automate license availability and notifies of failures. |
| [Monitor - ScreenConnect - Broken Integration](https://proval.itglue.com/DOC-5078775-10390975) | Urgent | Internal Monitor | Both | Creates an urgent ticket in case of broken integration between ConnectWise Automate and Control. |
| [Internal Monitor - Heartbeat Anomaly Audit](https://proval.itglue.com/DOC-5078775-15764003) | Medium | Internal Monitor | Both | Creates a ticket if there are fewer heartbeats than expected. |
| [Script - Email Creation - Computer [Failure Only]](https://proval.itglue.com/DOC-5078775-10390936) | | Autofix Script | Both | Sends email to specified addresses for FAILED outcomes of a RAWSQL monitor. |

**On-Prem Only:**

| Content | Priority | Type | Supported Environment | Function |
|---------|----------|------|-----------------------|----------|
| [ProVal - Production - SVC-CWAFileService](https://proval.itglue.com/DOC-5078775-10390991) | Urgent | Remote Monitor | On-Prem | Creates an urgent ticket and attempts to restart CWAFileService. |
| [ProVal - Production - SVC-LTRedirSVC](https://proval.itglue.com/DOC-5078775-10390993) | Urgent | Remote Monitor | On-Prem | Creates an urgent ticket and attempts to restart LTRedirSVC. |
| [ProVal - Production - SVC-CWAMessageQueue](https://proval.itglue.com/DOC-5078775-10390989) | Urgent | Remote Monitor | On-Prem | Creates an urgent ticket and attempts to restart CWAMessageQueue. |
| [CWA - Remote Monitors - CWAFileService - Invalid Token](https://proval.itglue.com/DOC-5078775-15386754) | Medium | Remote Monitor | On-Prem | Restarts CWAFileService if specific errors are detected in logs. |

## Implementation

1. **Import the following Alert Templates using the ProSync Plugin:**
- Custom - Email RAWSQL Monitor set results to ProVal
- Custom - Ticket Creation - Without Computer Details

_If the partner is On-Prem,_ import this alert template as well:
- Custom - Autofix - Restart Service - Automate Server Monitoring

2. Modify the following System Properties - If any of these values are not provided by the consultant, reach out to clarify:
- Unsynced_Ticket_Email_Address - This is where the partner would like alerts for any ticket sync issues to go to.
- AutomateBackup_Computerid - This is going to be the AgentID of where the partner would like their content backup to be stored. 
- _sysTicketDefaultEmail - This is a default email address that is set for sending data in the case where the user wants the email to be sent from the script.
- ProVal_Alerts_Email_Address - This email address is used when the script calls from the alert template "△ Custom - Email RAWSQL Monitor set results to ProVal".
Note: It is mandatory to use the alerts@provaltech.com with this system property as it is intentionally created for the alerts which is required to be passed on to the ProVal support team from the partner environment for proactive fixes.
Optional System Properties:
- AutomateBackup_Base_Directory - If the consultant specified any custom value for this, please update it. Otherwise, it will go to the default directory of 'C:\CWA Solutions Backup'

3. **Import and set the approved content to the partner's environment using the ProSync Plugin.** If it is NOT specified to specifically not import certain content, assume it is all approved. The content required for import has been listed below:
- [Script - Unsynced Tickets](<../cwa/scripts/Unsynced Tickets.md>)
- [Script - Email RAWSQL Monitor Set Failures* [Autofix]](https://proval.itglue.com/DOC-5078775-10390936)
- [Client Script - Automate - Backup Scripts/Monitors/Customizations](https://proval.itglue.com/DOC-5078775-13725091)
- [Client Script - Nightly Database Backup Monitoring*[Global]](https://proval.itglue.com/DOC-5078775-10390939)
- [Internal Monitor - ProVal - Production - Failed Email Monitoring](https://proval.itglue.com/DOC-5078775-10220814)
- [Internal Monitor - ScreenConnect - Broken Integration](https://proval.itglue.com/DOC-5078775-10390975)
- [Internal Monitor - Heartbeat Anomaly Audit](https://proval.itglue.com/DOC-5078775-15764003)
- [Internal Monitor - ProVal - Production - Scripting Engine Hung](https://proval.itglue.com/DOC-5078775-15915259)

4. **Setup the content that was just imported:**
- Navigate to the System Dashboard screen --> Management --> Scheduled Client Scripts
    - Schedule [Script - Unsynced Tickets](<../cwa/scripts/Unsynced Tickets.md>) to run every 2 hours
Schedule Client Script - Automate - Backup Scripts/Monitors/Customizations to run weekly, Every Monday at 5:40 AM
Schedule Client Script - Nightly Database Backup Monitoring*[Global] to run daily at 2:30 PM
Navigate to Automate --> Monitors
Setup Internal Monitor - ProVal - Production - Failed Email Monitoring
For hosted partners only, you must modify this client ID variable in the monitor to whatever the partner's client ID is:

Assign the alert template '△ Custom - Ticket Creation - Without Computer Details' to the monitor
Right-click the monitor and select Run Now and Reset Monitor
Setup Internal Monitor - ProVal - Production - Automate - Less Than 10 Licenses Remaining [G] OR Internal Monitor - ProVal - Production - Automate - Over 90% Licenses Used [G] - Depending on what the Consultant has requested
Apply the 'Default - Create Automate Ticket' alert template to the monitor
Right-click the monitor and select Run Now and Reset Monitor
Setup Internal Monitor - ProVal - Production - ScreenConnect - Broken Integration
Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
Right-click the monitor and select Run Now and Reset Monitor
Setup Internal Monitor - Heartbeat Anomaly Audit 
Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
Right-click the monitor and select Run Now and Reset Monitor
Setup Internal Monitor - ProVal - Production - Scripting Engine Hung
Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
Right-click the monitor and select Run Now and Reset Monitor
**On-Prem Only:**

1. **Import and set the following content using the ProSync Plugin:**
- [Script: Purge IIS Log Files Older than X days[Param]](https://proval.itglue.com/DOC-5078775-10390932)
- [CWM - Automate - Script - Automate Server Monitoring - Service - Restart [Autofix]](https://proval.itglue.com/5078775/docs/11182312#version=published&documentMode=edit)
- Alert Template: ? Custom - Autofix - Restart Service - Automate Server Monitoring

2. **Setup the content that was just imported:**
- Schedule the required tasks as per the instructions.

3. **Import and setup Remote Monitors using SQL statements.**



## Deprecated Content - November 2023

| Content | Priority | Type | Supported Environment | Function |
|---------|----------|------|-----------------------|----------|
| **Deprecated:** ? Autofix - Ticket Sync Failed | | Alert Template | Both | Assigned to the [ProVal - Production - Automate - Ticket Sync Unsuccessful](https://proval.itglue.com/DOC-5078775-8030159) monitor set. Executes the [Ticket Sync Failed [Autofix, Globals]](https://proval.itglue.com/DOC-5078775-8059488) script. |
| **Deprecated:** [ProVal - Development - Automate - Unsynced Ticket Comment](https://proval.itglue.com/DOC-5078775-10390973) | High | Internal Monitor | Both | Alerts partners of unsynced ticket comments already synchronized to CW Manage. Uses ~Custom Email RAWSQL Monitor set results to the Partner. Subject: Ticket Comment Failed to Sync to Manage for %ExternalID% |
| **Deprecated:** ? Email RAWSQL Monitor set results to the Partner | | Alert Template | Both | Assigned to the [ProVal - Development - Automate - Unsynced Ticket Comment](https://proval.itglue.com/DOC-5078775-10390973) monitor set. Executes the [Email RAWSQL Monitor Set Failures* [Autofix]](https://proval.itglue.com/DOC-5078775-10390936) script. |
| **Deprecated:** [ProVal - Development - CW Manage Plugin Errors](https://proval.itglue.com/DOC-5078775-10390974) | Medium | Internal Monitor | Both | Notifies [alerts@provaltech.com](mailto:alerts@provaltech.com) of critical CW Manage Plugin errors. Default - Do Nothing for now. Subject: CW Manage Plugin Errors Detected for %Result% |
| **Deprecated:** ~Custom Email RAWSQL Monitor set results to ProVal | | Alert Template | Both | Assigned to the [ProVal - Development - CW Manage Plugin Errors](https://proval.itglue.com/DOC-5078775-10390974) and [Control - Broken Integration](https://proval.itglue.com/DOC-5078775-10390975) monitor sets. Executes the [Email RAWSQL Monitor Set Failures* [Autofix]](https://proval.itglue.com/DOC-5078775-10390936) script. |
| **Deprecated:** [ProVal - Development - Automate Server - Unwanted Event Logs Monitoring](https://proval.itglue.com/DOC-5078775-10390990) | Medium | Remote Monitor | On-Prem | Generates an urgent ticket if specific events generate more than 10 times in 60 minutes. Default - Do Nothing for now. Subject: Urgent - Automate Server - Unwanted Event Logs Detected |
| **Deprecated:** [Automate Server - Event Log Monitoring [Autofix]](https://proval.itglue.com/DOC-5078775-10390937) | | Autofix Script | On-Prem | Sends information of detected event logs. Does not notify for Success status. |
| **Deprecated:** ? Automate Server - Event Log Monitoring [Autofix] | | Alert Template | On-Prem | Assigned to the [Automate Server - Unwanted Event Logs Monitoring](https://proval.itglue.com/DOC-5078775-10390990) monitor set. Executes the [Event Log Monitoring [Autofix]](https://proval.itglue.com/DOC-5078775-10390937) script. |
| **Deprecated:** [Database size increased by 5%*[Global]](https://proval.itglue.com/DOC-5078775-10390940) | Medium | Script | Both | Creates a ticket if the Labtech Database size increases by a set threshold. Subject: Database size increased by @SizeToCompare@ Percent within the last @Hours@ Hour |
| **Deprecated:** [Volume Free Space - Monitor Creation - Automate Server Only](https://proval.itglue.com/DOC-5078775-10495787) | Medium | Script | On-Prem | Monitors server drives and generates a ticket for failures. Subject: Volume Space - %FieldName%: (%ComputerName%-%Computerid%) |
| **Deprecated:** [ConnectWise Manage Plugin Sync/Mapping Audit](https://proval.itglue.com/DOC-5078775-10390938) | Medium | Script | Both | Sends an email if it finds unsynced/unmapped components in the CW Manage plugin. Default - Do Nothing for now. Subject: Unmapped/Unsynced entity detected in CW Manage Plugin |