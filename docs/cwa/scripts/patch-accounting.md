---
id: '53163c7a-3281-4825-ba22-4e22c8c5b35e'
slug: /53163c7a-3281-4825-ba22-4e22c8c5b35e
title: 'Patch Accounting'
title_meta: 'Patch Accounting'
keywords: ['patch', 'tickets', 'billing', 'time', 'jobs']
description: 'This document describes an enhanced version of the default Patch Accounting script that creates tickets for successful patch jobs and accurately bills for the time taken. It improves upon the original script by ensuring that the actual time taken by the patch jobs is recorded in the tickets, providing a more precise billing process.'
tags: []
draft: false
unlisted: false
---

## Summary

This script is a function script and is the enhanced version of the default "Patch Accounting" script. It creates tickets for successful patch jobs and optionally bills flat time or actual install time on the ticket. The default script was not able to add the actual time taken by the patch jobs in the tickets properly. This script adds the exact time taken by the patch job into the patching tickets. The default time added to the ticket will be 15 minutes if the time taken by the patch job is less than 15 minutes; otherwise, it will add the exact time taken by the patch job. All tickets are finalized at the end of the script.

## Sample Run

This script is called by the default script "Client Scheduled Patch Accounting Wrapper," which simply runs this script. This wrapper script should be scheduled to run on the Labtech Server once every 24 hours after the patch install window.

![Sample Run Image](../../../static/img/docs/53163c7a-3281-4825-ba22-4e22c8c5b35e/image_1.webp)

## Variables

| Property                      | Value |
|-------------------------------|-------|
| _sysPatchAcctTicketJobSuccess | 1     |
| _sysPatchAcctTimeToBill       | 1     |

## Output

This script will add the time to the ticket created.

![Output Image](../../../static/img/docs/53163c7a-3281-4825-ba22-4e22c8c5b35e/image_2.webp)
