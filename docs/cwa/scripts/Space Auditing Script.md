---
id: 'cwa-drive-scan-output'
title: 'Drive Scan Output Script'
title_meta: 'Drive Scan Output Script for Windows and Linux'
keywords: ['drive', 'scan', 'output', 'script', 'ticket']
description: 'This document outlines a script that scans the main drive of Windows and Linux systems, outputs the results to a text file, and attaches the file to a ticket for easy reference. The script enhances automation by saving time and ensuring data is readily available within the ticketing system.'
tags: ['windows', 'linux', 'ticket', 'automation', 'output', 'script']
draft: false
unlisted: false
---
## Summary

This script scans your main drive (C: for Windows and everything for Linux) and outputs the information to a text file in the temp folders. This also puts the information inside the ticket and attaches the text file in the ticket in case it becomes unreadable in the ticket.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8059170/images/11218032)

## Dependencies

Windows or Linux based machines

## Variables

`@SpaceAuditOutput@` - The output of the log file containing the data from the audit

#### Global Parameters

| Name                     | Example | Required | Description                                                                                                         |
|--------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| TicketCreationCategory    | 5       | False    | The category used when creating the ticket. Setting this category may help route the ticket to the appropriate location in the PSA. |

## Process

The script will first check to see if a previous version of the log file exists from a prior run of this script. If the file exists, it will delete the file and continue on. If the file does not exist, the script will continue.

The script will then determine if the machine is a Windows OS or a Non Windows OS. 

For Non Windows OS the script will run a BASH command to gather the data and output the data to a text file.

The script will gather the information from the text file and will generate a ticket and attempt to place all of the data from the earlier BASH command into the ticket. It will also attempt to download the log file and attach it to the ticket in case the results were too long for Automate to hold in a variable.

For Windows OS the script will run a PowerShell script and will output the data to a text file.

The script will then gather the information from the text file and will generate a ticket and attempt to place all of the data from the earlier PowerShell command into the ticket. It will also attempt to download the log file and attach it to the ticket in case the results were too long for Automate to hold in a variable.

If the ticket was successful and has created the ticket with the data the script will exit with a success log message.

If the script failed and has not gathered the data appropriately it will exit with an error log message.

## Output

- Script log messages
- Ticket
- Log file output to the target device.

## Example Output

![Example Output](5078775/docs/8059170/images/11218230)


