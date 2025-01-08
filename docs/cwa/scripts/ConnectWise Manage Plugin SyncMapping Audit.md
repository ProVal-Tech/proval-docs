---
id: 'cwa-email-alerts-for-unsynced-components'
title: 'Email Alerts for Unsynced Components in CW Manage Plugin'
title_meta: 'Email Alerts for Unsynced Components in CW Manage Plugin'
keywords: ['email', 'alerts', 'cwmanage', 'unsynced', 'components']
description: 'This document outlines a script designed to send email alerts when unsynced or unmapped components are detected in the CW Manage plugin. The script runs weekly and checks for various unsynced configurations, generating a ticket in Autotask if issues are found.'
tags: ['configuration', 'notification', 'security', 'report']
draft: false
unlisted: false
---
## Summary

This script is intended to email [alerts@provaltech.com](mailto:alerts@provaltech.com) in the event it finds any necessary component as un-synced or unmapped in the CW Manage plugin.

## Sample Run

It is a client script that should be scheduled to run once a week.  
![Sample Run](5078775/docs/10390938/images/14561594)

## Dependencies

CW Manage Plugin

## Variables

| Name    | Description                                                                                           |
|---------|-------------------------------------------------------------------------------------------------------|
| OutCome | OutCome of the SQL Query looking for all the unsynced/unmapped components of the CW Manage Plugin   |
| Email   | [Alerts@provaltech.com](mailto:Alerts@provaltech.com)                                                |
| Subject | Email's Subject                                                                                       |
| Body    | Email's Body                                                                                          |

## Process

Step 1: A SQL query sets the variable @OutCome@ with the information of all the unsynced/unmapped configurations of CW Manage plugin. It will contain, Unsynced Clients that are not ignored, Unsynced Locations that are not ignored, Unsynced Assets (Only Workstations and Servers), Unassigned Asset Templates, Unmapped Ticket statuses and Priorities for both CWM to CWA and CWA to CWM.  
Step 2: It will not trigger, if everything is fine. Otherwise will generate a ticket in our (ProVal's) Autotask portal.

## Output

- Email

