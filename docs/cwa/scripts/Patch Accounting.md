---
id: '53163c7a-3281-4825-ba22-4e22c8c5b35e'
title: 'Enhanced Patch Accounting Script'
title_meta: 'Enhanced Patch Accounting Script for Ticket Management'
keywords: ['patch', 'tickets', 'billing', 'time', 'jobs']
description: 'This document describes an enhanced version of the default Patch Accounting script that creates tickets for successful patch jobs and accurately bills for the time taken. It improves upon the original script by ensuring that the actual time taken by the patch jobs is recorded in the tickets, providing a more precise billing process.'
tags: ['ticket', 'patch', 'billing', 'time', 'jobs', 'labtech', 'automation']
draft: false
unlisted: false
---
## Summary

This script is a function script and is the enhanced version of the default "Patch Accounting" script. It creates tickets for successful patch jobs and optionally bills flat time or actual install time on the ticket. The default script was not able to add the actual time taken by the patch jobs in the tickets properly. This script adds the exact time taken by the patch job into the patching tickets. The default time added to the ticket will be 15 minutes if the time taken by the patch job is less than 15 minutes; otherwise, it will add the exact time taken by the patch job. All tickets are finished at the script end.

## Sample Run

This script is called by the default script "Client Scheduled Patch Accounting Wrapper" which just runs this script. This wrapper script should be scheduled to run on Labtech Server once every 24hrs after the patch install window.

![Sample Run Image](../../../static/img/Patch-Accounting/image_1.png)

## Variables

| Property                      | Value |
|-------------------------------|-------|
| _sysPatchAcctTicketJobSuccess | 1     |
| _sysPatchAcctTimeToBill       | 1     |

## Output

This script will add the time to the ticket created.

![Output Image](../../../static/img/Patch-Accounting/image_2.png)






