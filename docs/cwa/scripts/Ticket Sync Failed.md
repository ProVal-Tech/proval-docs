---
id: 'f490325a-023c-430d-876d-e4d311ff3e89'
title: 'Autofix for Ticket Sync Issues'
title_meta: 'Autofix for Ticket Sync Issues'
keywords: ['ticket', 'sync', 'email', 'monitor', 'automate']
description: 'This document details an Autofix script designed to be triggered by the monitor for unsuccessful ticket synchronization to the PSA. It gathers ticket information and forwards it to a specified email address to ensure no tickets are missed, saving time and improving efficiency.'
tags: ['email', 'psa']
draft: false
unlisted: false
---

## Summary

This script is an Autofix and is meant to be called by the monitor [ProVal - Production - Automate - Ticket Sync Unsuccessful](<../monitors/Ticket Sync Unsuccessful.md>). If a ticket has failed to sync to the PSA for more than 2 hours, the monitor will trigger this script. The script will gather the information from the ticket and forward the ticket to a specified email address, ensuring that no tickets are missed.

**Time Saved by Automation:** 5 Minutes

## Sample Run

This script is a function script and will not run successfully if executed manually.

## Dependencies

[ProVal - Production - Automate - Ticket Sync Unsuccessful](<../monitors/Ticket Sync Unsuccessful.md>)  
Automate must be syncing tickets with a PSA that uses the "ExternalID" field in the "Tickets" table.

## Variables

- `@TicketMessage@` - This variable will hold the data from the ticket.
- `@EmailAddress@` - The target email address for the ticket converted to an email.

#### Global Parameters

| Name         | Example                       | Required | Description                                                                                                                                                 |
|--------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| emailaddress | [email@aol.com](mailto:email@aol.com) | True     | This is the email address where the ticket data will be sent. The script will not function properly if this variable is not configured with a valid email address. |

## Process

The monitor will trigger this script and pass parameters to it. The parameter passed by the monitor is the ticket ID to be converted into an email. The script will set the email body to the body of the ticket in the `@TicketMessage@` variable. The script will send the email to the target address with the information from the ticket in the body of the email.

## Output

The only output for this script is an email to the configured email address. If this email fails to send, the data will be visible in the "Failed Emails" section of the system dashboard.

