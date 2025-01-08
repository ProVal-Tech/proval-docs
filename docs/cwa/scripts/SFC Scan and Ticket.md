---
id: 'cwa-sfc-scan-ticket-creation'
title: 'SFC Scan and Ticket Creation'
title_meta: 'SFC Scan and Ticket Creation for Windows Devices'
keywords: ['sfc', 'scan', 'ticket', 'windows', 'maintenance']
description: 'This document outlines a script that performs an SFC scan on a Windows device and creates a ticket if any errors are detected. The script is designed to run during maintenance mode, ensuring minimal disruption while maintaining system integrity.'
tags: ['maintenance', 'windows', 'ticket', 'error', 'log']
draft: false
unlisted: false
---
## Summary

Performs an SFC scan on the target Windows device and will create a ticket if the SFC scan does not come back with no errors.

Time Saved by Automation: 5 Minutes

Note: This is a maintenance flagged script and is allowed to run while machines are in Maintenance Mode!

## Sample Run

![Sample Run](5078775/docs/8047416/images/11199060)

## Dependencies

The machine must be a Windows-based device or the script will fail.

## Variables

- `@psout@` - The result from the PowerShell Script
- `@SFCLog@` - The contents of the SFC scan logfile
- `@SFCScanReport@` - This variable includes error information

## Process

This script will stop the Windows update service and clear some folders to ensure there is space to run the SFC Scan and store the output. The CWA script will run a PowerShell that runs the SFC /Scannow command and will additionally ensure that the output into the log file is in UTF-8 formatting so Automate will be able to read the log file. Automate will wait until the command completes and then will evaluate the results from the command.

1. If the command output did not find any issues, the script will jump to the "AllGood" label and exit successfully.
2. If the command output contains "unable to fix" then the script will jump to the "CreateTicket" label and create the ticket.
3. If the command output contains "found corrupt" then the script will jump to the "CreateTicket" label and create the ticket.
4. If the command output contains "successfully repaired" then the script will jump to the "Repaired" label and exit successfully.
5. If the script was unable to process the log file, the script will jump to the "ErrorReadFile" label and create a ticket with the relevant information.

## Output

- Script Log messages
- Tickets


