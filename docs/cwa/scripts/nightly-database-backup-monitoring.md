---
id: '002e4435-9142-4373-a857-6bf91c16d7af'
slug: /002e4435-9142-4373-a857-6bf91c16d7af
title: 'Nightly Database Backup Monitoring'
title_meta: 'Nightly Database Backup Monitoring'
keywords: ['ticket', 'backup', 'failure', 'connectwise', 'automate', 'email', 'notification']
description: 'This document describes a script that creates a ticket in the ProValtech Autotask Portal when the ConnectWise Automate nightly backup fails. It details the process, variables, and system properties involved in the script, ensuring timely notifications for backup issues.'
tags: ['backup', 'connectwise', 'database', 'email']
draft: false
unlisted: false
---

## Summary

This script will create a ticket in our (ProValtech's) Autotask Portal if the ConnectWise Automate nightly backup fails.

## Sample Run

It is a client script and should be scheduled in the Dashboard's Offline Computer.

![Sample Run](../../../static/img/docs/002e4435-9142-4373-a857-6bf91c16d7af/image_1.webp)

## Variables

| Name        | Description                                               |
|-------------|-----------------------------------------------------------|
| BackupAudit | Outcome of the SQL query used to rectify the backup status |
| Subject     | Email's Subject                                          |
| Body        | Email's Body                                             |

#### System Properties

| Name                             | Default                                         | Required | Description                                                                                                                                                     |
|----------------------------------|-------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProVal_Alerts_Email_Address       | [Alerts@provaltech.com](mailto:Alerts@provaltech.com) | True     | By default, the system property `ProVal_Alerts_Email_Address` will be set to [alerts@provaltech.com](mailto:alerts@provaltech.com). This can be changed if these alerts should be directed elsewhere. |

![System Properties](../../../static/img/docs/002e4435-9142-4373-a857-6bf91c16d7af/image_2.webp)

## Process

1. Verifies whether the previous backup was successful or not.  
2. Sends an email to the address(es) saved in the Global Variable `@Email@` if there's a failure in the previous database backup.

**Email Subject:** Nightly Database Backup Failed for %redirhostname%

**Email Body:**

The scheduled nightly MySQL backup for ConnectWise Automate did not appear to run. Every night, a SQL backup job is supposed to create a zip file containing a backup of all the tables for CWA. Please investigate.  

**OR**  

The last nightly MySQL backup for ConnectWise Automate has failed. Every night, a SQL backup job is supposed to create a zip file containing a backup of all the tables for CWA. Please investigate.  

**OR**  

A MySQL backup for ConnectWise Automate was generated last night, but it is lower than 100 MB in size. Typically, these backup files are greater than 1 GB in size, so this generally means the backup failed. Please investigate.

## Output

- Email
