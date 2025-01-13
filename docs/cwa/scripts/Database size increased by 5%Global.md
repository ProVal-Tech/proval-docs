---
id: 'cwa-labtech-database-size-alert'
title: 'Labtech Database Size Alert Script'
title_meta: 'Labtech Database Size Alert Script'
keywords: ['labtech', 'database', 'alert', 'ticket', 'autotask']
description: 'This document outlines a script designed to monitor the Labtech Database size and create a ticket in AutoTask if the database size increases by a specified threshold within the last 24 hours. The script can be scheduled to run hourly and includes details on variables, global parameters, and the process flow for execution.'
tags: ['database', 'alert', 'notification', 'script', 'ticket']
draft: false
unlisted: false
---
## Summary

This script should be scheduled on the `Labtech` group and run once per hour.

This script will create a ticket in our (ProVal's) AutoTask portal if the overall size of the Labtech Database increases by 5% (threshold is flexible) within the last 24 hours (it depends on the frequency of the schedule).

## Sample Run

![Sample Run Image](..\..\..\static\img\Database-size-increased-by-5%Global\image_1.png)

On Prem Partners: preferred way to run/schedule the script: 

![On Prem Partners Image](..\..\..\static\img\Database-size-increased-by-5%Global\image_2.png)

Hosted Partners: Preferred way to run/schedule the script:

![Hosted Partners Image](..\..\..\static\img\Database-size-increased-by-5%Global\image_3.png)

The script can be scheduled against a 24x7 online server. A domain controller is typically a good choice as they tend to have high uptime. **Note: if the agent on the DC is reinstalled, or has a change to the computerid, this script will need to be scheduled again against the new agent.**

## Variables

| Name              | Description                                                   |
|-------------------|---------------------------------------------------------------|
| DBSize            | Current Size of the Labtech Database in Bytes                |
| SizeToCompare     | Stored/Yesterday's Size of the Labtech Database in Bytes     |
| Hours             | Hours since last data/database size was gathered              |
| LargestTables     | Top 10 largest tables along with their size                   |
| CurrentDBSize     | Current Formatted (X GB XX MB) Size of the Labtech Database. |
| PreviousSize      | Stored/Yesterday's Formatted (X GB XX MB) Size of the Labtech Database. |
| Subject           | Email Subject                                                |
| Body              | Email Contents                                               |
| When              | Default Variable, defines the current time                   |

#### Global Parameters

| Name                | Example                                      | Required | Description                                                                                                                                                       |
|---------------------|----------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Email               | [Alerts@provaltech.com](mailto:Alerts@provaltech.com) | True     | The only reason it is defined as global is to provide partners an option, if they so want, to add another email to receive notifications. Otherwise, [Alerts@provaltech.com](mailto:Alerts@provaltech.com) is hard set. |
| ThreshholdInPercent | 5,10,1,3,4                                  | True     | It is the threshold that serves as a numerical indicator for what percentage increase in the database size to alert. By default, 5                             |

#### Script States

| Name                     | Example               | Description                                      |
|--------------------------|-----------------------|--------------------------------------------------|
| Labtech Database Size     | 23882225              | To store the DB size in Bytes for the comparison. |
| DB Size Gather Time      | 7/24/2022 6:59:44 AM | To store the run time of the script.              |

## Process

Step 1: Fetch the current Size of the Labtech Database in Bytes.  
Step 2: Check if the 'Labtech Database Size' script states exists or not, this is to check whether if the script has run before or if it's running for the first time.  
Step 3: For the first run, it will set the values to both of the 'Labtech Database Size' and 'DB Size Gather Time' Script states and exit.  
Step 4: Otherwise, fetches the value from the 'Labtech Database Size' script state and compares with the current size. If the previous size is lower than the current size by more than the @ThreshholdInPercent@% (currently 5%) then it will move to the alert section, otherwise, will refresh the values to both of the script states and exit.  
Step 5: Gather the values for the [@Hours@,@LargestTables@](http://@Hours@,@LargestTables@), [,@CurrentDBSize@](http://,@CurrentDBSize@), and [@PreviousSize@ Variables](http://@PreviousSize@Variables) and Sends an Email out to the address(es) stored in the global variable [@Email@.](http://@Email@.)  
Step 6: Refreshes the values stored in both of the script states and exits.  

Email Subject:  
Database size increased by @SizeToCompare@ Percent within the last @Hours@ Hour

Email Body:  
Labtech Database's size increased by @SizeToCompare@ Percent Within the last @Hours@ Hour.  
Previously the Size was @PreviousSize@ and now it's @CurrentDBSize@.  
Here's the list of 10 largest tables:  
@LargestTables@  

## Output

- Script States
- Email


