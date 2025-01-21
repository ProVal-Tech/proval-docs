---
id: '6c9ef438-835d-44a9-bf31-4a1db9253347'
title: 'ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date Ticket'
title_meta: 'ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date Ticket'
keywords: ['active-directory', 'sync', 'autofix', 'monitor', 'ticketing']
description: 'This document details a script designed to automatically fix issues related to the Active Directory Sync Out of Date monitor in ConnectWise Automate. It outlines the process, dependencies, and ticketing information for effective resolution of sync errors.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

This script is intended to be used as an autofix for the 'ProVal - Production - Active Directory - Sync Out of Date [RMM+ Autofix]' monitor. This script will not function if run manually.

## Sample Run

This script is intended to run from a monitor and will not function if run manually.

## Dependencies

This script depends on the following items to function as intended:

- [CWA Internal Monitor - Active Directory - Sync Out of Date [RMM+ Autofix]](<../monitors/Active Directory - Sync Out of Date.md>)
- [CWM - Automate - RMM+ Plugin Configuration](<./CWM - Automate - RMM+ Plugin Configuration.md>)

## Process

This script follows the process outlined below:

1. Monitor alerts and triggers the script.
2. Check if the FieldName = Failed. It will verify if the password title used in the AD Plugin matches the expected password title mentioned in System properties. If yes, it will run the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](<./Active Directory - Plugin User Account - CreateUpdate.md>) to reset the password. Otherwise, it will run the RMM+ fix to rebuild the ActiveDirectory.db file.
3. Verify if the machine is online in Control and Automate; if offline, it will create a ticket.
4. Run the following command through CWC:
   - `taskkill /F /IM ltsvc.exe /T & taskkill /F /IM lttray.exe /T & ping -n 3 127.0.0.1 > nul & del C:/Windows/LTSvc/ActiveDirectory/ActiveDirectory.bak & ren C:/Windows/LTSvc/ActiveDirectory/ActiveDirectory.db ActiveDirectory.bak & net start ltservice`
5. Create a ticket with repair results and auto-close once the monitor no longer sees it as an issue.
6. The ticket will not auto-close if the machine is offline, to avoid situations where the monitor returns to a successful state while the machine is offline, causing the script to auto-close the ticket while the issue still exists.

## Output

This script will output its logging information into the ticket as it completes troubleshooting steps.

- Script Logs
- Tickets

## Ticketing

**Ticket Subject:** `Active Directory Plugin Sync Error for %CLIENTNAME%`

**Ticket Body:**

Ticket body if the machine is offline in Automate and Control:

```
The Active Directory plugin is not syncing for %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME%. We attempted to resolve the issue automatically by forcing a re-sync of the Active Directory data. However, the Active Directory server %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME% was found to be offline in Control. Please get this server online or replace it with a new Infrastructure Master Domain Controller.
```

Here is pertinent information about the affected PC:

```
PC Name: %computername%
Last Login: %lastuser%
PC Model: @biosname@
OS: %os%
S/N OF PC: @biosver@
AD Last Sync: @RESULT@
```

Ticket body *after the script finishes the attempt to sync the Active Directory Plugin*:

```
The Active Directory plugin is currently not syncing for the machine %CLIENTNAME%%COMPUTERNAME% located at %LOCATIONNAME%. To address this issue, we are taking automated steps to force a re-sync of the Active Directory data. Furthermore, we have confirmed that the Active Directory server %CLIENTNAME%%COMPUTERNAME% is online and functioning correctly. We initiated the automatic fix to trigger the Active Directory Plugin to synchronize with a new local database. Below are the results of the repair attempts:
@ADRepairResult@
If there are no errors in the log above, the Active Directory server should synchronize its information within the next few hours. However, it might take some time for the system to recognize the success of the autofix. If synchronization does not occur as expected, further manual troubleshooting may be required.
```

Here is pertinent information about the affected PC:

```
PC Name: %computername%
Last Login: %lastuser%
PC Model: @biosname@
OS: %os%
S/N OF PC: @biosver@
AD Last Sync: @RESULT@
```

Ticket body *when monitor* FieldName = Failed, and the called script failed to reset the password:

```
The Active Directory plugin is not syncing for %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME%. The script has identified a match between the password title used in the Active Directory plugin and the password title set up in the AD Plugin User Account creation tool. Consequently, it initiated the AD Plugin user creation script in an attempt to reset the password. However, this script ultimately failed to update the password for the server. Here are the results of the script's attempts:
@Output@
```

The PC information is outlined below:

```
PC Name: %computername%
Last Login: %lastuser%
PC Model: @biosname@
OS: %os%
S/N OF PC: @biosver@
```



