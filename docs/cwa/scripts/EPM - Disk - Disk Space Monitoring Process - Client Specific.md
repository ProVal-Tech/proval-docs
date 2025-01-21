---
id: '8eb03817-eae4-4ac4-b1c6-d7a629d32ecf'
title: 'Disk Space Check and Cleanup Script'
title_meta: 'Disk Space Check and Cleanup Script for ConnectWise Automate'
keywords: ['disk', 'cleanup', 'threshold', 'ticket', 'monitor']
description: 'This document describes a script designed to check disk space against predefined thresholds in a ConnectWise Automate instance, perform disk cleanup on Windows machines, and create a support ticket if necessary. It includes user parameters, system properties, and a detailed process flow for effective disk management.'
tags: ['cleanup', 'disk', 'windows']
draft: false
unlisted: false
---

## Summary

This script checks the disk space against thresholds defined in the properties of an Automate instance, runs a disk cleanup, and creates a ticket if necessary.

[How to Add/Edit System Properties in ConnectWise Automate](https://proval.itglue.com/DOC-5078775-7604247)

Disk cleanup will only run against Windows machines. When run as an auto-fix from a monitor, the monitor should pass the single drive letter (e.g., C) into the `@fieldname@` variable.

## Sample Run

![Sample Run](../../../static/img/EPM---Disk---Disk-Space-Monitoring-Process---Client-Specific/image_1.png)

## Dependencies

[Agent - Drive Space Check - Client Specific](<../../unsorted/EPM - Disk - Agent - Drive Space Check - Client Specific.md>)

#### User Parameters

| Name        | Example | Required                              | Description                                             |
|-------------|---------|---------------------------------------|---------------------------------------------------------|
| DriveLetter | C       | True (False when running via a monitor) | The drive letter that should have its drive space checked. |

#### System Properties

| Name                      | Example          | Required             | Description                                                                                               |
|---------------------------|------------------|----------------------|-----------------------------------------------------------------------------------------------------------|
| proval_DiskThreshold16-300 | 10 (means 10%)   | True (auto-generated) | The **percentage** threshold for disk space on drives that are greater than or equal to 16GB and less than 300GB. |
| proval_DiskThreshold300-1024 | 30 (means 25GB) | True (auto-generated) | The **gigabyte** threshold for disk space on drives that are greater than or equal to 300GB and less than 1TB. |
| proval_DiskThreshold1024+ | 100 (means 100GB) | True (auto-generated) | The **gigabyte** threshold for disk space on drives that are greater than or equal to 1TB.                 |
| proval_DiskTicketCategory  | 102              | True                 | The ticket category under which tickets will be created.                                                  |

#### Script States

| Name                     | Example  | Description                                                                                      |
|--------------------------|----------|--------------------------------------------------------------------------------------------------|
| TicketNumber`@DriveLetter@` | 123456   | A dynamically named state holding the ticket number for the target ComputerID and Drive.       |

## Process

The following steps are performed:

1. Determine if the context of the script run was from a monitor or not, and set the `@driveletter@` variable as necessary.
2. Create the threshold properties if they do not exist, and set the variables `@threshold16-300@`, `@threshold300-1024@`, and `@threshold1024+@` from the content of the properties.
3. Using the script state `TicketNumber@DriveLetter@`, determine if the script has been run against this machine previously and if a ticket has already been created. If there is an existing ticket that is currently open, jump to the `:TicketOpen` label. Otherwise, start the initial check of the drive. (Note: The `:TicketOpen` label follows the same process as step 5, but instead comments on the existing ticket or closes it if the threshold is not exceeded.)
4. Gather information about the total size of the drive and the current free space of the drive. If `@driveletter@` is the system drive (`@windowsdirectory@ == @driveletter@:/Windows`), then the subscript `Windows Disk Cleanup` will be run.
5. Check if the current disk space (after cleanup) is below the threshold for the respective drive size. If so, generate a report of the largest file sizes for the drive and create a ticket with the report attached. If the space is not below the threshold, then the script will exit.

## Output

The script logs all messages to the script log.

