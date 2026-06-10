---
id: '128c7482-b535-40b5-912a-e44e2efb04f8'
slug: /128c7482-b535-40b5-912a-e44e2efb04f8
title: 'Frequent System Reboot Detection'
title_meta: 'Frequent System Reboot Detection'
keywords: ['reboot', 'reboot-reason', 'recent-reboot', 'recent-reboot-reason', 'reboot-audit']
description: 'This monitor tracks how often a computer restarts to identify machines that are experiencing instability or crash loops.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-10
---

## Summary

This monitor tracks how often a computer restarts to identify machines that are experiencing instability, crash loops, or unexpected shutdowns. By default, it watches for any machine that has **restarted 5 or more times within a 24-hour period**. When a computer restarts this frequently, the monitor automatically creates a support ticket containing the exact reasons for each restart.

> Note: While 5 reboots in 24 hours is the standard baseline, this threshold is fully flexible and can be modified if a different limit is required for your specific environment.

## Dependencies

- [Get-RecentRebootReason](/docs/711a44cb-a3af-49b7-b501-9ed088ba1d36)

## Details

**Suggested "Limit to"**: `All`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer`  

| Check Action | Server Address | Check Type | Condition   | Interval   |
|--------------|----------------|------------|-------------|------------|
| System | 127.0.0.1 | Run File | State Based | 900 |

## Target

- Managed Windows Servers
- Managed Windows Workstations

## Ticketing

**Ticket Subject:** `Frequent System Reboots Detected on %COMPUTERNAME%`  
**Ticket Body:** `%RESULT%`

**Sample Ticket Subject:** `Frequent System Reboots Detected on TEST_MACHINE`  

**Sample Ticket Body:**

```PlainText
WORKSTATION-01 has rebooted 6 time(s) in the past 24 hour(s).

Details:

TimeCreated   : 6/10/2026 4:41:11 PM
FormattedDate : 6/10/2026 4:41 PM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

TimeCreated   : 6/10/2026 3:25:55 PM
FormattedDate : 6/10/2026 3:25 PM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

TimeCreated   : 6/10/2026 2:47:44 PM
FormattedDate : 6/10/2026 2:47 PM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

TimeCreated   : 6/10/2026 1:58:55 PM
FormattedDate : 6/10/2026 1:58 PM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

TimeCreated   : 6/10/2026 12:57:00 PM
FormattedDate : 6/10/2026 12:57 PM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

TimeCreated   : 6/10/2026 11:29:18 AM
FormattedDate : 6/10/2026 11:29 AM
Id            : 1074
User          : TestUser
Message       : The process C:\WINDOWS\system32\wbem\wmiprvse.exe (TEST_MACHINE) has initiated the shutdown of computer TEST_MACHINE on behalf of user TestUser for the following
                reason: No title for this reason could be found
                 Reason Code: 0x80070015
                 Shutdown Type: shutdown
                 Comment:

```

## Implementation

### Step 1

Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### Step 2

Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) for your target groups. Set the desired values for the `@lookbackWindowHours` and `@minimumRebootEventCount` variables as needed.  
(The section to replace is at the very end of the query, immediately after **WHERE**.)

```sql
SET @lookbackWindowHours = '<Time interval in hours to look back in the event log>';
SET @minimumRebootEventCount = '<Threshold for the minimum number of reboot events to trigger alerting>';

INSERT INTO groupagents 
SELECT
    '' as `AgentID`,
    `groupid` as `GroupID`,
    '0' as `SearchID`,
    'ProVal - Production - Frequent System Reboot Detection' as `Name`,
    '6' as `CheckAction`,
    '1' as `AlertAction`,
    'Frequent System Reboots Detected on %COMPUTERNAME%~~~%RESULT%.!!!Frequent System Reboots Detected on %COMPUTERNAME%~~~%RESULT%.' as `AlertMessage`,
    '0' as `ContactID`,
    '3600' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    CONCAT('C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ProgressPreference = \'SilentlyContinue\'; $ErrorActionPreference = \'SilentlyContinue\'; $scriptName = \'Get-RecentRebootReason\'; $scriptUrl = \'https://contentrepo.net/repo/script/{0}.ps1\' -f $scriptName; [int]$minimumRebootEventCount = ', @minimumRebootEventCount ,'; [int]$lookbackWindowHours =', @lookbackWindowHours ,'; [int]$lookbackWindowMinutes = [Math]::Round($lookbackWindowHours * 60); [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072); try { $recentRebootEvents = & ([scriptblock]::Create((Invoke-RestMethod -Uri $scriptUrl -UseBasicParsing))) -MaxEvents 500 -ThresholdMinutes $lookbackWindowMinutes } catch { $null }; if ($recentRebootEvents.count -ge $minimumRebootEventCount) { return (\'{0} has rebooted {1} time(s) in the past {2} hour(s).{3}{3}Details:{3}{4}\' -f $env:COMPUTERNAME, ($recentRebootEvents).Count, $lookbackWindowHours, [System.Environment]::NewLine, ($recentRebootEvents | Format-List | Out-String)) }"') as `DataOut`,
    '16' as `Comparor`,
    '10|(?m)^(OK)*\\s*$|11|(?m)^((OK)*\\s*$%7C\\s*has rebooted)|10|(?m)^\\s*has rebooted' as `DataIn`,
    '' as `IDField`,
    '1' as `AlertStyle`,
    '0' as `ScriptID`,
    '' as `datacollector`,
    '21' as `Category`,
    '0' as `TicketCategory`,
    '1' as `ScriptTarget`,
    (UUID()) as `GUID`,
    'root' as `UpdatedBy`,
    (NOW()) as `UpdateDate`
