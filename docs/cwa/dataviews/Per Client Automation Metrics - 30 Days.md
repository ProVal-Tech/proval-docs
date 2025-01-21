---
id: '20485b42-08a2-4906-920e-4f2ba3ceb52f'
title: 'Billing Information Dataview'
title_meta: 'Billing Information Dataview for Client Billing Insights'
keywords: ['billing', 'dataview', 'clients', 'scripts', 'commands', 'alerts', 'tickets', 'automation', 'time-saved']
description: 'This document provides an overview of a dataview designed to display essential billing information for each client over the past 30 days, including metrics such as total scripts run, commands executed, monitor alerts triggered, tickets generated, and time saved by automation.'
tags: ['database', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

The dataview's objective is to present basic billing information for each client. The data displayed in the dataview is from the past 30 days only.

## Columns

| Column                         | Description                                                                                                      |
|--------------------------------|------------------------------------------------------------------------------------------------------------------|
| Client ID                     | Client ID (Hidden)                                                                                               |
| Client Name                   | Client Name                                                                                                     |
| Total Scripts Run             | Total number of scripts run in the past 30 days for the client.                                               |
| Total Commands Executed       | Total number of commands executed in the past 30 days for the client.                                         |
| Total Monitor Alerts Triggered | Total number of failures detected by the monitor sets in the past 30 days for the client.                      |
| Total Tickets Generated        | Total number of tickets generated in the past 30 days for the client.                                         |
| Total Time Saved by Automation | Total amount of time saved by automation in the past 30 days for the client. The logic uses the time saved field of the script and then falls back to the run time interval if it's not filled. Format: Days:Hours:Minutes:Seconds |

