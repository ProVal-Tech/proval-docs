---
id: 'cwa-all-in-one-ticket-creation-script'
title: 'All-in-One Ticket Creation Script for Monitors'
title_meta: 'All-in-One Ticket Creation Script for Monitors'
keywords: ['ticket', 'monitor', 'alert', 'logging', 'status', 'client', 'location', 'computer']
description: 'This document provides a comprehensive overview of an all-in-one script designed for monitors that generates detailed tickets with useful information. It is specifically tailored for use in a monitor-driven environment, ensuring efficient ticket creation without manual intervention. The script includes variables for enhanced alert messages and is dependent on the configuration of the monitor’s alerting tab.'
tags: ['monitor', 'alerting', 'logging', 'ticket', 'configuration', 'client', 'location', 'computer']
draft: false
unlisted: false
---
## Summary

This script is designed to be a good all in one script that can be used on any/all monitors built for computers (Not Client or Location monitors) to get tickets with more information in them and more useful wording.

## Monitor Driven Only

This script is designed to be monitor driven only and should never be manually run. If it is manually run, the script will simply exit on the first step in the else section.

This script has been updated to remove the limit of the %FieldName% and %Result% variables when triggered from a RAWSQL monitor.

## Dependencies

This script's only dependency is that the Alerting tab be filled out on the monitor you are applying this ticket creation script to.

![Alerting Tab](5078775/docs/9098338/images/12593704)

### Things to note:
1. The 'Alert Message Subject...' for both Success and failure MUST be the same or else there may be issues.
2. Variables you are able to use for these messages:
   1. %FIELDNAME% - This is the 'Identity Field' value that you assign in the **Configuration Tab** of the monitor (Shown in the picture below)
      ![Identity Field](5078775/docs/9098338/images/12593750)
   2. %clientname% - Displays the client name of the affected machine.
   3. %locationname% - Displays the current location of the affected machine.
   4. %computername% - Displays the computer name of the affected machine.
   5. %status% - Displays SUCCESS or FAILED based on what the monitor results are.
   6. %computerid% - Displays the computer ID of the affected machine.
   7. %clientid% - Displays the client ID that the affected machine is in.
   8. %locationid% - Displays the location ID that the affected machine is in.

## Note

- The Alert Template `△ Custom - Ticket Creation - Computer` runs this script.

## Output

This script outputs logging information into the script log in the scripting tab. It is just a simple ticket creation script so there is not much logging.

## Example Ticket

![Example Ticket](5078775/docs/9098338/images/12773997)

What the Alerting Tab Looks like:

![Alerting Tab Example](5078775/docs/9098338/images/12774007)

