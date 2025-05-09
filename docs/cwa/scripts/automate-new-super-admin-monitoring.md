---
id: 'acc57018-b868-4129-b4a5-0f1052dcc1ae'
slug: /acc57018-b868-4129-b4a5-0f1052dcc1ae
title: 'Automate - New Super Admin Monitoring'
title_meta: 'Automate - New Super Admin Monitoring'
keywords: ['monitor', 'super', 'admins', 'alert', 'ticket']
description: 'This script monitors for the creation of new super admins since the last run, generating alerts for any new additions. It saves time by automating the tracking process and creating corresponding tickets for any changes.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This script will monitor for the creation of new super admins since the last run of the script.  
**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/acc57018-b868-4129-b4a5-0f1052dcc1ae/image_1.webp)

## Dependencies

None

## Variables

`@userList@` - The list of new super admin users.

#### Global Parameters

| Name                     | Example | Required | Description                                               |
|--------------------------|---------|----------|-----------------------------------------------------------|
| TicketCreationCategory    | 123     | True     | The category to create the corresponding alert ticket under. |

## Process

A temporary custom table is referenced to determine the previous state of the super admins. The table is then compared to the existing super admins, and if there are any added super admins, a ticket is generated with the list of usernames of those users.

## Output

- Ticket
- Script Log