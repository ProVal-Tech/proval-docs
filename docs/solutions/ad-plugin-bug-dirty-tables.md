---
id: '5d7a5b18-9aa8-4892-b70a-908dcfbe0fa2'
slug: /5d7a5b18-9aa8-4892-b70a-908dcfbe0fa2
title: 'AD Plugin Bug (Dirty Tables)'
title_meta: 'AD Plugin Bug (Dirty Tables)'
keywords: ['cwa', 'active-directory', 'plugin', 'cleanup', 'workaround']
description: 'This document provides a temporary workaround for a bug in the CWA Active Directory plugin, which fails to remove deleted user and computer entries from its tables. It outlines the necessary steps to schedule scripts to maintain accurate data in the plugin until the issue is resolved by ConnectWise.'
tags: ['active-directory', 'cleanup', 'connectwise']
draft: false
unlisted: false
---

## Purpose

A bug exists in the CWA Active Directory plugin where removed user and computer entries are not deleted from the plugin tables. This leads to tables being inflated with inaccurate data. This solution is a temporary workaround until ConnectWise resolves the issue.

The script [CWM - Automate - Clean up AD plugin](/docs/fc26cfc8-33ff-405d-ba3a-bfad02637607) should be scheduled to run once per day as a client script. The 'Run Full Active Directory Sync' script should be executed immediately against all "Infrastructure Master" AD domain controllers following the run of [CWM - Automate - Clean up AD plugin](/docs/fc26cfc8-33ff-405d-ba3a-bfad02637607).

## Requirements

- The AD plugin must be up to date.

## Associated Content

| Content                                                                 | Type   | Function                                                                                                            |
|-------------------------------------------------------------------------|--------|---------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Clean up AD plugin](/docs/fc26cfc8-33ff-405d-ba3a-bfad02637607) | Script | Removes all rows from the following tables:  - plugin_ad_computers  - plugin_ad_memberofxrefs  - plugin_ad_userproxyaddresses  - plugin_ad_users. Removes all rows with ObjectType 1 or 2 from plugin_ad_entries. |
| Run Full Active Directory Sync                                           | Built-in Script from ConnectWise relating to their AD plugin. | This is the built-in script that initiates the syncing of data from Active Directory to Automate.                 |

## Implementation

1. Ensure you have imported the Clean up AD plugin Script into the environment.
2. Schedule the Run Full Active Directory Sync Script to run on the Managed 24x7 and the Managed 8x5 groups starting at 4:30 AM the next morning.

   ```
   SET @SearchID = (SELECT SensID FROM sensorchecks WHERE NAME = 'Server Role - AD - Infrastructure Master');
   SET @RFADSID = (SELECT ScriptID FROM lt_scripts WHERE SCRIPTNAME = 'Run Full Active Directory Sync');
   SET @MTFSGID = (SELECT GroupID FROM mastergroups WHERE FullName = 'Service [Plans.Windows](http://plans.Windows) Servers.Managed 24x7');
   SET @MESGID = (SELECT GroupID FROM mastergroups WHERE FullName = 'Service [Plans.Windows](http://plans.Windows) Servers.Managed 8x5');
   SET @TOMORROW = (SELECT STR_TO_Date(CONCAT(DATE(NOW() + INTERVAL 1 DAY),' 04:30:00'), '%Y-%m-%d %H:%i:%S')); 
   INSERT INTO groupscripts ( `GroupID`, `ScriptID`, `ScriptType`, `RunTime`, `Repeat`, `SearchID`, `Parameters`, `GroupScriptGuid`, `IncludeSubGroups`, `DistributionWindowType`, `DistributionWindowAmount`, `ScheduleType`, `Interval`, `ScheduleWeekofMonth`, `ScheduleDayofWeek`, `RepeatType`, `RepeatAmount`, `RepeatStopAfter`, `SkipOffline`, `OfflineOnly`, `WakeOffline`, `WakeScript`, `DisableTimeZone`, `RunScriptOnProbe`, `Priority`, `Last_User`, `Last_Date`, `EffectiveStartDate` )
   VALUES 
   ( @MESGID, @RFADSID, 0, @TOMORROW, 0, @SearchID, '', '82d3a076-b83b-4fcf-ac76-5b2e05034a4c', 1, 2, 0, 4, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 11, 'root@localhost', NOW(), NOW() ),
   ( @MTFSGID, @RFADSID, 0, @TOMORROW, 0, @SearchID, '', '82d3a076-b83b-4fcf-ac76-5b2e05034a4c', 1, 2, 0, 4, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 11, 'root@localhost', NOW(), NOW() );
   ```

3. Schedule the Clean up AD plugin Script to run as a client script with no designated client at 4:10 AM starting the next morning.

   ```
   SET @TOMORROW = (SELECT STR_TO_Date(CONCAT(DATE(NOW() + INTERVAL 1 DAY), ' 04:10:00'), '%Y-%m-%d %H:%i:%S'));
   SET @RFADSID = (SELECT ScriptID FROM lt_scripts WHERE SCRIPTNAME = 'Clean up AD plugin');
   SET @FTD = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY));

   INSERT INTO groupscripts ( `GroupID`, `ScriptID`, `ScriptType`, `RunTime`, `Repeat`, `SearchID`, `Parameters`, `GroupScriptGuid`, `IncludeSubGroups`, `DistributionWindowType`, `DistributionWindowAmount`, `ScheduleType`, `Interval`, `ScheduleWeekofMonth`, `ScheduleDayofWeek`, `RepeatType`, `RepeatAmount`, `RepeatStopAfter`, `SkipOffline`, `OfflineOnly`, `WakeOffline`, `WakeScript`, `DisableTimeZone`, `RunScriptOnProbe`, `Priority`, `Last_User`, `Last_Date`, `EffectiveStartDate` )
   VALUES 
   ( 0, @RFADSID, 0, @TOMORROW, 0, 0, '', '82d3a076-b83b-4fcf-ac76-5b2e05034a4d', 1, 2, 0, 4, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 11, 'root@localhost', NOW(), NOW() );

   INSERT INTO scheduledscripts ( `ScriptID`, `NextRun`, `Interval`,  `Repeat`,  `Last_User`,  `Last_Date`,  `Exclusions`,  `Parameters`,  `Priority`,  `IncludeSubGroups`, `SearchID`,  `GroupScriptID`,  `Disabled`,  `EffectiveStartDate`,  `EffectiveOccurrences`,  `DistributionWindowType`,  `DistributionWindowAmount`,  `ScheduleType`,  `ScheduleWeekofMonth`,  `ScheduleDayofWeek`,  `RepeatType`,  `RepeatAmount`,  `RepeatStopAfter`,  `SkipOffline`,  `OfflineOnly`,  `WakeOffline`,
       `WakeScript`,
       `DisableTimeZone`,
       `RunScriptOnProbe`,
       `TimeZoneAdd`,
       `Occurrences`,
       `LastSchedule`
   ) VALUES (
       @RFADSID,
       @TOMORROW,
       1,
       0,
       'root@localhost',
       NOW(),
       '',
       '',
       11,
       0,
       0,
       0,
       0,
       @FTD,
       0,
       2,
       0,
       4,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0.0,
       0,
       NOW()
   );
   ```

## FAQ

*No FAQs available at this time.*
