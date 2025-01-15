---
id: '7b0a4072-a682-473a-a708-0b8eecc6d83b'
title: 'LT Backup Health Check'
title_meta: 'LT Backup Health Check'
keywords: ['backup', 'alert', 'ticket', 'monitoring', 'proval']
description: 'This document outlines a script designed to monitor the health of LT Backups in a client environment. It alerts users if the last backup update is older than 2 days or if the last backup size is smaller than 99 MB, with the capability to send a ticket to Proval for further action.'
tags: ['backup', 'alert', 'ticket', 'monitoring', 'email']
draft: false
unlisted: false
---
## Summary

This script detects the LT Backup health in the client environment and alerts if the last backup update UTC is older than 2 days or the last backup size is smaller than 99 MB, with the option to send a ticket to Proval.

## Sample Run

![Sample Run](../../../static/img/LT-backup-Health-Checkup/image_1.png)

**Schedule it to run once per day.**  
**Remove "Nightly Database Backup Monitoring*[Global]" script from the schedule as we don't want two emails for the same issue.**

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name              | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| LTOldBackup       | Stores 1 or 0 based on backup detected older than 2 days or not respectively                  |
| LTBackupSizeIssue | Stores 1 or 0 based on last backup size whether smaller than 99 MB or not respectively.       |

#### Global Parameters

| Name           | Example | Required | Description                                                                                   |
|----------------|---------|----------|-----------------------------------------------------------------------------------------------|
| TicketCreation  | 1 or 0 | False    | 1 - Send Email to [Alerts@provaltech.com](mailto:Alerts@provaltech.com) <br> 0 - No Email <br> Default: 1 |

#### Script States

| Name             | Example  | Description                                                                                      |
|------------------|----------|--------------------------------------------------------------------------------------------------|
| LTBackupChecker   | 825567   | It stores the ticket id from future ticket commenting to reduce the noise of tickets.           |

## Process

This script detects whether the LT backup ran successfully or not by observing the backup's last execution date not older than 2 days or current file size older than 99 MB. If any of the above conditions match, then it will send an email to [Alerts@provaltech.com](mailto:Alerts@provaltech.com), to create a high priority ticket in our AutoTask.

## Output

- Script log
- Email






