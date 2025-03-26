---
id: '98773b6a-7986-4df2-90a5-fb559eefc50b'
slug: /98773b6a-7986-4df2-90a5-fb559eefc50b
title: 'Automate server and CW Manage Plugin Monitoring'
title_meta: 'Automate server and CW Manage Plugin Monitoring'
keywords: ['automate', 'monitoring', 'plugins', 'efficiency', 'proactivity']
description: 'This document outlines a solution aimed at enhancing the efficiency and proactivity of the Automate server and CW Manage plugins monitoring process. It includes important notices, associated content, and implementation steps to ensure seamless monitoring and issue resolution.'
tags: ['database', 'email']
draft: false
unlisted: false
---

## Purpose

The goal of this solution's development is to improve the efficiency and proactivity of the Automate server and CW Manage plugins monitoring process. Both of these are essential tools for our partners, so we want to keep a close check on them and resolve any issues before they affect productivity.

**If the "Supported Environment" column says "Both" then the solution can be imported for the "Hosted" partners as well.**

## Associated Content

| Content                                                                                                                                                                                                                                          | Priority | Type             | Supported Environment | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ---------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Script - Unsynced Tickets](/docs/eb434aae-87c4-4315-bf73-202a41ff3a96)                                                                                                                                                                                | High     | Client Script    | Both                  | Email the details of the unsynced tickets to the email address(es) set in the system property `Unsynced_Ticket_Email_Address`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| [Script - Backup Scripts/Monitors/Customizations](/docs/19787a52-3223-44e1-8670-ecf74f1b415c)                                                                                                                                      | High     | Client Script    | Both                  | To perform a scheduled backup of the following customizations:<br />- Scripts<br />- Scriptlets<br />- Internal Monitors<br />- Group Monitors<br />- Remote Monitors<br />- Dataviews<br />- Role Definitions<br />- ExtraData Fields<br />- VirusScanners<br />Creates an Autotask ticket if the computerid to save the backup is not properly configured.<br />Email Subject: Automate Customizations Backup FAILED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [Script - Nightly Database Backup Monitoring*](/docs/002e4435-9142-4373-a857-6bf91c16d7af)                                                                                                                                           | Medium   | Script           | Both                  | This script will create a ticket in our (ProValtech's) Autotask Portal if Labtech's Nightly backup Fails.<br />Subject: Nightly Database Backup Failed<br />*Change to two days in a row of failed backups since we now have our backup script                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| [ProVal - Production - Failed Email Monitoring](/docs/f1a15d3d-85d7-4d72-9c08-ad4ca6a7dfbb)                                                                                                                          | Medium   | Internal Monitor | Both                  | This Monitor reports any failed email that is not related to 'Google authenticator', 'Testing Email Flow', or 'Authentication Token' that has occurred within the last hour.<br />It will generate only one ticket per hour with the information of all the emails that failed within that interval.<br />Alert Template: ~Custom Ticket Creation without computer Details<br />Subject: Automate Failed Email detected<br />*Convert this to a client script?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| [Internal Monitor -Automate - Over 90% Licenses Used [G]](/docs/b3d41d1c-e687-4e39-811a-83d6fb99c14d) OR [Internal Monitor - Automate - Less Than 10 Licenses Remaining [G]](/docs/86cf6cf1-58cc-404d-ab7a-a80658e7b91f) | Medium   | Internal Monitor | Both                  | Check current Automate license availability. Suggested monitor failure is 90% usage. It will notify the partners of the failures.<br />Alert Template: Default Create Automate Ticket<br />**The Ticket Category of the monitor set should be adjusted as per the requirements.<br />Subject: Automate Server Over Licenses<br />Check current Automate license availability. It will notify the partners if only 10 licenses are left.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| [Monitor - ScreenConnect - Broken Integration](/docs/a3e17618-1629-4eca-ae93-e70dd47e3496)                                                                                                                                                          | Urgent   | Internal Monitor | Both                  | The monitor set is designed to create an urgent ticket to our (ProVal's) AutoTask Portal for a broken integration between ConnectWise Automate and Control.<br />Alert Template: △ Custom - Email RAWSQL Monitor set results to ProVal<br />Subject: Urgent - Integration Between Control and Automate is broken                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [Internal Monitor - Heartbeat Anomaly Audit](/docs/fc109cdb-9f88-448b-8c57-b866b2e3c7c2)                                                                                                                                                       | Medium   | Internal Monitor | Both                  | This monitor is intended to create a ticket to our (ProVal's) AutoTask Portal if there are fewer heartbeats than expected from the machines checking in within the environment.<br />Alert Template: △ Custom - Email RAWSQL Monitor set results to ProVal<br />Subject: CWA - Heartbeat Anomaly detected                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| [Script - Email Creation - Computer [Failure Only]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41)                                                                                                                                  |          | Autofix Script   | Both                  | This script functions similarly to the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script however, instead of creating a ticket, it is designed to send the FAILED outcomes of a RAWSQL monitor to the Email address provided in the system property.<br />This script sends email to two different addresses:<br />1. If the script is called by the alert template "△ Custom - Email RAWSQL Monitor set results to ProVal" then it will send an email to the email address set at system property "ProVal_Alerts_Email_Address" which is mostly set to "alerts@provaltech.com".<br />Note: If the property is missing, the script will automatically set it to "alerts@provaltech.com", but if it is set to a different email address then it will not modified.<br />2. If the script is called by any other template then it will fetch the email address from the system property "_sysTicketDefaultEmail". |
| △ Ticket Creation - without computer Details                                                                                                                                                                                                     |          | Alert Template   | Both                  | This alert template should be assigned to the [ProVal - Development - Failed Email Monitoring](/docs/f1a15d3d-85d7-4d72-9c08-ad4ca6a7dfbb) monitor set. It will execute the [Ticket Creation - Without Computer Information And Failures Only [Autofix]*](/docs/730449e6-1c73-46ca-a93d-d7b9526e1ef9) script to create a ticket with the information returned by the monitor set.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| △ Custom - Email RAWSQL Monitor set results to ProVal                                                                                                                                                                                            |          | Alert Template   | Both                  | This alert template should be assigned to the [Monitor - ProVal - Production - ScreenConnect - Broken Integration](/docs/a3e17618-1629-4eca-ae93-e70dd47e3496) monitor sets. It will execute the [Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41) script to send an email to Alerts@provaltech.com.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| [Internal Monitor - ProVal - Production - Scripting Engine Hung](/docs/9292f135-cca4-4eba-97ff-cd4276ab62e9)                                                                                                                                     | Medium   | Internal Monitor | Both                  | This monitor creates a critical ticket to the board to inform that the script engine is stuck and none of the scripts is running in the environment.<br />It also sends an email to the alerts@provaltech.com to review it proactively.<br />The monitor detects the X number of scripts stuck in the pendingscripts table for longer than Y minutes of the scheduled time.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

### On-Prem Only:

| Content                                                                                                       | Priority | Type           | Supported Environment | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------- | -------- | -------------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ProVal - Production - SVC-CWAFileService](/docs/5ae52dd7-e476-49dd-823f-582cbf6de17e)                           | Urgent   | Remote Monitor | On-Prem               | Since CWAFileService is one of the important services for the Automate server. So, this monitor set is designed to create an urgent ticket in our (ProVal's) Autotask portal after attempting to restart it.<br />Alert Template: △ Custom - Autofix - Restart Service - Automate Server Monitoring<br />Email Subject Success: URGENT - SVC - @FieldName@ - SUCCESS - Automate Server - %ComputerName% (%Computerid%)<br />Email Subject Failure: URGENT - SVC - @FieldName@ - FAILED - Automate Server - %ComputerName% (%Computerid%)                                                                                                                                                                                                              |
| [ProVal - Production - SVC-LTRedirSVC](/docs/33120745-9fa1-4864-aff6-b97d083e3fd5)                                   | Urgent   | Remote Monitor | On-Prem               | Since LTRedirSVC is one of the important services for the Automate server. So, this monitor set is designed to create an urgent ticket in our (ProVal's) Autotask portal after attempting to restart it.<br />Alert Template: △ Custom - Autofix - Restart Service - Automate Server Monitoring<br />Email Subject Success: URGENT - SVC - @FieldName@ - SUCCESS - Automate Server - %ComputerName% (%Computerid%)<br />Email Subject Failure: URGENT - SVC - @FieldName@ - FAILED - Automate Server - %ComputerName% (%Computerid%)                                                                                                                                                                                                                  |
| [ProVal - Production - SVC-CWAMessageQueue](/docs/a1fb4b3c-b08f-4090-9df7-66e7d80ca93d)                         | Urgent   | Remote Monitor | On-Prem               | Since CWAMessageQueue is one of the important services for the Automate server. So, this monitor set is designed to create an urgent ticket in our (ProVal's) Autotask portal after attempting to restart it.<br />Alert Template: △ Custom - Autofix - Restart Service - Automate Server Monitoring<br />Email Subject Success: URGENT - SVC - @FieldName@ - SUCCESS - Automate Server - %ComputerName% (%Computerid%)<br />Email Subject Failure: URGENT - SVC - @FieldName@ - FAILED - Automate Server - %ComputerName% (%Computerid%)                                                                                                                                                                                                             |
| [CWA - Remote Monitors - CWAFileService - Invalid Token](/docs/3ccd3348-558b-41c3-8a81-c65fae2cf04e) | Medium   | Remote Monitor | On-Prem               | This remote monitor restarts the service 'CWAFileService' on the Automate server if it detects the file 'C:\Windows\Temp\FileService.log' where the file contains the message 'HttpRequest is missing or has invalid Authorization Token' in the last 15 minutes.<br />The actual message template is:<br />FileService v24.0 - 3/10/2024 3:08:12 PM - HttpRequest is missing or has invalid Authorization Token:::                                                                                                                                                                                                                                                                                                                                 |
| [Monitor - ProVal - Production - SVC-CWAIISMgr](/docs/f73d6546-470e-448b-b3db-d7b57d3d8df4)                           | Urgent   | Remote Monitor | On-Prem               | Since CWAIISMgr is one of the important services for the Automate server. So, this monitor set is designed to create an urgent ticket in our (ProVal's) Autotask portal after attempting to restart it.<br />Alert Template: △ Custom - Autofix - Restart Service - Automate Server Monitoring<br />Email Subject Success: URGENT - SVC - @FieldName@ - SUCCESS - Automate Server - %ComputerName% (%Computerid%)<br />Email Subject Failure: URGENT - SVC - @FieldName@ - FAILED - Automate Server - %ComputerName% (%Computerid%)                                                                                                                                                                                                                   |
| [Purge IIS Log Files Older than X days[Param]](/docs/a7a7e04e-384d-4018-87c5-6abf2d2b2fb2)    |          | Script         | On-Prem               | It will remove the IIS logs older than `Days`(Global Variable) days if the size of the "c:\\inetpub\\logs\\logfiles\\w3svc" folder is greater than `Size`(Global Variable) MB. Preferred is to schedule against the "Labtech Server" Group to run once per week.<br />By default, it will remove the logs older than 30 days if the size of the directory is greater than 1024 MB.<br />*Log Entries need fixing<br />*Change threshold to 16GB? Homefield is always failing because it drops it to 15GB used instead of 19GB.                                                                                                                                                                                                                        |
| △ Custom - Autofix - Restart Service - Automate Server Monitoring                                             |          | Alert Template | On-Prem               | This alert template should be assigned to the [ProVal - Development - SVC-CWAFileService](/docs/5ae52dd7-e476-49dd-823f-582cbf6de17e), [ProVal - Development - SVC-LTRedirSVC](/docs/33120745-9fa1-4864-aff6-b97d083e3fd5), [ProVal - Development - SVC-CWAMessageQueue](/docs/a1fb4b3c-b08f-4090-9df7-66e7d80ca93d), and monitor sets. It will attempt to restart the service and will send an Email for Autofix failure to Alerts@ProValtech.com which in turn will generate a ticket in our (ProVal's) Autotask portal.<br />Email Subject Success: URGENT - SVC - @FieldName@ - SUCCESS - Automate Server - %ComputerName% (%Computerid%)<br />Email Subject Failure: URGENT - SVC - @FieldName@ - FAILED - Automate Server - %ComputerName% (%Computerid%) |

## Implementation

1. Import the following Alert Templates using the ProSync Plugin:
   - △ Custom - Email RAWSQL Monitor set results to ProVal
   - △ Custom - Ticket Creation - Without Computer Details
   - **If the partner is On-Prem** - Import this alert template as well:
     - △ Custom - Autofix - Restart Service - Automate Server Monitoring

2. Modify the following System Properties - If any of these values are not provided by the consultant, reach out to clarify:
   - Unsynced_Ticket_Email_Address - This is where the partner would like alerts for any ticket sync issues to go to.
   - AutomateBackup_Computerid - This is going to be the AgentID of where the partner would like their content backup to be stored.
   - _sysTicketDefaultEmail - This is a default email address that is set for sending data in the case where the user wants the email to be sent from the script.
   - ProVal_Alerts_Email_Address - This email address is used when the script calls from the alert template "△ Custom - Email RAWSQL Monitor set results to ProVal".<br />Note: It is mandatory to use the [alerts@provaltech.com](mailto:alerts@provaltech.com) with this system property as it is intentionally created for the alerts which is required to be passed on to the ProVal support team from the partner environment for proactive fixes.

   Optional System Properties:
   - AutomateBackup_Base_Directory - If the consultant specified any custom value for this, please update it. Otherwise, it will go to the default directory of 'C:\\CWA Solutions Backup'.

3. Import and set the **approved content** to the partner's environment using the ProSync Plugin. If it is NOT specified to specifically not import certain content, assume it is all approved. The content required for import has been listed below:
   - [Script - Unsynced Tickets](/docs/eb434aae-87c4-4315-bf73-202a41ff3a96)
   - [Script - Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41)
   - [CWM - Automate - Script - Email Creation - Computer [Failure Only]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41)
   - [Client Script - Automate - Backup Scripts/Monitors/Customizations](/docs/19787a52-3223-44e1-8670-ecf74f1b415c)
   - [Client Script - Nightly Database Backup Monitoring*[Global]](/docs/002e4435-9142-4373-a857-6bf91c16d7af)
   - [Internal Monitor - ProVal - Production - Failed Email Monitoring](/docs/f1a15d3d-85d7-4d72-9c08-ad4ca6a7dfbb)
   - [Internal Monitor - ProVal - Production - Automate - Less Than 10 Licenses Remaining [G]](/docs/86cf6cf1-58cc-404d-ab7a-a80658e7b91f) OR [Internal Monitor - ProVal - Production - Automate - Over 90% Licenses Used [G]](https://proval.itglue.com/DOC-5078775-8063471)<br />This should be specified by the consultant. If not, reach out to clarify.
   - [Internal Monitor - ProVal - Production - ScreenConnect - Broken Integration](/docs/a3e17618-1629-4eca-ae93-e70dd47e3496)
   - [Internal Monitor - Heartbeat Anomaly Audit](/docs/fc109cdb-9f88-448b-8c57-b866b2e3c7c2)
   - [Internal Monitor - ProVal - Production - Scripting Engine Hung](/docs/9292f135-cca4-4eba-97ff-cd4276ab62e9)

4. Setup the content that was just imported:
   - Navigate to the System Dashboard screen --> Management --> Scheduled Client Scripts
     - Schedule [Script - Unsynced Tickets](/docs/eb434aae-87c4-4315-bf73-202a41ff3a96) to run every 2 hours
     - Schedule [Client Script - Automate - Backup Scripts/Monitors/Customizations](/docs/19787a52-3223-44e1-8670-ecf74f1b415c) to run weekly, Every Monday at 5:40 AM
     - Schedule [Client Script - Nightly Database Backup Monitoring*[Global]](/docs/002e4435-9142-4373-a857-6bf91c16d7af) to run daily at 2:30 PM
   - Navigate to Automate --> Monitors
     - Setup [Internal Monitor - ProVal - Production - Failed Email Monitoring](/docs/f1a15d3d-85d7-4d72-9c08-ad4ca6a7dfbb)
       - **For hosted partners only**, you must modify this client ID variable in the monitor to whatever the partner's client ID is:
       - Assign the alert template '△ Custom - Ticket Creation - Without Computer Details' to the monitor
       - Right-click the monitor and select Run Now and Reset Monitor
     - Setup [Internal Monitor - ProVal - Production - Automate - Less Than 10 Licenses Remaining [G]](/docs/86cf6cf1-58cc-404d-ab7a-a80658e7b91f) OR [Internal Monitor - ProVal - Production - Automate - Over 90% Licenses Used [G]](https://proval.itglue.com/DOC-5078775-8063471) - Depending on what the Consultant has requested
       - Apply the 'Default - Create Automate Ticket' alert template to the monitor
       - Right-click the monitor and select Run Now and Reset Monitor
     - Setup [Internal Monitor - ProVal - Production - ScreenConnect - Broken Integration](/docs/a3e17618-1629-4eca-ae93-e70dd47e3496)
       - Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
       - Right-click the monitor and select Run Now and Reset Monitor
     - Setup [Internal Monitor - Heartbeat Anomaly Audit](/docs/fc109cdb-9f88-448b-8c57-b866b2e3c7c2)
       - Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
       - Right-click the monitor and select Run Now and Reset Monitor
     - Setup [Internal Monitor - ProVal - Production - Scripting Engine Hung](/docs/9292f135-cca4-4eba-97ff-cd4276ab62e9)
       - Apply the '△ Custom - Email RAWSQL Monitor set results to ProVal' alert template to the monitor
       - Right-click the monitor and select Run Now and Reset Monitor

### On-Prem Only:

1. Import and set the following content using the ProSync Plugin:
   - Script: [Purge IIS Log Files Older than X days[Param]](/docs/a7a7e04e-384d-4018-87c5-6abf2d2b2fb2)
   - Script: [CWM - Automate - Script - Automate Server Monitoring - Service - Restart [Autofix]](/docs/870dc2c7-95ea-494e-aefd-05609925545b)
   - Alert Template: △ Custom - Autofix - Restart Service - Automate Server Monitoring

2. Setup the content that was just imported:
   - Navigate to the LabTech Server Group (Service Plans --> Server Roles --> MSP Specific Servers --> LabTech Server)
     - Schedule Script: [Purge IIS Log Files Older than X days[Param]](/docs/a7a7e04e-384d-4018-87c5-6abf2d2b2fb2) to run every Sunday at 10:35 PM

3. Import the Remote Monitor using the below SQL statement from a RAWSQL monitor: **ProVal - Production - SVC-CWAFileService:**
   ```sql
   SET @Alertaction = (SELECT Alertactionid FROM alerttemplate WHERE guid = 'cec8ea1c-dd39-4003-8a18-fa2d6dbddedd');
   SET @groupid = (SELECT MIN(Groupid) FROM mastergroups WHERE NAME = 'Labtech Server');
   INSERT INTO groupagents
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - SVC-CWAFileService' as `Name`,
   '6' as `CheckAction`,
   @Alertaction as `AlertAction`,
   'URGENT - SVC-CWAFileService is Not Running for Automate Server~~~CWAFileService is now Running Fine.!!!URGENT - SVC-CWAFileService is Not Running for Automate Server~~~CWAFileService is not Running for the Automate Server. Please check it out as soon as possible.' as `AlertMessage`,
   '1' as `ContactID`,
   '60' as `interval`,
   '127.0.0.1' as `Where`,
   '2' as `What`,
   'CWAFileService' as `DataOut`,
   '1' as `Comparor`,
   '1' as `DataIn`,
   '0' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '0' as `Category`,
   '0' as `TicketCategory`,
   '1' as `ScriptTarget`,
   CONCAT(
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
   ) as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid = @groupid
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - SVC-CWAFileService');
   ```

4. Import the Remote Monitor using the below SQL statement from a RAWSQL monitor: **ProVal - Production - SVC-LTRedirSvc:**
   ```sql
   SET @Alertaction = (SELECT Alertactionid FROM alerttemplate WHERE guid = 'cec8ea1c-dd39-4003-8a18-fa2d6dbddedd');
   SET @groupid = (SELECT MIN(Groupid) FROM mastergroups WHERE NAME = 'Labtech Server');
   INSERT INTO groupagents
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - SVC-LTRedirSvc' as `Name`,
   '6' as `CheckAction`,
   @Alertaction as `AlertAction`,
   'URGENT - SVC-LTRedirSvc is Not Running for Automate Server~~~LTRedirSvc is now Running Fine.!!!URGENT - SVC-LTRedirSvc is Not Running for Automate Server~~~LTRedirSvc is not Running for the Automate Server. Please check it out as soon as possible.' as `AlertMessage`,
   '1' as `ContactID`,
   '60' as `interval`,
   '127.0.0.1' as `Where`,
   '2' as `What`,
   'LTRedirSvc' as `DataOut`,
   '1' as `Comparor`,
   '1' as `DataIn`,
   '0' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '0' as `Category`,
   '0' as `TicketCategory`,
   '1' as `ScriptTarget`,
   CONCAT(
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
   ) as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid = @groupid
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - SVC-LTRedirSvc');
   ```

5. Import the Remote Monitor using the below SQL statement from a RAWSQL monitor: **ProVal - Production - SVC-CWAMessageQueue:**
   ```sql
   SET @Alertaction = (SELECT Alertactionid FROM alerttemplate WHERE guid = 'cec8ea1c-dd39-4003-8a18-fa2d6dbddedd');
   SET @groupid = (SELECT MIN(Groupid) FROM mastergroups WHERE NAME = 'Labtech Server');
   INSERT INTO groupagents
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - SVC-CWAMessageQueue' as `Name`,
   '6' as `CheckAction`,
   @Alertaction as `AlertAction`,
   'URGENT - SVC-CWAMessageQueue is Not Running for Automate Server~~~CWAMessageQueue is now Running Fine.!!!URGENT - SVC-CWAMessageQueue is Not Running for Automate Server~~~CWAMessageQueue is not Running for the Automate Server. Please check it out as soon as possible.' as `AlertMessage`,
   '1' as `ContactID`,
   '60' as `interval`,
   '127.0.0.1' as `Where`,
   '2' as `What`,
   'CWAMessageQueue' as `DataOut`,
   '1' as `Comparor`,
   '1' as `DataIn`,
   '0' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '0' as `Category`,
   '0' as `TicketCategory`,
   '1' as `ScriptTarget`,
   CONCAT(
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
   ) as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid = @groupid
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - SVC-CWAMessageQueue');
   ```

6. Import the Remote Monitor using the below SQL statement from a RAWSQL monitor: **ProVal - Production - SVC-CWAIISMgr:**
   ```sql
   SET @Alertaction = (SELECT Alertactionid FROM alerttemplate WHERE guid = 'cec8ea1c-dd39-4003-8a18-fa2d6dbddedd');
   SET @groupid = (SELECT MIN(Groupid) FROM mastergroups WHERE NAME = 'Labtech Server');
   INSERT INTO groupagents
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - SVC-CWAIISMgr' as `Name`,
   '6' as `CheckAction`,
   @Alertaction as `AlertAction`,
   'URGENT - SVC-CWAIISMgr is Not Running for Automate Server~~~CWAIISMgr is now Running Fine.!!!URGENT - SVC-CWAIISMgr is Not Running for Automate Server~~~CWAIISMgr is not Running for the Automate Server. Please check it out as soon as possible.' as `AlertMessage`,
   '1' as `ContactID`,
   '60' as `interval`,
   '127.0.0.1' as `Where`,
   '2' as `What`,
   'CWAIISMgr' as `DataOut`,
   '1' as `Comparor`,
   '1' as `DataIn`,
   '0' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '0' as `Category`,
   '0' as `TicketCategory`,
   '1' as `ScriptTarget`,
   CONCAT(
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   '-',
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
   SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
   ) as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid = @groupid
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - SVC-CWAIISMgr');
   ```

7. Import the Remote Monitor using the documentation below:
   - [Import - Remote Monitor - CWAFileService - Invalid Token](/docs/3ccd3348-558b-41c3-8a81-c65fae2cf04e)
     - Make sure to set the Alert Template on the monitor to 'Default - Create Automate Ticket'
     - Use the defaults in the SQL unless otherwise stated.

## Deprecated Content - November 2023

| Content                                                                                                                                                          | Priority | Type             | Supported Environment | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Deprecated:** △ Autofix - Ticket Sync Failed                                                                                                                   |          | Alert Template   | Both                  | This alert template should be assigned to the [ProVal - Production - Automate - Ticket Sync Unsuccessful](/docs/1fa27f5d-ca9d-4bff-8776-569a15f772d3) monitor set. It will execute the [Ticket Sync Failed [Autofix, Globals]](/docs/f490325a-023c-430d-876d-e4d311ff3e89) script.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                                                                                                                                                                  |
| **Deprecated:** [ProVal - Development - Automate - Unsynced Ticket Content](/docs/6a855fe6-df02-4668-81c3-8cd392595c31)                                      | High     | Internal Monitor | Both                  | The main objective of the monitor set is to alert the partners of any unsynced ticket comments for a ticket that has already been synchronized to CW Manage.<br />Alert Template: ~Custom Email RAWSQL Monitor set results to the Partner.<br />Subject: Ticket Comment Failed to Sync to Manage for %ExternalID%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **Deprecated:** △ Email RAWSQL Monitor set results to the Partner                                                                                                |          | Alert Template   | Both                  | This alert template should be assigned to the [ProVal - Development - Automate - Unsynced Ticket Comment](https://proval.itglue.com/DOC-5078775-10390973) monitor set. It will execute the [Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41) script to send an email to the selected template contact/user.                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **Deprecated:** [ProVal - Development - CW Manage Plugin Errors](/docs/cc311e32-be16-4133-ae95-fca238aea891)                                                   | Medium   | Internal Monitor | Both                  | The internal monitor is designed to notify [alerts@provaltech.com](mailto:alerts@provaltech.com) of any critical errors and issues with the ConnectWise Manage Plugin.<br />Alert Template: ***** use Default - Do Nothing for now until we have an opportunity to look further into these action items from this monitor.<br />Subject: CW Manage Plugin Errors Detected for %Result%<br />e.g., CW Manage Plugin Errors Detected for Contacts on 2022-08-09                                                                                                                                                                                                                                                                                                                                                                  |
| **Deprecated:** ~Custom Email RAWSQL Monitor set results to ProVal                                                                                               |          | Alert Template   | Both                  | This alert template should be assigned to the [ProVal - Development - CW Manage Plugin Errors](/docs/cc311e32-be16-4133-ae95-fca238aea891) and [ProVal - Development - Control - Broken Integration](/docs/a3e17618-1629-4eca-ae93-e70dd47e3496) monitor sets. It will execute the [Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41) script to send an email to [Alerts@provaltech.com](mailto:Alerts@provaltech.com).                                                                                                                                                                                                                                                                                                                                           |
| **Deprecated:** [ProVal - Development - Automate Server - Unwanted Event Logs Monitoring](/docs/88dfd269-1df7-4c57-a898-9445dec162b5) | Medium   | Remote Monitor   | On-Prem               | The purpose of this remote monitor is to generate an Urgent ticket in our (ProVal's) Autotask portal if an error or critical event from either of "DBAgent", "ASPWCC2", or "MySQL" event sources is generated more than 10 times within the past 60 minutes on Automate server.<br />Alert Template: ***** use Default - Do Nothing for now until we have an opportunity to look further into these action items from this monitor.<br />Subject: Urgent - Automate Server - Unwanted Event Logs Detected                                                                                                                                                                                                                                                                                                                    |
| **Deprecated:** [Automate Server - Event Log Monitoring [Autofix]](/docs/f36b7367-99c7-478b-abc9-6802182431e4)                           |          | Autofix Script   | On-Prem               | The purpose of the script is to send the information of the event logs detected by the "[ProVal - Development - Automate Server - Unwanted Event Logs Monitoring](/docs/88dfd269-1df7-4c57-a898-9445dec162b5)" monitor set.<br />The result sometimes crosses the character limit of 100 characters and hence, the script was needed for the alerting purpose. Also, this is not designed to send any notifications for the Success status of the monitor set.                                                                                                                                                                                                                                                                                                                                  |
| **Deprecated:** △ Automate Server - Event Log Monitoring [Autofix]                                                                                               |          | Alert Template   | On-Prem               | This alert template should be assigned to the [ProVal - Development - Automate Server - Unwanted Event Logs Monitoring](/docs/88dfd269-1df7-4c57-a898-9445dec162b5) monitor set. It will execute the [Automate Server - Event Log Monitoring [Autofix]](/docs/f36b7367-99c7-478b-abc9-6802182431e4) script to send the event log's information to [alerts@provaltech.com](mailto:alerts@provaltech.com) as an urgent ticket.                                                                                                                                                                                                                                                                                                                                          |
| **Deprecated:** [Database size increased by 5%*[Global]](/docs/1e7111ed-fd09-4b58-bc4b-becb2dc3c8e0)                                                         | Medium   | Script           | Both                  | The ultimate goal of this script is to create a ticket in our (ProVal's) AutoTask portal if the overall size of the Labtech Database increases by 5% (threshold is flexible) within the last 24 hours (it depends on the frequency of the schedule).<br />Subject: Database size increased by @SizeToCompare@ Percent within the last @Hours@ Hour<br />e.g., Database size increased by 5 Percent within the last 24 Hour                                                                                                                                                                                                                                                                                                                                                                                                   |
| **Deprecated:** [Volume Free Space - Monitor Creation - Automate Server Only](/docs/8b42e4f9-eb46-4058-b4f9-e0f1ea8840cd)   | Medium   | Script           | On-Prem               | This is an exact copy of the [CWM - Automate - Script - Volume Free Space - Monitor Creation](/docs/dee853b7-69a6-4f0d-ad2f-7238a10851f4) script with a few changes. The purpose here is to use the dynamic monitor generated by the [CWM - Automate - Script - Volume Free Space - Monitor Creation](/docs/dee853b7-69a6-4f0d-ad2f-7238a10851f4) script to monitor the Automate server's drives and to generate a ticket in our (ProVal's) Autotask portal for the failures. We would like to proactively monitor the drive and perform the basic actions (like removing some unnecessary files logs or folders ) to free up some space for our partners.<br />Subject: Volume Space - %FieldName%: (%ComputerName%-%Computerid%)<br />e.g, Volume Space - C: (CW-Computer-200) |
| **Deprecated:** [ConnectWise Manage Plugin Sync/Mapping Audit](/docs/474cb433-c577-450c-b214-e7fc6a1c73f3)                                  | Medium   | Script           | Both                  | This script will send an email to [alerts@provaltech.com](mailto:alerts@provaltech.com) if it finds any necessary component as unsynced or unmapped in the CW Manage plugin. The Email will contain all the necessary details to act upon.<br />Alert Template: ***** use Default - Do Nothing for now until we have an opportunity to look further into these action items from this monitor.<br />Subject: Unmapped/Unsynced entity detected in CW Manage Plugin                                                                                                                                                                                                                                                                                                                                                           |
