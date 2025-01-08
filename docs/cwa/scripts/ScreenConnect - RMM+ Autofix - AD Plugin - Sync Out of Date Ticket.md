---
id: 'cwa-active-directory-sync-autofix'
title: 'Active Directory Sync Autofix for RMM+'
title_meta: 'Active Directory Sync Autofix for RMM+'
keywords: ['active-directory', 'sync', 'autofix', 'monitor', 'ticketing']
description: 'This document details a script designed to automatically fix issues related to the Active Directory Sync Out of Date monitor in ConnectWise Automate. It outlines the process, dependencies, and ticketing information for effective resolution of sync errors.'
tags: ['active-directory', 'sync', 'ticket', 'automation', 'monitoring']
draft: false
unlisted: false
---
## Summary

This script is intended to be used as an auto fix for the 'ProVal - Production - Active Directory - Sync Out of Date [RMM+ Autofix]' monitor. This script will not function if run manually.

## Sample Run

This script is intended to run from a monitor and will not function if ran manually.

## Dependencies

This script depends on the following items to function as intended:

- [CWA Internal Monitor - Active Directory - Sync Out of Date [RMM+ Autofix]](https://proval.itglue.com/DOC-5078775-10093123)
- [CWM - Automate - RMM+ Plugin Configuration](https://proval.itglue.com/DOC-5078775-9770217)

## Process

This script follows the following process:

1. Monitor alerts and triggers script
2. Check if the FieldName = Failed, it will verify if the password title used in AD Plugin matches with the expected password title mentioned in System properties. If yes, it will run the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940) to reset the password. Otherwise will run the RMM+ fix to rebuild the ActiveDirectory.db file.
3. Verifies if machine is online in Control and automate, if offline will create a ticket
4. Run this command through CWC:
   - `taskkill /F /IM ltsvc.exe /T & taskkill /F /IM lttray.exe /T & ping -n 3 127.0.0.1 > nul & del C:\Windows\LTSvc\ActiveDirectory\ActiveDirectory.bak & ren C:\Windows\LTSvc\ActiveDirectory\ActiveDirectory.db ActiveDirectory.bak & net start ltservice`
5. Creates the ticket with repair results and auto-close once the monitor no longer sees it as an issue.
6. Also it will not auto close the ticket if the machine is offline, just to avoid the situations where the monitor comes back to a successful state if the machine is offline and the script auto closes the ticket and the issue pertains to exist.

## Output

This script will output its logging information into the ticket as it is completing troubleshooting steps.

- Script Logs
- Tickets

## Ticketing

**Ticket Subject:** `Active Directory Plugin Sync Error for %CLIENTNAME%`

**Ticket body:**

Ticket Body if the machine is offline in Automate and control:

```
The Active Directory plugin is not syncing for %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME%. We attempted to resolve the issue automatically by forcing a re-sync of the Active Directory Data. But Active Directory server %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% was found to be offline in Control. Please get this server online or replace this server with a new Infrastructure Master Domain Controller.
```

Here is pertinent information about the affected PC:
```
PC Name: %computername%
Last Login: %lastuser%
PC model: @biosname@
OS: %os%
S/N OF PC: @biosver@
AD Last Sync: @RESULT@
```

Ticket Body *after the script finishes the attempt to sync the Active Directory Plugin*:

```
The Active Directory plugin is currently not syncing for the machine %CLIENTNAME%%COMPUTERNAME% located at %LOCATIONNAME%. To address this issue, we are taking automated steps to force a re-sync of the Active Directory data.
Further, We have confirmed that the Active Directory server %CLIENTNAME%%COMPUTERNAME% is online and functioning correctly. We initiated the automatic fix to trigger the Active Directory Plugin to synchronize with a new local database. And the below are the repair attempt results:
@ADRepairResult@
If there are no errors in the log above, the Active Directory server should synchronize its information within the next few hours. However it might take a few hours for the system to recognize the success of the autofix. If synchronization does not occur as expected, further manual troubleshooting may be required.
```

Here is pertinent information about the affected PC:
```
PC Name: %computername%
Last Login: %lastuser%
PC model: @biosname@
OS: %os%
S/N OF PC: @biosver@
AD Last Sync: @RESULT@
```

Ticket Body *when monitor* FieldName = Failed, and called script failed to reset the password:

```
The Active Directory plugin is not syncing for %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME%. The script has identified a match between the password title used in the Active Directory plugin and the password title setup in the AD Plugin User Account creation tool. So, it initiated the AD Plugin user creation script in an attempt to reset the password. However, this script ultimately failed to update the password for the server. Here are the results of the script's attempts:
@Output@
```

The PC information is outlined below:
```
PC Name: %computername%
Last Login: %lastuser%
PC model: @biosname@
OS: %os%
S/N OF PC: @biosver@
```

