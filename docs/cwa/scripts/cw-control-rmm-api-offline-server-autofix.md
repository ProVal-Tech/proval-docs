---
id: '0004bd17-6820-4def-b5bf-96686276b7ae'
slug: /0004bd17-6820-4def-b5bf-96686276b7ae
title: 'CW Control RMM+ API - Offline Server AutoFix'
title_meta: 'CW Control RMM+ API - Offline Server AutoFix'
keywords: ['ticketing', 'automation', 'monitoring', 'troubleshooting', 'offline']
description: 'This document outlines a script designed to automate the ticketing process for offline servers. It triggers based on a monitor, creates a ticket, performs troubleshooting steps, and updates the ticket with comments as actions are taken. The script ensures consistent communication on the status of the offline server and attempts to resolve issues automatically.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This script is designed to be triggered by a monitor. It will not function if run manually. It creates a ticket for offline servers, performs troubleshooting steps, and adds comments to the ticket as troubleshooting progresses.

## Dependencies

This script is dependent on the following items:

- RMM+ installed and configured in CW Control/Automate

#### Global Parameters

| Name                  | Example                                                                 | Required | Description                                                                                                                                           |
|-----------------------|-------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| OfflineThreshold      | 11                                                                      | True     | This indicates how many minutes the offline server monitor will alert after. Default is set to 11 minutes. (This needs to be set according to your monitoring settings.) |
| TicketCreateSubject   | LT - Server Offline for %LocationName% / %ComputerName% (%ComputerID%) | True     | This indicates what the ticket subject will look like. Default is the example output.                                                               |

## Process

1. Create the server offline ticket.
2. Check CW Control to see if the machine is online.
   - The machine is offline:
     - Add a comment to the ticket confirming the machine is offline in Control.
   - The machine is online:
     - Attempt to force restart the Automate services.
       - If services report they started successfully:
         - Go through a 3-minute loop validating the machine is online now. If it doesn't, jump to the reinstall task.
       - If services had an error:
         - Comment on the ticket with an update. Begin reinstall.
         - If the reinstall does not work, add a comment with the reinstall command results and the last 15 lines of the Automate LTErrors log in the ticket.
3. If at any time the script fixes the agent and the machine is now online, it will add a comment to the ticket stating that it fixed the issue, and the monitor will automatically close the ticket.

## Output

The script is designed to consistently update the ticket with new information as it performs troubleshooting. Below are a few examples of ticket data being added during the troubleshooting process.

![Image 1](../../../static/img/docs/0004bd17-6820-4def-b5bf-96686276b7ae/image_1.webp)

![Image 2](../../../static/img/docs/0004bd17-6820-4def-b5bf-96686276b7ae/image_2.webp)

![Image 3](../../../static/img/docs/0004bd17-6820-4def-b5bf-96686276b7ae/image_3.webp)

![Image 4](../../../static/img/docs/0004bd17-6820-4def-b5bf-96686276b7ae/image_4.webp)

![Image 5](../../../static/img/docs/0004bd17-6820-4def-b5bf-96686276b7ae/image_5.webp)