FROM
    mastergroups m
WHERE
    m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
    AND m.groupid NOT IN  (
        SELECT
            DISTINCT groupid 
        FROM 
            groupagents 
        WHERE 
            `Name` = 'ProVal - Production - Frequent System Reboot Detection'
        );
```

### Step 3

Here is an example showing how to use a specific group ID and set the variables:

```sql
SET @lookbackWindowHours = '5';
SET @minimumRebootEventCount = '24';

INSERT INTO groupagents 
SELECT
    '' as `AgentID`,
    `groupid` as `GroupID`,
    '0' as `SearchID`,
    'ProVal - Production - Frequent System Reboot Detection' as `Name`,
    '6' as `CheckAction`,
    '1' as `AlertAction`,
    'Frequent System Reboots Detected on %COMPUTERNAME%~~~%RESULT%.!!!Frequent System Reboots Detected on %COMPUTERNAME%~~~%RESULT%.' as `AlertMessage`,
    '0' as `ContactID`,
    '3600' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    CONCAT('C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ProgressPreference = \'SilentlyContinue\'; $ErrorActionPreference = \'SilentlyContinue\'; $scriptName = \'Get-RecentRebootReason\'; $scriptUrl = \'https://contentrepo.net/repo/script/{0}.ps1\' -f $scriptName; [int]$minimumRebootEventCount = ', @minimumRebootEventCount ,'; [int]$lookbackWindowHours =', @lookbackWindowHours ,'; [int]$lookbackWindowMinutes = [Math]::Round($lookbackWindowHours * 60); [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072); try { $recentRebootEvents = & ([scriptblock]::Create((Invoke-RestMethod -Uri $scriptUrl -UseBasicParsing))) -MaxEvents 500 -ThresholdMinutes $lookbackWindowMinutes } catch { $null }; if ($recentRebootEvents.count -ge $minimumRebootEventCount) { return (\'{0} has rebooted {1} time(s) in the past {2} hour(s).{3}{3}Details:{3}{4}\' -f $env:COMPUTERNAME, ($recentRebootEvents).Count, $lookbackWindowHours, [System.Environment]::NewLine, ($recentRebootEvents | Format-List | Out-String)) }"') as `DataOut`,
    '16' as `Comparor`,
    '10|(?m)^(OK)*\\s*$|11|(?m)^((OK)*\\s*$%7C\\s*has rebooted)|10|(?m)^\\s*has rebooted' as `DataIn`,
    '' as `IDField`,
    '1' as `AlertStyle`,
    '0' as `ScriptID`,
    '' as `datacollector`,
    '21' as `Category`,
    '0' as `TicketCategory`,
    '1' as `ScriptTarget`,
    (UUID()) as `GUID`,
    'root' as `UpdatedBy`,
    (NOW()) as `UpdateDate`
FROM
    mastergroups m
WHERE
    m.groupid IN (2, 3, 855, 856)
    AND m.groupid NOT IN  (
        SELECT
            DISTINCT groupid 
        FROM 
            groupagents 
        WHERE 
            `Name` = 'ProVal - Production - Frequent System Reboot Detection'
        );
```

### Step 4

Execute your query from a `RAWSQL` monitor set.

### Step 5

Reload the System Cache (**Ctrl + R**).

### Step 6

Find your remote monitor in the group's remote monitors tab. Apply the correct alert template.  
When assigning the alert template, ensure it does not trigger actions for WARNINGS unless you want notifications for PowerShell errors as well.

## Changelog

### 2026-06-10

- Initial version of the document
